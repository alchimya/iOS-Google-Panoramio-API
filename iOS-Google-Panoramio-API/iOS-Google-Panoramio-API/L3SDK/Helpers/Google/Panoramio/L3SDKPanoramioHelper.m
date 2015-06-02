//
//  L3SDKPanoramioHelper.m
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 28/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import "L3SDKPanoramioHelper.h"
#import "L3SDKTrigonometry.h"
#import "L3SDKWGS84.h"



@interface L3SDKPanoramioHelper ()
// see L3SDKPanoramioAPIOptions
+(NSString*)getSetStringFromOptionValue:(L3SDKPanoramioAPIOptionsSet)inputValue;
+(NSString*)getSetStringFromOptionValue:(L3SDKPanoramioAPIOptionsSet)inputValue andOutputValueCondition:(NSString*)outputValue;
+(NSString*)getSizeStringFromOptionValue:(L3SDKPanoramioAPIOptionsSize) inputValue;
+(NSString*)getOrderStringFromOptionValue:(L3SDKPanoramioAPIOptionsOrder)inputValue;
+(NSString*)getMapFilterStringFromOptionValue: (BOOL)inputValue;
+(NSString*)getQueryStringWithOptions:(L3SDKPanoramioAPIOptions*)options;
@end

@implementation L3SDKPanoramioHelper

+(MKMapRect)mapRectWithCoordinate:(CLLocationCoordinate2D)coordinate andSideAreaKm:(double)sideKm{
    
    double halfSideInKm=sideKm/2;
    //gets radians from degrees
    double lat = [L3SDKTrigonometry degrees2Radians:(coordinate.latitude) ] ;
    double lon =[L3SDKTrigonometry degrees2Radians:coordinate.longitude];
    double halfSide = 1000*halfSideInKm;
    
    //gets WGS84 earth radius at latitude
    double radius =[L3SDKWGS84 WGS84EarthRadiusAtLatitude:lat];
    double pradius = radius*cos(lat);
    
    double latMin = lat - halfSide/radius;
    double latMax = lat + halfSide/radius;
    double lonMin = lon - halfSide/pradius;
    double lonMax = lon + halfSide/pradius;
    return MKMapRectMake(
                         [L3SDKTrigonometry radians2Degrees:latMin],
                         [L3SDKTrigonometry radians2Degrees:lonMin],
                         [L3SDKTrigonometry radians2Degrees:latMax],
                         [L3SDKTrigonometry radians2Degrees:lonMax]);
    
}


+(NSString*)getPanoramioAPIUrlWithOptions:(L3SDKPanoramioAPIOptions*)options{
    
    return [NSString stringWithFormat:@"%@%@",
            PANORAMIO_BASE_URL,
            [self getPanoramioRESTPathWithOptions:options]
            ];

}
+(NSString*)getPanoramioRESTPathWithOptions:(L3SDKPanoramioAPIOptions*)options{

    return [NSString stringWithFormat:@"/map/get_panoramas.php?%@",
            [self getQueryStringWithOptions:options]
            ];

}

+(NSString*)getSetStringFromOptionValue:(L3SDKPanoramioAPIOptionsSet)inputValue{

    return [self getSetStringFromOptionValue:inputValue andOutputValueCondition:nil];
}
+(NSString*)getSetStringFromOptionValue:(L3SDKPanoramioAPIOptionsSet)inputValue andOutputValueCondition:(NSString*)outputValue{
    
    //for a complete description of this param see
    //http://www.panoramio.com/api/data/api.html
    
    NSString*ret;
    
    switch (inputValue) {
        case L3SDKPanoramioAPIOptionsSetFull:
            ret=@"full";
            break;
        case L3SDKPanoramioAPIOptionsSetPublic:
            ret=@"public";
        case L3SDKPanoramioAPIOptionsSetUserID:
            ret=outputValue;
        default:
            ret=@"full";
            break;
    }
    return ret;
    
    
}


+(NSString*)getSizeStringFromOptionValue:(L3SDKPanoramioAPIOptionsSize) inputValue{
    
    //for a complete description of this param see
    //http://www.panoramio.com/api/data/api.html
    
    NSString*ret;
    switch (inputValue) {
        case L3SDKPanoramioAPIOptionsSizeMedium:
            ret=@"medium";
            break;
        case L3SDKPanoramioAPIOptionsSizeMiniSquare:
            ret=@"mini_square";
            break;
        case L3SDKPanoramioAPIOptionsSizeOriginal:
            ret=@"original";
            break;
        case L3SDKPanoramioAPIOptionsSizeSmall:
            ret=@"small";
            break;
        case L3SDKPanoramioAPIOptionsSizeSquare:
            ret=@"square";
            break;
        case L3SDKPanoramioAPIOptionsSizeThumbnail:
            ret=@"thumbnail";
            break;
        default:
            ret=@"medium";
            break;
    }
    
    return ret;
}
+(NSString*)getOrderStringFromOptionValue:(L3SDKPanoramioAPIOptionsOrder)inputValue{
    
    //for a complete description of this param see
    //http://www.panoramio.com/api/data/api.html
    
    NSString*ret;
    switch (inputValue) {
        case L3SDKPanoramioAPIOptionsOrderPopularity:
            ret=@"popularity";
            break;
        case L3SDKPanoramioAPIOptionsOrderUploadDate:
            ret=@"upload_date";
            break;
        default:
            ret=@"popularity";
            break;
    }
    return ret;
}
+(NSString*)getMapFilterStringFromOptionValue: (BOOL)inputValue{
    //for a complete description of this param see
    //http://www.panoramio.com/api/data/api.html
    
    if (inputValue) {
        return @"true";
    }
    return @"false";
}
+(NSString*)getQueryStringWithOptions:(L3SDKPanoramioAPIOptions*)options{

    //for a complete description of these params see
    //http://www.panoramio.com/api/data/api.html
    
    MKMapRect coord=[self mapRectWithCoordinate:
                     options.pointCoordinate
                                  andSideAreaKm:options.sideSquarePanoramio];

    
    return [NSString stringWithFormat:
            @"order=%@&"
            @"set=%@&"
            @"from=%d&"
            @"to=%d&"
            @"minx=%f&"
            @"miny=%f&"
            @"maxx=%f&"
            @"maxy=%f&"
            @"size=%@",
            [self getOrderStringFromOptionValue:options.order],
            [self getSetStringFromOptionValue:options.set],
            options.from,
            options.to,
            coord.origin.y,coord.origin.x,
            coord.size.height,coord.size.width,
            [self getSizeStringFromOptionValue:options.size]
            ];

    
    
}



@end
