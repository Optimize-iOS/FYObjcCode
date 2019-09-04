//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>

@interface FYObject : NSObject
@end

@implementation FYObject

/*
+ (void)load {
 NSLog(@"Method: <%p, %s> in class: %@", _cmd, __func__, NSStringFromClass(self));
}*/


+ (void)initialize {
    NSLog(@"Method: <%p, %s> in class: %@", _cmd, __func__, NSStringFromClass(self));
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        __unused FYObject *obj = [[FYObject alloc] init];
        
        NSLog(@"Hello, World!");
    }
    return 0;
}



