//
//  ACScrollMenuCollectionView.m
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import "ACScrollMenuCollectionView.h"
#import "ACScrollMenuView.h"
#import "ACScrollMenuCollectionCell.h"
#import "ACScrollMenuConfig.h"

@interface ACScrollMenuCollectionView ()
<UICollectionViewDelegate,
 UICollectionViewDataSource,
 UICollectionViewDelegateFlowLayout>


@end

@implementation ACScrollMenuCollectionView

static NSString *scrollMenuCellIdentifier = @"Alex.ScrollMenuCellIdentifier";
static NSString *scrollMenuEmptyFooterIdentifier = @"Alex.ScrollMenuEmptyFooterIdentifier";
static NSString *scrollMenuEmptyHeaderIdentifier = @"Alex.ScrollMenuEmptyHeaderIdentifier";

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self)
    {
        self.backgroundColor = UIColor.whiteColor;
        self.delegate = self;
        self.dataSource = self;
        [self registerClass:ACScrollMenuCollectionCell.class forCellWithReuseIdentifier:scrollMenuCellIdentifier];
        [self registerClass:UICollectionReusableView.class
 forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
        withReuseIdentifier:scrollMenuEmptyFooterIdentifier];
        [self registerClass:UICollectionReusableView.class
 forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
        withReuseIdentifier:scrollMenuEmptyHeaderIdentifier];
    }
    return self;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ACScrollMenuItem *cellModel = self.scrollMenuDelegate.menuDataSourceArray[indexPath.row];
    CGFloat insetValue = scrollMenuConfig.itemInsetForSection;
    return CGSizeMake(cellModel.menuTitleWidth.floatValue, self.bounds.size.height - insetValue * 2.);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat insetValue = scrollMenuConfig.itemInsetForSection;
    return UIEdgeInsetsMake(insetValue, 10, insetValue, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.000001;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return scrollMenuConfig.itemMiddleMargin;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0.00001, 0.000001);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(0.00001, 0.000001);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.scrollMenuDelegate.selectIndex == indexPath.row)
    {//点击同一个MenuItem不做处理
        return;
    }
//    ACScrollMenuCollectionCell *beforCell = (ACScrollMenuCollectionCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:self.scrollMenuDelegate.selectIndex inSection:0]];
//    ACScrollMenuCollectionCell *afterCell = (ACScrollMenuCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [self selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self.scrollMenuDelegate setSelectIndex:indexPath.row];
    ACScrollMenuItem *selectMenuItem = self.scrollMenuDelegate.menuDataSourceArray[indexPath.row];
    if (self.scrollMenuDelegate.didSelectMenuItemBlock)
    {
        self.scrollMenuDelegate.didSelectMenuItemBlock(selectMenuItem, indexPath.row);
    }
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.scrollMenuDelegate.menuDataSourceArray.count;
}

- ( UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ACScrollMenuCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:scrollMenuCellIdentifier forIndexPath:indexPath];
    if (self.scrollMenuDelegate.menuDataSourceArray.count > indexPath.row)
    {
        ACScrollMenuItem *cellModel = self.scrollMenuDelegate.menuDataSourceArray[indexPath.row];
        [cell setCellModel:cellModel];
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionFooter])
    {
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:scrollMenuEmptyFooterIdentifier forIndexPath:indexPath];
        return footerView;
    }
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:scrollMenuEmptyHeaderIdentifier forIndexPath:indexPath];
    return headerView;

}


@end
