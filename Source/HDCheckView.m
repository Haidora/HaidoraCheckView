//
//  HDCheckView.m
//  HaidoraCheckView
//
//  Created by DaiLingchi on 15-1-4.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "HDCheckView.h"
#import "HDCheckViewCell.h"

@interface HDCheckView ()

@property (nonatomic, strong) UINib *cellNib;

@end

@implementation HDCheckView

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self comonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self comonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self)
    {
        [self comonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self comonInit];
    }
    return self;
}

- (UINib *)cellNib
{
    if (nil == _cellNib)
    {
        NSBundle *classBundle = [NSBundle bundleForClass:[HDCheckViewCell class]];
        _cellNib = [UINib nibWithNibName:@"HDCheckViewCell" bundle:classBundle];
    }
    return _cellNib;
}

- (NSMutableArray *)checkDatas
{
    if (nil == _checkDatas)
    {
        _checkDatas = [[NSMutableArray alloc] init];
    }
    return _checkDatas;
}

- (void)comonInit
{
    self.dataSource = self;
    self.delegate = self;

    self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    UIView *footerView = [UIView new];
    footerView.backgroundColor = [UIColor clearColor];
    self.tableFooterView = footerView;
}

#pragma mark
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 10;
    if ([self.checkViewDataSource respondsToSelector:@selector(numberOfRowsInCheckView:)])
    {
        count = [self.checkViewDataSource numberOfRowsInCheckView:self];
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell<HDCheckViewCellDelegate> *cell = nil;
    if ([self.checkViewDataSource respondsToSelector:@selector(checkView:cellForRowAtIndex:)])
    {
        cell = [self.checkViewDataSource checkView:self cellForRowAtIndex:indexPath.row];
    }
    else
    {
        static NSString *cellIdentifier = @"HDCheckViewCell";
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (nil == cell)
        {
            NSArray *nibObjects = [self.cellNib instantiateWithOwner:nil options:nil];
            cell = [nibObjects firstObject];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.data = @(indexPath.row);
    }
    if ([self.checkDatas containsObject:cell.data])
    {
        [cell setCheck:YES];
    }
    else
    {
        [cell setCheck:NO];
    }
    return cell;
}

#pragma mark
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView estimatedHeightForRowAtIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView
    estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 44;
    if ([self.checkViewDataSource respondsToSelector:@selector(checkView:heightForRowAtIndex:)])
    {
        height = [self.checkViewDataSource checkView:self heightForRowAtIndex:indexPath.row];
    }
    return height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell<HDCheckViewCellDelegate> *cell =
        (UITableViewCell<HDCheckViewCellDelegate> *)[tableView cellForRowAtIndexPath:indexPath];
    BOOL check = [self.checkDatas containsObject:cell.data];
    if (!self.isMultipleCheck)
    {
        [self.checkDatas removeAllObjects];
    }
    if (check)
    {
        [self.checkDatas removeObject:cell.data];
    }
    else
    {
        [self.checkDatas addObject:cell.data];
    }
    [tableView reloadData];
    if ([self.checkViewDelegate respondsToSelector:@selector(checkView:didSelectRowAtIndex:)])
    {
        [self.checkViewDelegate checkView:self didSelectRowAtIndex:indexPath.row];
    }
}

@end
