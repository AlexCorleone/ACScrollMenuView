//
//  ACScrollMenuCollectionCell.h
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACScrollMenuItem;


@interface ACScrollMenuCollectionCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *menuTitleLabel;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) ACScrollMenuItem *cellModel;

@end
