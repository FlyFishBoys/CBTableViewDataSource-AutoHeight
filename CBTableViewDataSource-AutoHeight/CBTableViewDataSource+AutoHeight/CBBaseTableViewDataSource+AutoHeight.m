//
//  CBBaseTableViewDataSource+AutoHeight.m
//  CBTableViewDataSource-AutoHeight
//
//  Created by allen on 2017/9/15.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "CBBaseTableViewDataSource+AutoHeight.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "ZWBaseCell.h"
@implementation CBBaseTableViewDataSource (AutoHeight)
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = (NSUInteger) indexPath.section;
    NSUInteger index = (NSUInteger) indexPath.row;
    NSString * identifier = self.sections[section].identifier;
    NSObject *data = self.sections[section].data[index];
    
    // 获取cell高度
    return [tableView fd_heightForCellWithIdentifier:identifier cacheByIndexPath:indexPath configuration:^(ZWBaseCell *cell) {
        // configurations
        if ([cell respondsToSelector:@selector(configureCell:)]) {
            [cell configureCell:data];
        }
    }];
}

@end
