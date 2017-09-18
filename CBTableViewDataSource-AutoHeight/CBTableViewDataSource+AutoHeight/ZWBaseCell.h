//
//  ZWBaseCell.h
//  CBTableViewDemo
//
//  Created by allen on 2017/9/15.
//  Copyright © 2017年 allen. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ZWBaseCell : UITableViewCell

- (void)configureCell:(NSObject *)data;
@property (nonatomic, strong) NSObject *cellData;
@end
