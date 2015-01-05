//
//  HDCheckViewCell.m
//  HaidoraCheckView
//
//  Created by DaiLingchi on 15-1-4.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "HDCheckViewCell.h"

@interface HDCheckViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *checkImage;

@property (nonatomic, assign) BOOL checkStatus;

@end

@implementation HDCheckViewCell

- (void)awakeFromNib
{
    self.checkStatus = NO;
    self.checkImage.hidden = YES;

    UIImage *image = [UIImage imageNamed:@"HaidoraCheckView.bundle/HDCheck"];
    self.checkImage.image = image;
    self.checkImage.highlightedImage = image;
}

#pragma mark
#pragma mark HDCheckViewCellDelegate

- (void)setCheck:(BOOL)check
{
    self.checkStatus = check;
    self.checkImage.hidden = !check;
}

- (BOOL)isCheck
{
    return self.checkStatus;
}

@end
