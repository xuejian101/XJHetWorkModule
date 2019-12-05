//
//  XJBaseModel.m
//  XJHetWorkModule
//
//  Created by 薛健 on 2019/12/5.
//  Copyright © 2019 薛健. All rights reserved.
//

#import "XJBaseModel.h"

@implementation XJBaseModel
+ (void)saveWithDic:(NSDictionary *)dic{
    //    [[NSUserDefaults standardUserDefaults] setObject:dic forKey:AccountInfoModelSaveKey];
    //    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)saveModel{
    //    [[NSUserDefaults standardUserDefaults] setObject:[self getCurrentDic] forKey:AccountInfoModelSaveKey];
    //    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)remove{
    //    [[NSUserDefaults standardUserDefaults] removeObjectForKey:AccountInfoModelSaveKey];
}

+ (__kindof XJBaseModel *)getCurrentSaveModel{
    //    NSDictionary * dic= [[NSUserDefaults standardUserDefaults] objectForKey:AccountInfoModelSaveKey];
    //    AccountInfoModel * model  = [[AccountInfoModel alloc] initWithDictionary:dic error:nil];
    //    return model;
    return nil;
}

-(NSDictionary *)getCurrentDic{
    NSString *json = [self yy_modelToJSONString];
    return [self dictionaryWithJsonString:json];
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
@end
