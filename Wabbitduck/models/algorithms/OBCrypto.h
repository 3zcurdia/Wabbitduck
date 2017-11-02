//
//  OBChecksums.h
//  Wabbitduck
//
//  Created by Luis Ezcurdia on 11/2/17.
//  Copyright © 2017 Luis Ezcurdia. All rights reserved.
//

#ifndef OBCrypto_h
#define OBCrypto_h
#import <CommonCrypto/CommonDigest.h>
#import <Foundation/Foundation.h>

@interface OBCrypto : NSObject
+(id) shared;
-(NSString *) sha1: (NSString *)string;
-(NSString *) sha256: (NSString *)string;
-(NSString *) base64: (NSString *)string;
@end

#endif /* OBCrypto_h */
