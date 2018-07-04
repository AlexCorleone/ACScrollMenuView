# ACScrollMenuView
一个简单的滚动菜单效果、接入简单使用方便、支持多种样式、支持自定义样式；后期遇到不错的UI样式会持续更新。

样式1:
![image](https://github.com/AlexCorleone/ACScrollMenuView/blob/master/ACScrollMenuView/OtherInfo/ReadMeShowPicture/LineStyle.png)

样式2:
![image](https://github.com/AlexCorleone/ACScrollMenuView/blob/master/ACScrollMenuView/OtherInfo/ReadMeShowPicture/defaultStyle.png)

使用方法如下：

1.引入头文件 #import "ACScrollMenuView.h"

初始化ACScrollMenuView对象

    #pragma mark - setter && getter
    - (ACScrollMenuView *)scrollMenuView
    {
        if (!_scrollMenuView)
        {
            self.scrollMenuView = [ACScrollMenuView new];
        }
        return _scrollMenuView;
    }
    
将ACScrollMenuView对象添加到视图层级

    [self.view addSubview:self.scrollMenuView];
        [_scrollMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
           make.centerX.width.equalTo(self.view);
           make.top.equalTo(self.view).offset(20);
           make.height.equalTo(@(30));
        }];
        
设置初始化选中的index 

    [_scrollMenuView setSelectIndex:1];
    
设置数据源(数据源可以继承ACScrollMenuItem实现自定义数据源)

    NSArray *menuTitleArray = @[@"简友圈", @"作者", @"专题", @"连载", @"文集", @"推送更新", @"全部关注"];
    NSMutableArray *itemsArray = @[].mutableCopy;
    for (NSInteger i = 0 ; i < menuTitleArray.count; i++)
    {
        ACScrollMenuItem *menuItem = [ACScrollMenuItem new];
        menuItem.menuTitle = menuTitleArray[i];
        menuItem.ID = @(i + 1);
        [itemsArray addObject:menuItem];
    }
    [_scrollMenuView setMenuDataSourceArray:itemsArray];

设置回调的处理Block

    [_scrollMenuView setDidSelectMenuItemBlock:^(ACScrollMenuItem *selectItem, NSInteger selectIndex) {
        NSLog(@"%@ ----- %ld", selectItem.menuTitle, selectIndex);
    }];


😍记得点个Start哦！！！






























