//
//  RESTSDK.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//




#import <RestKit/RestKit.h>
#import "RESTSDK.h"
#import "RESTSDKConfig.h"
#import "PanoramioPhotoRKHelper.h"

@implementation RESTSDK
@synthesize configuration;


+ (instancetype)sharedInstance
{
    static RESTSDK *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RESTSDK alloc] init];
    });
    return sharedInstance;
}

-(void)startWithConfiguration:(RESTSDKConfig*)configuration{
    
    
    @try {
        self.configuration=configuration;
        
        //Start RestKit Configuration
        RKLogConfigureByName("RestKit/Network*", RKLogLevelTrace);
        RKLogConfigureByName("RestKit/ObjectMapping", RKLogLevelTrace);
        
        //let AFNetworking manage the activity indicator
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
        
        // Initialize HTTPClient
        NSURL *baseURL = [NSURL URLWithString:self.configuration.remoteHost];
        AFHTTPClient* client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
        
        // HACK: Set User-Agent to Mac OS X so that Twitter will let us access the Timeline
        [client setDefaultHeader:@"User-Agent" value:[NSString stringWithFormat:@"%@/%@ (Mac OS X %@)", [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleExecutableKey] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleIdentifierKey], [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"] ?: [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey], [[NSProcessInfo processInfo] operatingSystemVersionString]]];
        
        //we want to work with JSON-Data
        [client setDefaultHeader:@"Accept" value:RKMIMETypeJSON];
        
        
        // Initialize RestKit
        RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
        
        NSArray*descriptors;
        //PanoramioPhoto descriptors
        descriptors=[PanoramioPhotoRKHelper getResponseDescriptors];
        //add descriptors
        [self addResponseDescriptors:descriptors toObjectManager:objectManager];
        

        
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

-(void)addResponseDescriptors:(NSArray*)descriptors toObjectManager:(RKObjectManager*)objectManager{
    
    for (int i=0; i<descriptors.count;i++){
        RKResponseDescriptor*descriptor=(RKResponseDescriptor*)[descriptors objectAtIndex:i];
        [objectManager addResponseDescriptor:descriptor];
    }
    
}

@end
