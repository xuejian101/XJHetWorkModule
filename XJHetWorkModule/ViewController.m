//
//  ViewController.m
//  XJHetWorkModule
//
//  Created by 薛健 on 2019/12/5.
//  Copyright © 2019 薛健. All rights reserved.
//

#import "ViewController.h"
#import "XJRequest.h"
#import "XJFaceModel.h"
#import "XJNetworking.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   [XJRequest requestWithConfig:^(XJNetworkConfig *requestConfig) {
        requestConfig.URLString = @"http://newuat.ikapp.ikang.com/appService/city/allCity";
        requestConfig.modelClass = @"XJAllCityModel";
    } success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
    } failure:^(NSError *error) {
        
    }];
}


@end
