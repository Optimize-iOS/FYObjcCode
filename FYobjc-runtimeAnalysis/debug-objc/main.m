//
//  main.m
//  debug-objc
//
//  Created by Closure on 2018/12/4.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}


@interface FYObject : NSObject
@end

@implementation FYObject

+ (void)load {
    NSLog(@"%@ class in %s", NSStringFromClass(self), __func__);
}

@end
