//
//  XJNetworkConfig.m
//  XJHetWorkModule
//
//  Created by 薛健 on 2019/12/5.
//  Copyright © 2019 薛健. All rights reserved.
//

#import "XJNetworkConfig.h"
@implementation XJNetworkConfig
- (void)dealloc{
    CNLog(@"%s",__func__);
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _requestType = XJRequestType_Get;
        _successCode = 1;
        _codeName = @"code";
        _messageName = @"message";
    }
    return self;
}

#pragma mark - 请求头
- (void)setValue:(NSString *)value forHeaderField:(NSString *)field{
    if (value) {
        [self.mutableHTTPRequestHeaders setValue:value forKey:field];
    }
    else {
        [self removeHeaderForkey:field];
    }
}

- (NSString *)objectHeaderForKey:(NSString *)key{
    return  [self.mutableHTTPRequestHeaders objectForKey:key];
}

- (void)removeHeaderForkey:(NSString *)key{
    if(!key)return;
    [self.mutableHTTPRequestHeaders removeObjectForKey:key];
}

#pragma mark - 上传请求参数
- (void)addFormDataWithName:(NSString *)name fileData:(NSData *)fileData {
    XJUploadDataConfig *formData = [XJUploadDataConfig formDataWithName:name fileData:fileData];
    [self.uploadDatas addObject:formData];
}

- (void)addFormDataWithName:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType fileData:(NSData *)fileData {
    XJUploadDataConfig *formData = [XJUploadDataConfig formDataWithName:name fileName:fileName mimeType:mimeType fileData:fileData];
    [self.uploadDatas addObject:formData];
}

- (void)addFormDataWithName:(NSString *)name fileURL:(NSURL *)fileURL {
    XJUploadDataConfig *formData = [XJUploadDataConfig formDataWithName:name fileURL:fileURL];
    [self.uploadDatas addObject:formData];
}

- (void)addFormDataWithName:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType fileURL:(NSURL *)fileURL {
    XJUploadDataConfig *formData = [XJUploadDataConfig formDataWithName:name fileName:fileName mimeType:mimeType fileURL:fileURL];
    [self.uploadDatas addObject:formData];
}

#pragma mark - 懒加载

- (NSMutableDictionary *)mutableHTTPRequestHeaders{
    
    if (!_mutableHTTPRequestHeaders) {
        _mutableHTTPRequestHeaders  = [[NSMutableDictionary alloc]init];
    }
    return _mutableHTTPRequestHeaders;
}

- (NSMutableArray<XJUploadDataConfig *> *)uploadDatas {
    if (!_uploadDatas) {
        _uploadDatas = [[NSMutableArray alloc]init];
    }
    return _uploadDatas;
}

- (BOOL)isGifWithImageData: (NSData *)fileData {
    if ([[self imageTypeWithImageData:fileData] isEqualToString:@"gif"]) {
        return YES;
    }
    return NO;
}

- (NSString *)imageTypeWithImageData: (NSData *)fileData {
    uint8_t c;
    [fileData getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        case 0x49:
        case 0x4D:
            return @"tiff";
        case 0x52:
            if ([fileData length] < 12) {
                return nil;
            }
            NSString *testString = [[NSString alloc] initWithData:[fileData subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([testString hasPrefix:@"RIFF"] && [testString hasSuffix:@"WEBP"]) {
                return @"webp";
            }
            return nil;
    }
    return nil;
}

- (NSString *)mimeTypeWithImageData: (NSData *)fileData{
    return [NSString stringWithFormat:@"image/%@",[self imageTypeWithImageData:fileData]];
}
@end


#pragma mark - XJUploadDataConfig

@implementation XJUploadDataConfig

+ (instancetype)formDataWithName:(NSString *)name fileData:(NSData *)fileData {
    XJUploadDataConfig *formData = [[XJUploadDataConfig alloc] init];
    formData.name = name;
    formData.fileData = fileData;
    return formData;
}

+ (instancetype)formDataWithName:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType fileData:(NSData *)fileData {
    XJUploadDataConfig *formData = [[XJUploadDataConfig alloc] init];
    formData.name = name;
    formData.fileName = fileName;
    formData.mimeType = mimeType;
    formData.fileData = fileData;
    return formData;
}

+ (instancetype)formDataWithName:(NSString *)name fileURL:(NSURL *)fileURL {
    XJUploadDataConfig *formData = [[XJUploadDataConfig alloc] init];
    formData.name = name;
    formData.fileURL = fileURL;
    return formData;
}

+ (instancetype)formDataWithName:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType fileURL:(NSURL *)fileURL {
    XJUploadDataConfig *formData = [[XJUploadDataConfig alloc] init];
    formData.name = name;
    formData.fileName = fileName;
    formData.mimeType = mimeType;
    formData.fileURL = fileURL;
    return formData;
}
@end
