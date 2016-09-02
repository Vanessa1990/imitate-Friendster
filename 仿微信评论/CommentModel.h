//
//  CommentModel.h
//  仿微信评论
//
//  Created by iosDev on 16/8/31.
//  Copyright © 2016年 iosDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommentModel : NSObject

@property(nonatomic, strong) NSString *name;

@property(nonatomic, strong) NSString *content;

@property(nonatomic, strong) NSArray *comments;

@property (assign, nonatomic) CGFloat height;
@property (assign, nonatomic) CGFloat min_height;

@property(nonatomic, strong) NSDictionary *commentDict;

@property (assign, nonatomic)  int maxRow;

@property (assign, nonatomic)  BOOL spread;

@end
