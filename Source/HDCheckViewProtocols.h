//
//  HDCheckViewProtocols.h
//  HaidoraCheckView
//
//  Created by DaiLingchi on 15-1-4.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#ifndef HaidoraCheckView_HDCheckViewProtocols_h
#define HaidoraCheckView_HDCheckViewProtocols_h

@class HDCheckView;

#pragma mark
#pragma mark HDCheckViewCellDelegate

@protocol HDCheckViewCellDelegate <NSObject>

@required
@property (nonatomic, assign, getter=isCheck) BOOL check;
@property (nonatomic, strong) id<NSObject> data;

@end

#pragma mark
#pragma mark HDCheckViewDataSource
@protocol HDCheckViewDataSource <NSObject>

@required
- (NSInteger)numberOfRowsInCheckView:(HDCheckView *)checkView;

- (UITableViewCell<HDCheckViewCellDelegate> *)checkView:(HDCheckView *)checkView
                                      cellForRowAtIndex:(NSInteger)index;

@optional
- (CGFloat)checkView:(HDCheckView *)checkView heightForRowAtIndex:(NSInteger)index;

@end

#pragma mark
#pragma mark HDCheckViewDelegate
@protocol HDCheckViewDelegate <NSObject>

@optional
- (void)checkView:(HDCheckView *)checkView didSelectRowAtIndex:(NSInteger)index;

@end

#endif
