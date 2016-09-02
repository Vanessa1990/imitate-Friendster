//
//  CommentModel.m
//  仿微信评论
//
//  Created by iosDev on 16/8/31.
//  Copyright © 2016年 iosDev. All rights reserved.
//

#import "CommentModel.h"
#import "YYText/YYText.h"

#define maxHeight 235

@implementation CommentModel

-(void)setCommentDict:(NSDictionary *)commentDict
{
    _commentDict = commentDict;
    self.name = commentDict[@"name"];
    self.content = commentDict[@"content"];
    self.comments = commentDict[@"comment"];
    self.spread = YES;
    self.height = 70;
    
    NSString *string2 = [NSString stringWithFormat:@"%@",self.content];
    CGSize size2 = [string2 boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 101, 1000) options:NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:17]} context:0].size;
    self.height += size2.height;
    self.height += 40;
    self.height += 10;
    
    self.min_height = 0;
    CGFloat h = 0;
    for (int i = 0; i < self.comments.count; i++) {
        NSDictionary *dict = self.comments[i];

        NSMutableAttributedString *text = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%@:%@",dict[@"nickname"],dict[@"value"]]];;
        CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 101, CGFLOAT_MAX);

        YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:text];
        
        self.height += (layout.textBoundingSize.height + 10);
        h += (layout.textBoundingSize.height + 10);
        if (h > maxHeight && self.min_height == 0) {
            self.spread = NO;
            self.min_height = h - layout.textBoundingSize.height - 10 + 40;//40是foot高度
            self.maxRow = i;
        }
    }
    if (self.min_height == 0) {
        self.min_height = self.height;
    } else {
        self.height += 40;
    }
    
    
}

@end
