//
//  ViewController.m
//  CBTableViewDemo
//
//  Created by allen on 2017/9/14.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "ViewController.h"
#import "CBTableViewDataSource.h"
#import "UserModel.h"
#import "CustomCell.h"
#import "SDAutoLayout.h"
#import "CBBaseTableViewDataSource+SDAutoHeight.h"
#import "UITableView+FDTemplateLayoutCell.h"

static NSString *identifer = @"identifer";

@interface ViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataList = [NSMutableArray array];
    
    UserModel *model = [UserModel new];
    model.userName = @"iOS7设备上Cell默认高度44的约束冲突";
    model.passWord = @"需要在Cell初始化的时候设置contentView的autoresizingMask值";
    [_dataList addObject:model];
    
    model = [UserModel new];
    model.userName = @"长文本性能问题";
    model.passWord = @"如果label需要展示长文本，则label的宽度要固定，而不能使用lessThanOrEqualTo之类不确定约束，否则会有严重的滚动时卡顿。";
    [_dataList addObject:model];
    
    model = [UserModel new];
    model.userName = @"Cell重用过程中的约束冲突问题";
    model.passWord = @"Cell重用时，高度未更新，而数据发生改变后，在高度不足的情况下，会抛高度相关的约束冲突异常。对于这种情况需要在prepareForReuse中uninstall造成冲突的约束，在设置View的时候再install.";
    [_dataList addObject:model];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    _tableView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    
    
    
    [_tableView cb_makeDataSource:^(CBTableViewDataSourceMaker *make) {
        [make makeSection:^(CBTableViewSectionMaker *section) {
            section.section.identifier = NSStringFromClass([CustomCell class]);
            section.cell([CustomCell class])
            .data(_dataList)
            .adapter(^(CustomCell * cell,UserModel *data,NSUInteger index){
                cell.cellData = data;
            })
            .autoHeight()
            .event(^(NSUInteger index,UserModel *data){
                NSLog(@"index: %ld data: %@", index, data);
            });
        }];
        
    }];
    
    
}

@end
