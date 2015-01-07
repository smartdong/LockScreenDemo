//
//  ViewController.m
//  TouchIDTest
//
//  Created by dd on 15/1/5.
//  Copyright (c) 2015年 YangXudong. All rights reserved.
//

#import "ViewController.h"
#import "YXDLockScreenManager.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn_modifyPassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action_createPassword) name:YXDCreatePasswordNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(action_deletePassword) name:YXDDeletePasswordNotification object:nil];
}


- (void) action_createPassword {
    [_btn_modifyPassword setTitle:@"删除密码" forState:UIControlStateNormal];
}

- (void) action_deletePassword {
    [_btn_modifyPassword setTitle:@"创建密码" forState:UIControlStateNormal];
}


- (void)viewWillAppear:(BOOL)animated {
    
    if ([YXDLockScreenManager userHasPassword]) {
        
        [_btn_modifyPassword setTitle:@"删除密码" forState:UIControlStateNormal];
        
    } else {
        
        [_btn_modifyPassword setTitle:@"创建密码" forState:UIControlStateNormal];
        
    }
}

- (IBAction)action_modifyPassword {
    [YXDLockScreenManager modifyPassword];
}


@end
