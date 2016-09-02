//
//  CommentTableViewCell.m
//  仿微信评论
//
//  Created by iosDev on 16/8/31.
//  Copyright © 2016年 iosDev. All rights reserved.
//

#import "CommentTableViewCell.h"
#import "CommentCell.h"

@interface CommentTableViewCell()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation CommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:nil] forCellReuseIdentifier:@"CommentCellID"];
    self.tableView.estimatedRowHeight = 20;
    self.tableView.scrollEnabled = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(CommentModel *)model
{
    _model = model;
    self.nickNameLable.text = model.name;
    self.contentLable.text = model.content;
    [self.tableView reloadData];
}

-(void)buttonClick
{
    self.model.spread = !self.model.spread;
    if (self.clickMoreBlock) {
        self.clickMoreBlock();
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.model.spread == YES) {
        return self.model.comments.count;
    } else {
        if (self.model.height == self.model.min_height) {
            return self.model.comments.count;
        } else {
           return self.model.maxRow;
        }
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCellID"];
    cell.backgroundColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.text = [NSString stringWithFormat:@"%@:%@",[self.model.comments[indexPath.row] objectForKey:@"nickname"],[self.model.comments[indexPath.row] objectForKey:@"value"]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSAttributedString *text = [[NSAttributedString alloc]initWithString:[self.model.comments[indexPath.row] objectForKey:@"value"]];;
    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width - 101, CGFLOAT_MAX);
 
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:size text:text];
   
    return layout.textBoundingSize.height + 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (self.model.min_height != self.model.height) {
        UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        moreButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 100, 40);
        moreButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [moreButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [moreButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        moreButton.backgroundColor = [UIColor lightGrayColor];
        if (self.model.spread == YES) {
            [moreButton setTitle:@"收起" forState:UIControlStateNormal];
        } else {
            [moreButton setTitle:@"点击更多" forState:UIControlStateNormal];
        }
        return moreButton;
    } else {
        return nil;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (self.model.min_height != self.model.height) {
        return 40;
    } else {
        return 0;
    }
}

@end
