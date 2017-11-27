//
//  RTCleanNavigationBar.m
//  RTCleanNavigationBar
//
//  Created by Aleksandar Vacić on 29.8.14..
//  Copyright (c) 2014. Radiant Tap. All rights reserved.
//

#import "RTCleanNavigationBar.h"

@implementation RTCleanNavigationBar

- (instancetype)init {
    
    self = [super init];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit {
    
    /*
     //	border/shadow is actually UIImageView
     //	inside _UINavigationBarBackground, with frame attached to bottom edge, 0.5f height
     
     //	just after creation of UINavigationController, in App Delegate
     <RTCleanNavigationBar: 0x10f90a3b0; baseClass = UINavigationBar; frame = (0 0; 0 0); opaque = NO; gestureRecognizers = <NSArray: 0x10f9316d0>; layer = <CALayer: 0x10f90ad90>>
     | <_UINavigationBarBackground: 0x10f92f2e0; frame = (0 0; 0 0); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x10f92f5a0>>
     |    | <UIImageView: 0x10f92f970; frame = (0 0; 0 0.5); userInteractionEnabled = NO; layer = <CALayer: 0x10f92fb70>>
     
     //	example hierarchy in root View Controller, in viewDidAppear
     <RTCleanNavigationBar: 0x10f90a3b0; baseClass = UINavigationBar; frame = (0 20; 320 44); opaque = NO; autoresize = W; gestureRecognizers = <NSArray: 0x10f9316d0>; layer = <CALayer: 0x10f90ad90>>
     | <_UINavigationBarBackground: 0x10f92f2e0; frame = (0 -20; 320 64); opaque = NO; autoresize = W; userInteractionEnabled = NO; layer = <CALayer: 0x10f92f5a0>>
     |    | <_UIBackdropView: 0x10d144960; frame = (0 0; 320 64); opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <_UIBackdropViewLayer: 0x10d142f60>>
     |    |    | <_UIBackdropEffectView: 0x10d145700; frame = (0 0; 320 64); clipsToBounds = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CABackdropLayer: 0x10d142f00>>
     |    |    | <UIView: 0x10d1458d0; frame = (0 0; 320 64); hidden = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CALayer: 0x10d145990>>
     |    |    | <UIView: 0x10d1459b0; frame = (0 0; 320 64); alpha = 0.85; hidden = YES; opaque = NO; autoresize = W+H; userInteractionEnabled = NO; layer = <CALayer: 0x10d145a70>>
     |    | <UIImageView: 0x10f92f970; frame = (0 64; 320 0.5); userInteractionEnabled = NO; layer = <CALayer: 0x10f92fb70>>
     | <UINavigationItemView: 0x10d14b8f0; frame = (116.5 8; 87.5 27); opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x10d14b880>>
     |    | <UILabel: 0x10d14c1e0; frame = (0 3; 87.5 23); text = 'Your profile'; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x10d14c460>>
     | <UINavigationButton: 0x10d1671d0; frame = (5 6; 44 30); opaque = NO; layer = <CALayer: 0x10d167490>>
     |    | <UIImageView: 0x10d16b250; frame = (11 4; 22 22); clipsToBounds = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x10d16b070>>
     | <UINavigationButton: 0x10d16da60; frame = (271 6; 44 30); opaque = NO; layer = <CALayer: 0x10d16e2d0>>
     |    | <UIImageView: 0x10d16e630; frame = (11 4; 22 22); clipsToBounds = YES; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x10d16e730>>
     | <_UINavigationBarBackIndicatorView: 0x10d664000; frame = (8 12; 12.5 20.5); alpha = 0; opaque = NO; userInteractionEnabled = NO; layer = <CALayer: 0x10d663d80>>
     
     */
    //	coding this as defensivelly as possible
    [self.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
        if ([NSStringFromClass([v class]) rangeOfString:@"BarBackground"].location != NSNotFound) {
            [v.subviews enumerateObjectsUsingBlock:^(UIView *v, NSUInteger idx, BOOL *stop) {
                if ([v isKindOfClass:[UIImageView class]]) {
                    if (CGRectGetHeight(v.bounds) == [self onePixelSize]) {
                        [v removeFromSuperview];
                        *stop = YES;
                    }
                }
            }];
            *stop = YES;
        }
    }];
}

- (CGFloat)onePixelSize {
    UIScreen* mainScreen = [UIScreen mainScreen];
    CGFloat onePixel = 1.0f / mainScreen.scale;
    if ([mainScreen respondsToSelector:@selector(nativeScale)])
        onePixel = 1.0f / mainScreen.nativeScale;
    return onePixel;
}

@end
