//
//  Person.h
//  YERealmDemo
//
//  Created by yongen on 17/3/30.
//  Copyright © 2017年 yongen. All rights reserved.
//

#import <Realm/Realm.h>

@interface Person : RLMObject

@property (nonatomic, assign) NSInteger ID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, assign) NSInteger age;

- (void)addData;
- (void)deleteData;
- (void)modifyData;
- (void)selectData;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person>
RLM_ARRAY_TYPE(Person)

