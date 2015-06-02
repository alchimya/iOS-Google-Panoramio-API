//
//  ViewController.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "ViewController.h"
#import "L3SDKPanoramioHelper.h"
#import "L3SDKTextField.h"
#import "L3SDKAlertView.h"

#import "RKHelper.h"
#import "L3SDKPanoramioPhoto.h"
#import "HTTPPanoramioRK.h"

@interface ViewController ()
@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) IBOutlet L3SDKTextField*txtSuqareSideAroundMe;
@property (nonatomic,strong) IBOutlet L3SDKTextField*txtSuqareSide;
@property (nonatomic,strong) IBOutlet L3SDKTextField*txtLatitude;
@property (nonatomic,strong) IBOutlet L3SDKTextField*txtLongitude;
@property (nonatomic,strong) IBOutlet L3SDKImagesSlideShow*slideShow;
@property (nonatomic,strong) IBOutlet UILabel*photoTitle;
@property (nonatomic,strong) NSArray*panoramioPhotos;

-(IBAction)getImagesByCurrentLocation:(id)sender;
-(IBAction)getImagesByCoordinates:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLocationManager];

    self.txtSuqareSideAroundMe.validationType=L3SDKTextFieldValidationTypeInteger;
    self.txtSuqareSideAroundMe.validationMessage=@"Please insert a valid square side";
    
    self.txtSuqareSide.validationType=L3SDKTextFieldValidationTypeInteger;
    self.txtSuqareSide.validationMessage=@"Please insert a valid square side";
    
    self.txtLatitude.validationType=L3SDKTextFieldValidationTypeDecimal;
    self.txtLatitude.validationMessage=@"Please insert a valid latitude";
    
    self.txtLongitude.validationType=L3SDKTextFieldValidationTypeDecimal;
    self.txtLongitude.validationMessage=@"Please insert a valid longitude";
    
    self.slideShow.delegate=self;
    self.slideShow.interval=3;
}
-(IBAction)getImagesByCurrentLocation:(id)sender{
    
    
    if ([self.txtSuqareSideAroundMe validate]) {
        //init a panoramio options object
        L3SDKPanoramioAPIOptions*options=[[L3SDKPanoramioAPIOptions alloc]init];
        //sets panoramio coordinates and a side of a square (km)
        //for a complete description of the Panoramio API params (options) see
        //http://www.panoramio.com/api/data/api.html
        options.sideSquarePanoramio=[self.txtSuqareSideAroundMe.text doubleValue];
        options.pointCoordinate=self.locationManager.location.coordinate;
        
        //gets a panoramio api rest path with options
        NSString*restPath=[L3SDKPanoramioHelper getPanoramioRESTPathWithOptions:options];
        
        //consume a panoramio rest service with RestKit
        //for further informations see how to use Restkit with iOS by another tutorial
        //https://github.com/alchimya/iOS-RestKit-Node-Express
        [HTTPPanoramioRK getPhotosWithDelegate:self andRESTPath:restPath];
        
    }
    
}
-(IBAction)getImagesByCoordinates:(id)sender{
    
    if ([self.txtSuqareSide validate] &&
        [self.txtLatitude validate] &&
        [self.txtLongitude validate])
    {
        //makes CLLocationCoordinate2D with userinput data
        CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake(
                                [self.txtLatitude.text doubleValue],
                                [self.txtLongitude.text doubleValue]);

        //init a panoramio options object
        L3SDKPanoramioAPIOptions*options=[[L3SDKPanoramioAPIOptions alloc]init];
        //sets panoramio coordinates and a side of a square (km)
        //for a complete description of the Panoramio API params (options) see
        //http://www.panoramio.com/api/data/api.html
        options.sideSquarePanoramio=[self.txtSuqareSide.text doubleValue];
        options.pointCoordinate=coordinate;
        
        //gets a panoramio api rest path with options
        NSString*restPath=[L3SDKPanoramioHelper getPanoramioRESTPathWithOptions:options];
        
        //consume a panoramio rest service with RestKit
        //for further informations see how to use Restkit with iOS by another tutorial
        //https://github.com/alchimya/iOS-RestKit-Node-Express
        [HTTPPanoramioRK getPhotosWithDelegate:self andRESTPath:restPath];
    }
    
}

#pragma mark HTTPRequestCallbackDelegate
- (void)HTTPRequestCallback_Success:(id)response withSender:(id) sender{
    
    //RestKit callback
    //response params is an array of L3SDKPanoramioPhoto object
    //with this procedure we add path of panoramio images on a slideshow
    //see how to use slideshow here
    //https://github.com/alchimya/iOS-Images-Slideshow
    
    self.panoramioPhotos=response;
    self.slideShow.images=[[NSMutableArray alloc]initWithCapacity:10];
    
    for (L3SDKPanoramioPhoto*photo in self.panoramioPhotos){
        [self.slideShow.images addObject:photo.photoFileUrl];
    }
    if ([self.panoramioPhotos count]==0) {
        [UIAlertView warning:@"No images found"];
    }else {
        [self.slideShow start];
    }
    
}

- (void)HTTPRequestCallback_Error:(NSError*)error withSender:(id) sender{
    
    if ([self.panoramioPhotos count]==0) {
        [UIAlertView warning:[error localizedDescription]];
    }
    
}

#pragma mark L3SDKSlideShowDelegate
- (void)L3SDKImagesSlideShow_NextImageAtIndex:(int)index withSender:(id) sender{
    L3SDKPanoramioPhoto*photo=(L3SDKPanoramioPhoto*)[self.panoramioPhotos objectAtIndex:index];
    self.photoTitle.text=photo.photoTitle;
    //NSLog(@"%@",photo.photoTitle);
}

-(void)setupLocationManager{
    //see Info.plist NSLocationWhenInUseUsageDescription

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone; // whenever we move
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters; // 10 m
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
