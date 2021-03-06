//
//  RACObjCRuntime.m
//  ReactiveCocoa
//
//  Created by Cody Krieger on 5/19/12.
//  Copyright (c) 2012 GitHub, Inc. All rights reserved.
//

#import "RACObjCRuntime.h"

@implementation RACObjCRuntime

+ (void)findMethod:(SEL)method inProtocol:(Protocol *)protocol outMethod:(struct objc_method_description *)outMethod {
    *outMethod = protocol_getMethodDescription(protocol, method, NO, YES);
}

+ (const char *)getMethodTypesForMethod:(SEL)method inProtocol:(Protocol *)protocol {
    struct objc_method_description desc;
    [self findMethod:method inProtocol:protocol outMethod:&desc];
    return desc.types;
}

+ (BOOL)method:(SEL)method existsInProtocol:(Protocol *)protocol {
    struct objc_method_description desc;
    [self findMethod:method inProtocol:protocol outMethod:&desc];
    return desc.name != NULL;
}

@end
