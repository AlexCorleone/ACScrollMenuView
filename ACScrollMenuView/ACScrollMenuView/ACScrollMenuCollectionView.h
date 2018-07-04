//
//  ACScrollMenuCollectionView.h
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACScrollMenuItem, ACScrollMenuView;

@interface ACScrollMenuCollectionView : UICollectionView

@property (nonatomic, weak) ACScrollMenuView *scrollMenuDelegate;

@end
