//
//  ACSlider.h
//  AlexSlider
//
//  Created by Alex on 2019/10/28.
//  Copyright © 2019年 AlexCorleone. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACSlider : UISlider

/** 进度条Bar的高度 */
@property (nonatomic, assign) CGFloat barHeight;

/** 进度条的背景色 */
@property (nonatomic, strong) UIColor *barBackgroundColor;
/** 进度条进度的颜色 */
@property (nonatomic, copy) NSArray *barColors;

@end

NS_ASSUME_NONNULL_END
