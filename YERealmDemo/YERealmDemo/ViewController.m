//
//  ViewController.m
//  YERealmDemo
//
//  Created by yongen on 17/3/30.
//  Copyright © 2017年 yongen. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@property (nonatomic, strong) Person *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _model = [[Person alloc] init];
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"path ----- %@", path);
}
- (IBAction)addActive:(UIButton *)sender {
    
    [self.model addData];
}

- (IBAction)deleteActive:(UIButton *)sender {
    
    [self.model deleteData];
}
- (IBAction)modifyActive:(UIButton *)sender {

    [self.model modifyData];
}
- (IBAction)selectActive:(UIButton *)sender {

    [self.model selectData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
