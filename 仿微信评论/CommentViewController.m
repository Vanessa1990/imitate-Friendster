//
//  CommentViewController.m
//  仿微信评论
//
//  Created by iosDev on 16/9/2.
//  Copyright © 2016年 iosDev. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentModel.h"
#import "CommentTableViewCell.h"
#import "CommentCell.h"
#import "YYText/YYText.h"

@interface CommentViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray <CommentModel *>*dataArray;
@property(nonatomic, strong) NSArray *testArray;

@end

@implementation CommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    
    NSString * path = [[NSBundle mainBundle]pathForResource:@"Property List" ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *copyArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        CommentModel *model = [[CommentModel alloc]init];
        model.commentDict = dict;
        model.spread = NO;
        [copyArray addObject:model];
    }
    self.dataArray = [NSArray arrayWithArray:copyArray];
    [self.tableView reloadData];
    self.tableView.estimatedRowHeight = 20;
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentTableViewCell" bundle:nil] forCellReuseIdentifier:@"CommentTableViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = (_tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height - 20) style:UITableViewStylePlain],
                      _tableView.dataSource = self,
                      _tableView.delegate = self,
                      _tableView
                      );
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    __weak CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentTableViewCell"];
    cell.model = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.clickMoreBlock = ^(){
        [self.tableView reloadData];
        cell.model = self.dataArray[indexPath.row];
    };
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentModel *model = self.dataArray[indexPath.row];
    if (model.spread == YES) {
        return model.height;
    } else {
        return model.min_height;
    }
}


@end
