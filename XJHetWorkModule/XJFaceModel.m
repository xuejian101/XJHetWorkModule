//
//  XJFaceModel.m
//  XJHetWorkModule
//
//  Created by 薛健 on 2019/12/5.
//  Copyright © 2019 薛健. All rights reserved.
//

#import "XJFaceModel.h"

@implementation XJFaceModel

@end
@implementation XJCityModel
@end

@implementation XJAllCityModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"results" : [XJCityModel class]};
}
@end
