//
//  Dictionary.h
//  DictionaryDemo
//
//  Created by wentilin on 2020/9/21.
//  Copyright © 2020 wentilin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LWHDictionary: NSObject

- (void)insertObject:(id<NSObject>)value forKey:(nonnull id<NSObject>)key;

- (nullable id<NSObject>)getObjectWith: (id<NSObject>)key;

@end

NS_ASSUME_NONNULL_END
