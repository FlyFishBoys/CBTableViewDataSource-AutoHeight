//
//  UserModel.m
//  CBTableViewDemo
//
//  Created by allen on 2017/9/14.
//  Copyright © 2017年 allen. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (NSString *)debugDescription {
    return [NSString stringWithFormat:@"username: %@ password: %@ phoneURL: %@",self.userName,self.passWord,self.phoneURL];
}

- (NSString *)description {
    return [self debugDescription];
}
@end
