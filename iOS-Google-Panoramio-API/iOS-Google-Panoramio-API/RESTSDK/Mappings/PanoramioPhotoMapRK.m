//
//  PanoramioPhotoMap.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 31/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//



#import <RestKit/RestKit.h>
#import "PanoramioPhotoMapRK.h"
#import "L3SDKPanoramioPhoto.h"


@implementation PanoramioPhotoMapRK


+(RKObjectMapping*)getObjectMapping{
    @try {
        
        // Setup our object mappings
        RKObjectMapping *map = [RKObjectMapping mappingForClass:[L3SDKPanoramioPhoto class]];
        [map addAttributeMappingsFromDictionary:@{
                                                  @"height" : @"height",
                                                  @"width" : @"width",
                                                  @"latitude" : @"latitude",
                                                  @"longitude" : @"longitude",
                                                  @"owner_id" : @"ownerId",
                                                  @"owner_name" : @"ownerName",
                                                  @"owner_url" : @"ownerUrl",
                                                  @"photo_file_url" : @"photoFileUrl",
                                                  @"photo_id" : @"photoId",
                                                  @"photo_title" : @"photoTitle",
                                                  @"photo_url" : @"photoUrl",
                                                  @"upload_date" : @"uploadDate"
                                                  }];
        
        
        return map;
    }
    @catch (NSException *exception) {
        @throw exception;
    }
    
}

@end