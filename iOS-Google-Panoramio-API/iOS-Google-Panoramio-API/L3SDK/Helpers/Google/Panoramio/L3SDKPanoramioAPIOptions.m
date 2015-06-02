//
//  L3SDKPanoramioAPIOptions.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKPanoramioAPIOptions.h"

@implementation L3SDKPanoramioAPIOptions
@synthesize set;
@synthesize size;
@synthesize from;
@synthesize to;
@synthesize mapFilter;
@synthesize pointCoordinate;
@synthesize sideSquarePanoramio;

-(id)init{

    self=[super init];
    if (self) {
        self.set=L3SDKPanoramioAPIOptionsSetFull;
        self.size=L3SDKPanoramioAPIOptionsSizeMedium;
        self.order=L3SDKPanoramioAPIOptionsOrderPopularity;
        self.from=0;
        self.to=20;
        self.mapFilter=YES;
    }
    return self;
}

@end
