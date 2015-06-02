//
//  L3SDKWGS84.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//World Geodetic System 1984 const
//http://en.wikipedia.org/wiki/World_Geodetic_System
@interface L3SDKWGS84 : NSObject


+(double) WGS84EarthRadiusAtLatitude:(double) latitude;


 //Semi-major axis (m)
+(double) WGS84_a;
 //Semi-minor axis (m)
+(double) WGS84_b;
 //Inverse flattening
+(double) WGS84_f;
//geocentric gravitational constant
+(double) WGS84_u;

@end
