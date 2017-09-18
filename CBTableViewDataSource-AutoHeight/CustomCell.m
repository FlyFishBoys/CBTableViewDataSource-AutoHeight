//
//  CustomCell.m
//  CBTableViewDemo
//
//  Created by allen on 2017/9/14.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "CustomCell.h"
#import "SDAutoLayout.h"
#define SCREENHEIGHT         [[UIScreen mainScreen] bounds].size.height
#define SCREENWIDTH          [[UIScreen mainScreen] bounds].size.width


@interface CustomCell()
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *passWordLabel;
@property (nonatomic, strong) UIImageView *phoneURLImageView;

@end

@implementation CustomCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _userNameLabel = [UILabel new];
        [self.contentView addSubview:_userNameLabel];
        
        _passWordLabel = [UILabel new];
        _passWordLabel.numberOfLines = 0;
        [self.contentView addSubview:_passWordLabel];
        
        _phoneURLImageView = [UIImageView new];
        _phoneURLImageView.image = [UIImage imageNamed:@"timg"];
        [self.contentView addSubview:_phoneURLImageView];
        
       
        _userNameLabel.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(self.contentView,10).autoHeightRatio(0);
        [_userNameLabel setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH];
        
        _passWordLabel.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(_userNameLabel, 10).autoHeightRatio(0);
        [_passWordLabel setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH];
        
        _phoneURLImageView.sd_layout.topSpaceToView(_passWordLabel,10).leftSpaceToView(self.contentView,10).rightSpaceToView(self.contentView, 10).widthIs(SCREENWIDTH).heightIs(200);
        [self setupAutoHeightWithBottomView:_phoneURLImageView bottomMargin:10];

    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)configureCell:(UserModel *)data {
    _userNameLabel.text = data.userName;
    _passWordLabel.text = data.passWord;
    _phoneURLImageView.backgroundColor = [UIColor redColor];
}

-(void)setCellData:(UserModel *)cellData {
    [self configureCell:cellData];


}


@end
