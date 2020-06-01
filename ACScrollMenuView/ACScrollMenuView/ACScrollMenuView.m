//
//  ACScrollMenuView.m
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import "ACScrollMenuView.h"
#import "ACScrollMenuCollectionView.h"


@interface ACScrollMenuView ()

@property (nonatomic, strong) ACScrollMenuCollectionView *scrollMenuCollectionView;

@end


@implementation ACScrollMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _selectIndex = -1;
        self.backgroundColor = UIColor.whiteColor;
        [self configACScrollMenuSubviews];
    }
    return self;
}

#pragma mark - setter && getter
- (void)setMenuDataSourceArray:(NSArray<ACScrollMenuItem *> *)menuDataSourceArray
{
    _menuDataSourceArray = menuDataSourceArray.copy;
    if (self.selectIndex == -1) {
        //        self.selectIndex = 0;
        [self.scrollMenuCollectionView reloadData];
    } else if (_menuDataSourceArray.count > _selectIndex && _selectIndex >= 0) {
        ACScrollMenuItem *itemModel = _menuDataSourceArray[_selectIndex];
        itemModel.isSelected = YES;
        [self layoutIfNeeded];
        [self.scrollMenuCollectionView reloadData];
    } else {
        [self.scrollMenuCollectionView reloadData];
    }
}

- (void)setSelectIndex:(NSUInteger)selectIndex
{
    if (_menuDataSourceArray.count > _selectIndex && _selectIndex >= 0) {
        ACScrollMenuItem *itemModel = _menuDataSourceArray[_selectIndex];
        itemModel.isSelected = NO;
    }
    _selectIndex = selectIndex;
    if (_menuDataSourceArray.count > _selectIndex && _selectIndex >= 0) {
        ACScrollMenuItem *itemModel = _menuDataSourceArray[_selectIndex];
        itemModel.isSelected = YES;
        [self layoutIfNeeded];
        [self.scrollMenuCollectionView reloadData];
    } else {
        [self.scrollMenuCollectionView reloadData];
    }
}

- (ACScrollMenuCollectionView *)scrollMenuCollectionView
{
    if (!_scrollMenuCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.scrollMenuCollectionView = [[ACScrollMenuCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _scrollMenuCollectionView.showsHorizontalScrollIndicator = NO;
        _scrollMenuCollectionView.showsVerticalScrollIndicator = NO;
        _scrollMenuCollectionView.scrollMenuDelegate = self;
    }
    return _scrollMenuCollectionView;
}

#pragma mark - Pivate Method
- (void)configACScrollMenuSubviews
{
    [self addSubview:self.scrollMenuCollectionView];
    [_scrollMenuCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.width.height.equalTo(self);
    }];
    [self layoutIfNeeded];
}

@end
