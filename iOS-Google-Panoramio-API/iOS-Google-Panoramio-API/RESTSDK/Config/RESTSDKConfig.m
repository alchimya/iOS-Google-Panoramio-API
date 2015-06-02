//
//  RESTSDKConfig.m
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "RESTSDKConfig.h"


@implementation RESTSDKConfig

@synthesize remoteHost;

-(id)initWithRemoteHost:(NSString*)host{
    
    self=[super init];
    if (self) {
        self.remoteHost=host;
        return self;
    }
    return self;
}

@end
