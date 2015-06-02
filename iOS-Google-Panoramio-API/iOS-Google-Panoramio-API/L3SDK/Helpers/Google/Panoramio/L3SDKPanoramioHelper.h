//
//  L3SDKPanoramioHelper.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "L3SDKPanoramioAPIOptions.h"

#define PANORAMIO_BASE_URL @"http://www.panoramio.com"

@interface L3SDKPanoramioHelper : NSObject

//it makes a MKMapRect with coordinate and a side of square (Km)
+(MKMapRect)mapRectWithCoordinate:(CLLocationCoordinate2D)coordinate andSideAreaKm:(double)sideKm;
//it makes a panoramio API url by using options params (see L3SDKPanoramioAPIOptions)
+(NSString*)getPanoramioAPIUrlWithOptions:(L3SDKPanoramioAPIOptions*)options;
//it makes a panoramio API rest path by using options params (see L3SDKPanoramioAPIOptions)
+(NSString*)getPanoramioRESTPathWithOptions:(L3SDKPanoramioAPIOptions*)options;
@end
