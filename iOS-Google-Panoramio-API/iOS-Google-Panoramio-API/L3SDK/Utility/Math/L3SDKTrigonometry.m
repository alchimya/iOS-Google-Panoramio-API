//
//  L3SDKTrigonometry.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKTrigonometry.h"

@implementation L3SDKTrigonometry


+(double) degrees2Radians:(double) degrees {
    return degrees * M_PI / 180.0;
}

+(double) radians2Degrees:(double) radians {
    return radians * 180.0 / M_PI;
}

@end
