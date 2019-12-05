//
//  XJFaceModel.h
//  XJHetWorkModule
//
//  Created by 薛健 on 2019/12/5.
//  Copyright © 2019 薛健. All rights reserved.
//

#import "XJBaseModel.h"

@interface XJFaceModel : XJBaseModel
@property(nonatomic,strong) NSString *login;
@property(nonatomic,strong) NSString *nodeId;
@property(nonatomic,strong) NSString *url;
@property(nonatomic,strong) NSString *followingUrl;
@property(nonatomic,strong) NSString *starredUrl;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *blog;
@end

@interface XJCityModel : XJBaseModel
@property(nonatomic,strong) NSString *isLocation;
@property(nonatomic,strong) NSString *cityCode;
@property(nonatomic,strong) NSString *cityName;
@end

@interface XJAllCityModel : XJBaseModel
@property(nonatomic,strong) NSString *code;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) NSArray <XJCityModel *>*results;
@end

