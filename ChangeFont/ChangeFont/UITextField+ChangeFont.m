//
//  UITextField+ChangeFont.m
//  ChangeFont
//
//  Created by Magic on 2018/2/8.
//  Copyright © 2018年 magic. All rights reserved.
//

#import "UITextField+ChangeFont.h"
#import <objc/message.h>

static NSString * const fontName = @"FZLBJW--GB1-0";
static const NSInteger normalTag = 999;
@implementation UITextField (ChangeFont)
+ (void)load
{
    NSLog(@"load");
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Method sysMethod = class_getInstanceMethod([self class], @selector(willMoveToSuperview:));
        Method swizzMethod = class_getInstanceMethod([self class], @selector(zg_willMoveToSuperview:));
        
        BOOL isAdd = class_addMethod([self class], @selector(willMoveToSuperview:), method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        if (isAdd) {
            class_replaceMethod([self class], @selector(zg_willMoveToSuperview:), method_getImplementation(sysMethod), method_getTypeEncoding(sysMethod));
        }else
        {
            method_exchangeImplementations(sysMethod, swizzMethod);
        }
    });
}

- (void)zg_willMoveToSuperview:(UIView *)superView
{
    [self zg_willMoveToSuperview:superView];
    if (self.tag == normalTag) return;
    if ([UIFont fontNamesForFamilyName:fontName]) {
        self.font = [UIFont fontWithName:fontName size:self.font.pointSize];
    }
    
}
@end
