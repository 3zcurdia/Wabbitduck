//
//  OBJsonParse.m
//  Wabbit
//
//  Created by Luis Ezcurdia on 11/6/17.
//  Copyright © 2017 Luis Ezcurdia. All rights reserved.
//

#import "OBCountry.h"
#import "OBJsonParse.h"

@implementation OBJsonParse
+(id) shared {
    static OBJsonParse *sharedOBJsonParse = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedOBJsonParse = [[self alloc] init];
    });
    return sharedOBJsonParse;
}

- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

- (NSArray *) parseAllCountriesFrom: (NSData*)jsonData
{
    NSArray *arr = [self parseArray:jsonData];
    NSMutableArray *out = [[NSMutableArray alloc] initWithCapacity:0];
    for (id object in arr) {
        if ([object isKindOfClass:[NSDictionary class]])
        {
            NSDictionary* dict = object;
            OBCountry* country = [[OBCountry alloc] initWithISO:dict[@"iso"] name:dict[@"name"] languanges:dict[@"languages"]];
            [out addObject:country];
        }
    }
    return out;
}

- (NSArray *) parseArray: (NSData*)jsonData
{
    NSError *error = nil;
    id object = [NSJSONSerialization
                 JSONObjectWithData:jsonData
                 options:0
                 error:&error];
    
    if(error) { NSLog(@"%@", error); }
    
    if([object isKindOfClass:[NSArray class]])
    {
        NSArray *results = object;
        return results;
    }
    else
    {
        NSLog(@"No Array found on source");
        return @[];
    }
}
@end
