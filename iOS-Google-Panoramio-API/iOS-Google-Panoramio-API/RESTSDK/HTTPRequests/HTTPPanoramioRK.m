//
//  HTTPPanoramioRK.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 31/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//



#import <RestKit/RestKit.h>
#import "HTTPPanoramioRK.h"
#import "L3SDKPanoramioPhoto.h"
#import "RESTRoutes.h"
#import "HTTPRequestCallbackProtocol.h"
#import "RKHelper.h"
#import "PanoramioPhotoRKHelper.h"
#import "PanoramioPhotoMapRK.h"
@implementation HTTPPanoramioRK

+(void)getPhotosWithDelegate:(id)delegate andRESTPath:(NSString*)path{
    @try {
        
        RKObjectManager *objectManager = [RKObjectManager sharedManager];
        
        
        [objectManager getObject:nil path:path
                      parameters:nil
                         success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
                             
                             if (delegate != NULL && [delegate respondsToSelector:@selector(HTTPRequestCallback_Success:withSender:)]) {
                                 [delegate HTTPRequestCallback_Success:
                                  [PanoramioPhotoRKHelper getObjectFromJSONString:operation.HTTPRequestOperation.responseString]
                                                            withSender:self
                                  ];
                             }
                             
                             
                         }
                         failure:^(RKObjectRequestOperation *operation, NSError *error) {
                             
                             if (delegate != NULL && [delegate respondsToSelector:@selector(HTTPRequestCallback_Error:withSender:)]) {
                                 
                                 [delegate HTTPRequestCallback_Error:
                                        error
                                        withSender:self
                                  ];
                             }
                             
                         }];
        
        
        
        
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

@end
