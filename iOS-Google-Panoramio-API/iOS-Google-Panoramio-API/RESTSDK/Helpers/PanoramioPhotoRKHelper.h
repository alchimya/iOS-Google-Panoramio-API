//
//  PanoramioRKHelper.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 31/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping;
@class RKResponseDescriptor;
@class L3SDKPanoramioPhoto;
@interface PanoramioPhotoRKHelper : NSObject
+(NSArray*)getResponseDescriptors;
+(L3SDKPanoramioPhoto*)getObjectFromJSONString:(NSString*)jsonString;
@end
