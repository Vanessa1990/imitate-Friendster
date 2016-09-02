//
//  CommentCell.m
//  仿微信评论
//
//  Created by iosDev on 16/9/1.
//  Copyright © 2016年 iosDev. All rights reserved.
//

#import "CommentCell.h"


@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    YYLabel *lable = [YYLabel new];
    lable.numberOfLines = 0;
    YYTextLinePositionSimpleModifier *modifier = [YYTextLinePositionSimpleModifier new];
    modifier.fixedLineHeight = 100;
    lable.linePositionModifier = modifier;
//    lable.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0  blue:arc4random_uniform(255)/255.0  alpha:1.0];
    lable.frame = CGRectMake(10, 5, [UIScreen mainScreen].bounds.size.width - 101, self.bounds.size.height);
    self.lable = lable;
    [self.contentView addSubview:lable];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setText:(NSString *)text
{
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:text];;
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 101, CGFLOAT_MAX);
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:string];
    
    NSRange range = [text rangeOfString:@":"];
    NSString *message = [NSString stringWithFormat:@"点击了%@",[text substringToIndex:range.location]];
    [string yy_setTextHighlightRange:NSMakeRange(0, range.location) color:[UIColor redColor] backgroundColor:[UIColor blueColor] tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:message delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [alert show];
    }];
    // 显示文本排版结果
    self.lable.frame = CGRectMake(10, 5, layout.textBoundingSize.width, layout.textBoundingSize.height);
    self.lable.textLayout = layout;
    self.lable.attributedText = string;
//    NSLog(@"每个cell内部lable的高度:%f",layout.textBoundingSize.height);
}

@end
