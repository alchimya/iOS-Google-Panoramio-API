//
//  L3SDKPanoramioPhotos.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 30/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

//for a complete description of this object strucrure see
//http://www.panoramio.com/api/data/api.html

@class L3SDKPanoramioMapLocation;
@interface L3SDKPanoramioPanoramas : NSObject
@property (nonatomic,assign) int count;
@property (nonatomic,assign)BOOL hasMore;
@property (nonatomic,strong)L3SDKPanoramioMapLocation*mapLocation;
@property (nonatomic,strong) NSArray*photos;
@end
