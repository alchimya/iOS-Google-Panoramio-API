//
//  RESTSDKConfig.h
//  iOS-RestKit-Node-Express-Client
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//it reoresents a class with some attributes to configure the backend access

@interface RESTSDKConfig : NSObject


@property (nonatomic,strong)NSString*remoteHost;

-(id)initWithRemoteHost:(NSString*)host;

@end
