//
//  XJNetworkConst.h
//  XJHetWorkModule
//
//  Created by 薛健 on 2019/12/5.
//  Copyright © 2019 薛健. All rights reserved.
//

#ifndef XJNetworkConst_h
#define XJNetworkConst_h
#ifdef DEBUG
#define CNLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define CNLog(...)
#endif

#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

@class XJNetworkConfig,XJQueueNetworkConfig;

typedef NS_ENUM(NSUInteger, XJNetworkStatus) {
    StatusUnknown           = -1, //未知网络
    StatusNotReachable      = 0,    //没有网络
    StatusReachableViaWWAN  = 1,    //手机自带网络
    StatusReachableViaWiFi  = 2     //wifi
};

typedef NS_ENUM(NSUInteger, XJRequestSerializer) {
    /** 设置请求数据为JSON格式*/
    XJRequestSerializerJSON,
    /** 设置请求数据为二进制格式*/
    XJRequestSerializerHTTP,
};

typedef NS_ENUM(NSUInteger, XJResponseSerializer) {
    /** 设置响应数据为JSON格式*/
    XJResponseSerializerJSON,
    /** 设置响应数据为二进制格式*/
    XJResponseSerializerHTTP,
};

typedef NS_ENUM(NSInteger, XJRequestType){
    /**GET请求*/
    XJRequestType_Get = 0,
    /**POST请求*/
    XJRequestType_Post,
    /**Upload请求*/
    XJRequestType_Upload,
    /**DownLoad请求*/
    XJRequestType_DownLoad,
    /**PUT请求*/
    XJRequestType_Put,
    /**PATCH请求*/
    XJRequestType_Patch,
    /**DELETE请求*/
    XJRequestType_Delete
};

/** 请求成功的Block */
typedef void(^XJHttpRequestSuccess)(id responseObject);
/** 请求失败的Block */
typedef void(^XJHttpRequestFailed)(NSError *error);
/** 上传或者下载的进度, Progress.completedUnitCount:当前大小 - Progress.totalUnitCount:总大小*/
typedef void (^XJHttpProgress)(NSProgress *progress);
/** 请求配置的Block */
typedef void (^XJNetworkConfigBlock)(XJNetworkConfig * requestConfig);
/** 请求取消的Block */
typedef void (^XJCancelRequestBlock)(BOOL results,NSString * urlString);

#endif /* XJNetworkConst_h */
