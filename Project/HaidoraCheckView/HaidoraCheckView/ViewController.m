//
//  ViewController.m
//  HaidoraCheckView
//
//  Created by DaiLingchi on 15-1-4.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "ViewController.h"

#import "HDCheckView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet HDCheckView *checkView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    _checkView.multipleCheck = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
