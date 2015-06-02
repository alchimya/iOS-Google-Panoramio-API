//
//  L3SDKWGS84.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKWGS84.h"

@implementation L3SDKWGS84


//helper methods
+(double) WGS84EarthRadiusAtLatitude:(double) latitude {
    
    double An = pow([self WGS84_a], 2) * cos(latitude);
    double Bn = pow([self WGS84_b], 2) * sin(latitude);
    double Ad = [self WGS84_a] * cos(latitude);
    double Bd = [self WGS84_b] * sin(latitude);
    return sqrt( (An*An + Bn*Bn)/(Ad*Ad + Bd*Bd) );
    
}

//geocentric gravitational constant
+(double) WGS84_a{
    return 6378137.0;
}
+(double) WGS84_b{
    return 6356752.3142;
}
+(double) WGS84_f{
    return 1/298.257223563;
}
+(double) WGS84_u{
    return 3986005 * pow(10,8);
}

@end
