//
//  HDCheckViewCell.h
//  HaidoraCheckView
//
//  Created by DaiLingchi on 15-1-4.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDCheckViewProtocols.h"

@interface HDCheckViewCell : UITableViewCell <HDCheckViewCellDelegate>

@property (nonatomic, strong) id data;

@end
