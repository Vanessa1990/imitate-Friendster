//
//  CommentTableViewCell.h
//  仿微信评论
//
//  Created by iosDev on 16/8/31.
//  Copyright © 2016年 iosDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface CommentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nickNameLable;

@property (weak, nonatomic) IBOutlet UILabel *contentLable;

@property (weak, nonatomic) IBOutlet UILabel *dateLable;

@property (weak, nonatomic) IBOutlet UIView *commentView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) CommentModel *model;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *commentViewH;

@property(nonatomic, strong) void(^clickMoreBlock)();

@end
