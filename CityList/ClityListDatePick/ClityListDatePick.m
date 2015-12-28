
//
//  ClityListDatePick.m
//  CityList
//
//  Created by mc on 15/12/28.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

#import "ClityListDatePick.h"

@implementation ClityListDatePick

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        
        [self addSubview:self.pickView];
       
        [self addSubview:self.bgView];
    
    }
    return self;
    
}
- (UIPickerView *)pickView{
    
    if (!_pickView) {
        
        _pickView =[[UIPickerView alloc]initWithFrame:CGRectMake(0, HEIGHT -220 ,WIDTH, 220)];
        
        _pickView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        
        _pickView.delegate = self;
        
        _pickView.dataSource = self;
        
        
        
    }
    return _pickView;
    
}
- (UIView *)bgView{
    
    if (!_bgView) {
        
        _bgView =[[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT - 220 -40, WIDTH, 40)];
        
        _bgView.backgroundColor =[UIColor lightGrayColor];
        
        [_bgView addSubview:self.cancel];
        [_bgView addSubview:self.determine];
    }
    return _bgView;
}
- (UIButton *)cancel{
    
    if (!_cancel) {
        
        _cancel =[UIButton buttonWithType:UIButtonTypeCustom];
        
        _cancel.frame = CGRectMake(10,0 , 50, 40);
        
        [_cancel setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_cancel setTitle:@"取消" forState:UIControlStateNormal];
        
        [_cancel addTarget:self action:@selector(cancelBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _cancel;
    
}
- (UIButton *)determine{
    
    if (!_determine) {
        
        _determine =[UIButton buttonWithType:UIButtonTypeCustom];
        
        _determine.frame = CGRectMake(WIDTH - 50, 0, 50, 40);
        
        [_determine setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [_determine setTitle:@"确定" forState:UIControlStateNormal];
        
        [_determine addTarget:self action:@selector(determineBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _determine;
}

- (void)setDataArr:(NSArray *)dataArr{
    
    _dataArr =dataArr;
  
    NSArray * city = [_dataArr[0] allKeys];
    
    self.listArr = [_dataArr[0]valueForKey:city[0]];
    
    self.string1 = city[0];
    
    self.string2 = self.listArr[0];
    
}
#pragma mark -- UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
    
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (component == 0) {
        
         return _dataArr.count;
    }
    else{
        
         return self.listArr.count;
    }
   
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (component == 0) {
        NSArray * city = [_dataArr[row] allKeys];
        
        
        return city[0];
    }
    else{
     
        return self.listArr[row];
    }
    
   
}
#pragma mark -- UIPickerViewDelegate
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (component == 0) {
        
        NSArray * city = [_dataArr[row] allKeys];
        
        
        self.listArr = [_dataArr[row]valueForKey:city[0]];
        
        [self.pickView reloadComponent:1];
        
        self.string1 = city[0];
        
        self.string2 = self.listArr[0];
    }
    else{
        
        if (self.listArr >0) {
            
            self.string2 = self.listArr[row];
        }
        else{
            
            self.string2 = @"";
            
        }
    }
    
    NSLog(@"=====");

}
- (void)cancelBtn:(UIButton *)sender{
    
    [self removeFromSuperview];
    
}
- (void)determineBtn:(UIButton *)sender{
    
    if (_block) {
        
        _block(self.string1,self.string2)
        ;
      }
    
    [self removeFromSuperview];
    
}


@end
