//
//  L3SDKPanoramioAPIOptions.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
//for a complete description of these params see
//http://www.panoramio.com/api/data/api.html

typedef NS_ENUM(NSInteger, L3SDKPanoramioAPIOptionsSet) {
    L3SDKPanoramioAPIOptionsSetPublic,
    L3SDKPanoramioAPIOptionsSetFull,
    L3SDKPanoramioAPIOptionsSetUserID
};
typedef NS_ENUM(NSInteger, L3SDKPanoramioAPIOptionsSize) {
    L3SDKPanoramioAPIOptionsSizeOriginal,
    L3SDKPanoramioAPIOptionsSizeMedium,
    L3SDKPanoramioAPIOptionsSizeSmall,
    L3SDKPanoramioAPIOptionsSizeThumbnail,
    L3SDKPanoramioAPIOptionsSizeSquare,
    L3SDKPanoramioAPIOptionsSizeMiniSquare
};
typedef NS_ENUM(NSInteger, L3SDKPanoramioAPIOptionsOrder) {
    L3SDKPanoramioAPIOptionsOrderPopularity,
    L3SDKPanoramioAPIOptionsOrderUploadDate
};

@interface L3SDKPanoramioAPIOptions : NSObject
@property (nonatomic,assign)L3SDKPanoramioAPIOptionsSet set;
@property (nonatomic,assign)L3SDKPanoramioAPIOptionsSize size;
@property (nonatomic,assign)L3SDKPanoramioAPIOptionsOrder order;
@property (nonatomic,assign)int from;
@property (nonatomic,assign)int to;
@property (nonatomic,assign)BOOL mapFilter;
@property (nonatomic,assign)CLLocationCoordinate2D pointCoordinate;
//km
@property (nonatomic,assign)double sideSquarePanoramio;
@end
