//
//  XJBaseModel.h
//  XJHetWorkModule
//
//  Created by 薛健 on 2019/12/5.
//  Copyright © 2019 薛健. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

@interface XJBaseModel : NSObject
///将model存储,子类去实现
+ (void)saveWithDic:(NSDictionary *)dic;
- (void)saveModel;
///删除存储,子类去实现
+ (void)remove;
//读取存储,子类去实现
+ (__kindof XJBaseModel *)getCurrentSaveModel;
//Model 转 字典
-(NSDictionary *)getCurrentDic;

@end

