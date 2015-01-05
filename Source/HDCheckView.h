//
//  HDCheckView.h
//  HaidoraCheckView
//
//  Created by DaiLingchi on 15-1-4.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDCheckViewProtocols.h"

@interface HDCheckView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) id<HDCheckViewDataSource> checkViewDataSource;
@property (nonatomic, weak) id<HDCheckViewDelegate> checkViewDelegate;
@property (nonatomic, assign, getter=isMultipleCheck) BOOL multipleCheck;
// auto alloc
@property (nonatomic, strong) NSMutableArray *checkDatas;

@end
