//
//  ViewController.m
//  CityList
//
//  Created by mc on 15/12/28.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
}
- (IBAction)btnClokc:(id)sender{
    NSString * dic = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"plist"];
    
    NSArray *data = [[NSArray alloc] initWithContentsOfFile:dic];
    ClityListDatePick * clity =[[ClityListDatePick alloc]initWithFrame:self.view.bounds];
    clity.dataArr = data;
    
    clity.block = ^(NSString *cityList1,NSString *cityList2){
        
        NSLog( @"------%@--------%@",cityList1,cityList2);
        
        
    };
    
    [self.view addSubview:clity];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
