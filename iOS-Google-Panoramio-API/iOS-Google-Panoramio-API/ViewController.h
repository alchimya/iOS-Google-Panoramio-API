//
//  ViewController.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HTTPRequestCallbackProtocol.h"
#import "L3SDKImagesSlideShow.h"
@interface ViewController : UIViewController <CLLocationManagerDelegate,
                                                HTTPRequestCallbackDelegate,
                                                L3SDKImagesSlideShowDelegate>


@end

