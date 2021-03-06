//
//  Dictionary.m
//  DictionaryDemo
//
//  Created by wentilin on 2020/9/21.
//  Copyright © 2020 wentilin. All rights reserved.
//

#import "LWHDictionary.h"
#import <pthread/pthread.h>

#define SIZE 100

@interface _Bucket : NSObject

@property (nonatomic, strong, nullable) id<NSObject> key;
@property (nonatomic, strong, nullable) id<NSObject> value;
@property (nonatomic, assign) BOOL isNull;
@property (nonatomic, strong, nullable) _Bucket *next;

- (instancetype)initWithKey:(id<NSObject>)key value:(id<NSObject>)value;

+ (instancetype)null;

@end

@implementation _Bucket

- (instancetype)initWithKey:(id<NSObject>)key value:(id<NSObject>)value {
    if (self = [super init]) {
        _key = key;
        _value = value;
        _isNull = false;
    }
    
    return self;
}

+ (instancetype)null {
    return [[_Bucket alloc] init];
}

@end

@interface LWHDictionary() {
    NSMutableArray<_Bucket *> *_buckets;
    pthread_rwlock_t _rwlock;
}

@end

@implementation LWHDictionary

- (instancetype)init {
    if (self = [super init]) {
        _buckets = [[NSMutableArray alloc] initWithCapacity:SIZE];
        for (int i = 0; i < 100; i++) {
            [_buckets addObject: [_Bucket null]];
        }
        
        pthread_rwlock_init(&_rwlock, NULL);
    }
    
    return self;
}

- (void)dealloc {
    pthread_rwlock_destroy(&_rwlock);
}

- (void)insertObject:(NSObject *)value forKey:(nonnull NSObject *)key {
    pthread_rwlock_trywrlock(&_rwlock);
    
    NSUInteger hash = [self hash:key] % SIZE;
    
    _Bucket *bucket = [_buckets objectAtIndex:hash];
    if (bucket.isNull || [bucket.key isEqual:key]) {
        bucket.key = key;
        bucket.value = value;
        bucket.isNull = false;
    } else {
        _Bucket *next = bucket.next;
        while (next != NULL) {
            if ([next.key isEqual:key]) {
                next.value = value;
                next.isNull = false;
                
                break;
            }
            
            if (next.next == NULL) {
                next.next = [[_Bucket alloc] initWithKey:key value:value];
                break;
            }
            
            next = next.next;
        }
        
        if (next == NULL) {
            bucket.next = [[_Bucket alloc] initWithKey:key value:value];
        }
    }
    
    pthread_rwlock_unlock(&_rwlock);
}

- (nullable id<NSObject>)getObjectWith: (id<NSObject>)key {
    pthread_rwlock_tryrdlock(&_rwlock);
    
    NSUInteger hash = [self hash:key] % SIZE;
    if (hash >= _buckets.count) {
        pthread_rwlock_unlock(&_rwlock);
        return NULL;
    }
    
    _Bucket *bucket = [_buckets objectAtIndex:hash];
    if (bucket.isNull) {
        pthread_rwlock_unlock(&_rwlock);
        return NULL;
    }
    
    while (bucket != NULL) {
        if ([bucket.key isEqual:key]) {
            pthread_rwlock_unlock(&_rwlock);
            return bucket.value;
        }
        
        bucket = bucket.next;
    }
    
    pthread_rwlock_unlock(&_rwlock);
    return NULL;
}

- (NSUInteger)hash:(NSObject *)key {
    return [key hash];
}

@end
