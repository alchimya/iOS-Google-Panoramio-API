//
//  HTTPPanoramioRK.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 31/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>


@class L3SDKPanoramioPhoto;
@interface HTTPPanoramioRK : NSObject
+(void)getPhotosWithDelegate:(id)delegate andRESTPath:(NSString*)path;
@end