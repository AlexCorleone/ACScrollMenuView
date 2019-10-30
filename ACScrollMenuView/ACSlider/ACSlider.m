//
//  ACSlider.m
//  AlexSlider
//
//  Created by Alex on 2019/10/28.
//  Copyright © 2019年 AlexCorleone. All rights reserved.
//

#import "ACSlider.h"
#import "UIColor+ACAdd.h"

#define kBarLeftSpace (5.0)

@interface ACSlider ()

/** <#注释#> */
@property (nonatomic, assign) CGFloat barWidth;
/** <#注释#> */
@property (nonatomic, strong) CALayer *contentLayer_;
/** <#注释#> */
@property (nonatomic, strong) CAGradientLayer *backgroundLayer_;
/** <#注释#> */
@property (nonatomic, strong) CAGradientLayer *progressLayer_;
/** <#注释#> */
@property (nonatomic, assign) BOOL isCustomBarHeight;

@end

@implementation ACSlider

- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (!_isCustomBarHeight) {
        _barHeight = CGRectGetHeight(rect) * 0.5;
    }
    self.layer.sublayers[0].hidden = YES;
    self.layer.sublayers[1].hidden = YES;
    self.barWidth = CGRectGetWidth(rect) - kBarLeftSpace * 2.0;
    
    [self.layer insertSublayer:self.contentLayer_ atIndex:2];
    [self.layer insertSublayer:self.backgroundLayer_ above:self.contentLayer_];
    [self.layer insertSublayer:self.progressLayer_ above:self.backgroundLayer_];
}

- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setNeedsDisplay];
    });
    return [super thumbRectForBounds:bounds trackRect:rect value:value];

}

#pragma mark - Setter && Getter

- (void)setBarHeight:(CGFloat)barHeight {
   _barHeight = barHeight > CGRectGetHeight(self.frame) ? CGRectGetHeight(self.frame) : barHeight;
    self.isCustomBarHeight = YES;
}

- (CALayer *)contentLayer_ {
    if (!_contentLayer_) {
        self.contentLayer_ = [[CALayer alloc] init];
        _contentLayer_.frame = self.bounds;
    }
    _contentLayer_.backgroundColor = self.backgroundColor.CGColor;
    return _contentLayer_;
}

- (CAGradientLayer *)backgroundLayer_ {
    if (!_backgroundLayer_) {
        self.backgroundLayer_ = [[CAGradientLayer alloc] init];
        _backgroundLayer_.frame = CGRectMake(kBarLeftSpace, (CGRectGetHeight(self.bounds) - self.barHeight) / 2.0, self.barWidth, self.barHeight);
        _backgroundLayer_.cornerRadius = self.barHeight / 2.0;
        if (self.barBackgroundColor) {
            self.backgroundLayer_.backgroundColor = self.barBackgroundColor.CGColor;
        } else {
            self.backgroundLayer_.backgroundColor = [UIColor AC_colorWithHexString:@"#EEEEEE"].CGColor;
        }
    }
    return _backgroundLayer_;
}

- (CAGradientLayer *)progressLayer_ {
    if (!_progressLayer_) {
        self.progressLayer_ = [[CAGradientLayer alloc] init];
        _progressLayer_.startPoint = CGPointMake(0, 0.5);
        _progressLayer_.endPoint = CGPointMake(1.0, 0.5);
        _progressLayer_.cornerRadius = self.barHeight / 2.0;
        if (self.barColors) {
            self.progressLayer_.colors = self.barColors;
        } else {
            self.progressLayer_.colors = @[(id)[UIColor AC_colorWithHexString:@"#FEDC41"].CGColor,
                                           (id)[UIColor AC_colorWithHexString:@"#F4658E"].CGColor];
        }
    }
    _progressLayer_.frame = CGRectMake(CGRectGetMinX(self.backgroundLayer_.frame), CGRectGetMinY(self.backgroundLayer_.frame), self.barWidth * ((self.value - self.minimumValue) / (self.maximumValue - self.minimumValue)), self.barHeight);
    return _progressLayer_;
}
@end
