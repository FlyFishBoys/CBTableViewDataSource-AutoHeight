//
//  CBBaseTableViewDataSource+SDAutoHeight.m
//  CBTableViewDataSource-AutoHeight
//
//  Created by allen on 2017/9/18.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "CBBaseTableViewDataSource+SDAutoHeight.h"
#import "SDAutoLayout.h"
#import "CustomCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@implementation CBBaseTableViewDataSource (SDAutoHeight)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    NSString * identifier = self.sections[section].identifier;
    NSObject *data = self.sections[section].data[index];
    
    // 获取cell高度
    return [tableView cellHeightForIndexPath:indexPath model:data keyPath:@"cellData" cellClass:[NSClassFromString(identifier) class]  contentViewWidth:[self cellContentViewWith]];
}




- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}

@end
