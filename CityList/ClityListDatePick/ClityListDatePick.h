//
//  ClityListDatePick.h
//  CityList
//
//  Created by mc on 15/12/28.
//  Copyright © 2015年 kangshibiao. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef void(^myBlock)(NSString * cityList1,NSString *cityList2);

@interface ClityListDatePick : UIView<UIPickerViewDelegate,UIPickerViewDataSource>

@property (strong, nonatomic) UIPickerView * pickView;

@property (strong, nonatomic) NSArray * dataArr;
@property (strong, nonatomic) NSArray * listArr;

@property (strong, nonatomic) UIView *bgView;


@property (strong, nonatomic) UIButton * cancel;

@property (strong, nonatomic) UIButton * determine;

@property (copy, nonatomic) NSString * string1;
@property (copy, nonatomic) NSString * string2;

@property (copy, nonatomic)myBlock block;


@end
