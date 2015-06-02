//
//  HTTPRequestCallbackProtocol.h
//  iOS-Google-Panoramio-API
//
//  Created by Domenico Vacchiano on 12/05/15.
//  Copyright (c) 2015 DomenicoVacchiano. All rights reserved.
//

#ifndef iOS_Google_Panoramio_API_HTTPRequestCallbackProtocol_h
#define iOS_Google_Panoramio_API_HTTPRequestCallbackProtocol_h


@protocol HTTPRequestCallbackDelegate <NSObject>

@optional
- (void)HTTPRequestCallback_Success:(id)response withSender:(id) sender;
- (void)HTTPRequestCallback_Error:(NSError*)error withSender:(id) sender;
@end

#endif
