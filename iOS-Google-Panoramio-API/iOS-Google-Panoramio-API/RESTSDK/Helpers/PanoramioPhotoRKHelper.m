//
//  PanoramioRKHelper.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 31/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//



#import <RestKit/RestKit.h>
#import "PanoramioPhotoRKHelper.h"
#import "L3SDKPanoramioPhoto.h"
#import "RESTRoutes.h"
#import "RKHelper.h"
#import "PanoramioPhotoMapRK.h"
@implementation PanoramioPhotoRKHelper

+(NSArray*)getResponseDescriptors{
    @try {
        
        RKObjectMapping*mapping=[PanoramioPhotoMapRK getObjectMapping];
        
        // Register our mappings with the provider using a response descriptor
        RKResponseDescriptor *getPanoramioPhotoDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                                                        method:RKRequestMethodGET
                                                                                                   pathPattern:ROUTE_PANORAMIO_PHOTOS_GEST
                                                                                                       keyPath:nil
                                                                                                   statusCodes:[NSIndexSet indexSetWithIndex:200]];
        
        
        
        return [[NSArray alloc] initWithObjects:
                getPanoramioPhotoDescriptor, nil];
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}


+(L3SDKPanoramioPhoto*)getObjectFromJSONString:(NSString*)jsonString{
    
    @try {
        RKMappingResult*result=nil;
        
        result=[RKHelper mapJSONString:jsonString
                               forType:[L3SDKPanoramioPhoto class] andMappings:[self getResponseMappingsDictonary]];
        if (result) {
            return (L3SDKPanoramioPhoto*)[result.dictionary objectForKey:@"photos"];
        }
        return nil;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
}
//private
+(NSDictionary*)getResponseMappingsDictonary{
    return @{  @"photos": [PanoramioPhotoMapRK getObjectMapping] };
}


@end
