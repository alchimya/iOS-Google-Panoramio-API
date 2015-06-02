//
//  L3SDKPanoramioPhoto.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 30/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface L3SDKPanoramioPhoto : NSObject
@property (nonatomic,assign)int height;
@property (nonatomic,assign)int width;
@property (nonatomic,assign)float latitude;
@property (nonatomic,assign)float longitude;
@property (nonatomic,assign)int ownerId;
@property (nonatomic,strong)NSString*ownerName;
@property (nonatomic,strong)NSString*ownerUrl;
@property (nonatomic,strong)NSString*photoFileUrl;
@property (nonatomic,assign)int photoId;
@property (nonatomic,strong)NSString*photoTitle;
@property (nonatomic,strong)NSString*photoUrl;
@property (nonatomic,strong)NSString*uploadDate;

@end
