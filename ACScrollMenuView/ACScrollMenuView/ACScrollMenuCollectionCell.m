//
//  ACScrollMenuCollectionCell.m
//  ACScrollMenuView
//
//  Created by AlexCorleone on 2018/7/4.
//  Copyright © 2018年 AlexCorleone. All rights reserved.
//

#import "ACScrollMenuCollectionCell.h"
#import "ACScrollMenuConfig.h"

@interface ACScrollMenuCollectionCell ()


@end

@implementation ACScrollMenuCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = UIColor.clearColor;
        [self configScrollMenuCellSubviews];
    }
    return self;
}

#pragma mark - setter && getter
- (UILabel *)menuTitleLabel
{
    if (!_menuTitleLabel)
    {
        _menuTitleLabel = [UILabel new];
        [_menuTitleLabel setTextColor:scrollMenuConfig.menuTitleNormalColor];
        [_menuTitleLabel setFont:scrollMenuConfig.menuTitleFont];
        [_menuTitleLabel setBackgroundColor:UIColor.clearColor];
        [_menuTitleLabel setTextAlignment:NSTextAlignmentCenter];
    }
    return _menuTitleLabel;
}

- (UIView *)lineView
{
    if (!_lineView)
    {
        self.lineView = [UIView new];
        _lineView.backgroundColor = scrollMenuConfig.menuNormalBorderLineColor;
    }
    return _lineView;
}

- (void)setCellModel:(ACScrollMenuItem *)cellModel
{
    _cellModel = cellModel;
    _menuTitleLabel.text = _cellModel.menuTitle;
    _menuTitleLabel.textColor = _cellModel.isSelected ? scrollMenuConfig.menuTitleSelectedColor : scrollMenuConfig.menuTitleNormalColor;
    if (scrollMenuConfig.scrollMenuStyle & ACScrollMenuItemStyleDefault)
    {
        self.backgroundColor = _cellModel.isSelected ? scrollMenuConfig.menuItemSelectedBGColor : scrollMenuConfig.menuItemNormalBGColor;
        self.layer.borderColor = _cellModel.isSelected ? scrollMenuConfig.menuSelectedBorderLineColor.CGColor : scrollMenuConfig.menuNormalBorderLineColor.CGColor;
    }else if (scrollMenuConfig.scrollMenuStyle == ACScrollMenuItemStyleBottomLine)
    {
        self.lineView.backgroundColor = _cellModel.isSelected ? scrollMenuConfig.menuItemSelectedBottomLineColor : scrollMenuConfig.menuItemNormalBottomLineColor;
        [UIView animateWithDuration:0.4 animations:^{
            if (self.cellModel.isSelected)
            {
                self.menuTitleLabel.font = [UIFont systemFontOfSize:scrollMenuConfig.menuTitleFont.pointSize + selectedFoneReuce];
            }else
            {
                self.menuTitleLabel.font = scrollMenuConfig.menuTitleFont;
            }
        } completion:^(BOOL finished) {
            
        }];
    }
}

- (void)configScrollMenuCellSubviews
{
    [self addSubview:self.menuTitleLabel];
    [_menuTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.width.height.equalTo(self).offset(-10);
    }];
    if (scrollMenuConfig.scrollMenuStyle & ACScrollMenuItemStyleDefault)
    {
        [self.layer setBorderWidth:0.7];
        [self.layer setCornerRadius:self.bounds.size.height / 2.];
        [self.layer setBorderColor:scrollMenuConfig.menuNormalBorderLineColor.CGColor];
    }else if (scrollMenuConfig.scrollMenuStyle == ACScrollMenuItemStyleBottomLine)
    {
        [self addSubview:self.lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.menuTitleLabel);
            make.top.equalTo(self.menuTitleLabel.mas_bottom).offset(3);
            make.height.equalTo(@(scrollMenuConfig.menuItemBottomLineHeight));
            make.width.equalTo(self.menuTitleLabel).multipliedBy(0.6);
        }];
    }
}
@end
