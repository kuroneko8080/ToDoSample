//
//  TDSItemListViewController.m
//  ToDoSample
//
//  Created by tron on 2014/12/13.
//  Copyright (c) 2014年 Sleeping Cat Syndrome. All rights reserved.
//

#import "TDSItemListViewController.h"
#import "TDSCreateItemViewController.h"

@interface TDSItemListViewController () <TDSCreateItemViewControllerDelegate>
@property (nonatomic) NSMutableArray *items;
@end

@implementation TDSItemListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 編集ボタンの追加
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // テーブルビューのセクション数は１固定
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // １セクション中のアイテム数
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 出来る限り再利用してUITabeViewCellインスタンスを生成
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    // テキストラベルを設定
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // UITableViewCellEditingStyleDeleteのみに限定
    if (editingStyle != UITableViewCellEditingStyleDelete) {
        return;
    }
    [self.items removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"CreateItemSegue"]) {
        TDSCreateItemViewController *controller = (TDSCreateItemViewController *)[segue.destinationViewController viewControllers][0];
        controller.delegate = self;
    }
}

- (void)createItemViewControllerDidFinish:(TDSCreateItemViewController *)controller item:(NSString *)item
{
    if (!self.items) {
        self.items = [[NSMutableArray alloc]init];
    }
    [self.items insertObject:item atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

- (void)createItemViewControllerDidCancel:(TDSCreateItemViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
