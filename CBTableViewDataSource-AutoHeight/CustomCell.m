//
//  CustomCell.m
//  CBTableViewDemo
//
//  Created by allen on 2017/9/14.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "CustomCell.h"
#import "Masonry.h"
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
        
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;

        
        
        _userNameLabel = [UILabel new];
        [self.contentView addSubview:_userNameLabel];
        
        _passWordLabel = [UILabel new];
        _passWordLabel.numberOfLines = 0;
        [self.contentView addSubview:_passWordLabel];
        
        _phoneURLImageView = [UIImageView new];
        _phoneURLImageView.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_phoneURLImageView];
        
       
        [_userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.top.equalTo(@10);
            make.height.equalTo(@15);
        }];
        
        [_passWordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-10);
            make.left.equalTo(@10);
            make.top.equalTo(_userNameLabel.mas_bottom).offset(10);
        }];
        
        [_phoneURLImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_passWordLabel.mas_bottom).offset(10);
            make.left.equalTo(@10);
            make.width.equalTo(@(SCREENWIDTH-20));
            make.height.equalTo(@(200.0/375.0 * (SCREENWIDTH-20)));
            make.bottom.equalTo(@-10); //重要
        }];
        
        
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


@end
