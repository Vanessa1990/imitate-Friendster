//
//  CommentCell.h
//  仿微信评论
//
//  Created by iosDev on 16/9/1.
//  Copyright © 2016年 iosDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYText.h"

@interface CommentCell : UITableViewCell

@property(nonatomic, strong) YYLabel *lable;

@property(nonatomic, strong) NSString *text;

@end
