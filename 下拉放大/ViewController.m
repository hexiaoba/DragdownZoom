//
//  ViewController.m
//  下拉放大
//
//  Created by xiangtai on 15/6/1.
//  Copyright (c) 2015年 xiangtai. All rights reserved.
//

#import "ViewController.h"

const CGFloat ratio = 3.0; //放大系数
const CGFloat imageHeight = 772; //图片高度

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    UIImageView *_topImageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
     _tableView.contentInset = UIEdgeInsetsMake(imageHeight / 2.0, 0, 0, 0);
    
     UIImage *image = [UIImage imageNamed:@"fanbingbing"];
    _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, -imageHeight, _tableView.frame.size.width, imageHeight)];
    _topImageView.image = image;
    _topImageView.contentMode = UIViewContentModeScaleAspectFill;
    [_tableView insertSubview:_topImageView atIndex:0];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifity = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifity];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据----%ld",indexPath.row];
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat downHeight = -(imageHeight / 2.0) - scrollView.contentOffset.y;
    if (downHeight < 0 ) return;
    CGRect frame = _topImageView.frame;
    frame.size.height = imageHeight + downHeight * ratio;
    _topImageView.frame = frame;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
