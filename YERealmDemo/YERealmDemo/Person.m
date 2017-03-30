//
//  Person.m
//  YERealmDemo
//
//  Created by yongen on 17/3/30.
//  Copyright © 2017年 yongen. All rights reserved.
//

#import "Person.h"


@implementation Person
{
    NSInteger _Count;
}

- (void)addData{
    //数据库操作对象
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        Person *temp = [[Person alloc]init];
        temp.ID = _Count++;
        temp.name = @"muyang";
        
        [realm addObject:temp];
        
        [realm commitWriteTransaction];
    }];
}

- (void)deleteData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        
        //        // 获得对象
        //        RLMResults *result = [SpeciesModel allObjects];
        //        // 一条条删除
        //        [realm deleteObject:result.firstObject];
        
        // 全部清空
        [realm deleteAllObjects];
    }];
}

- (void)modifyData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        RLMResults *result = [Person allObjects];
        //获得第一个对象
        Person *firstObject = [result objectAtIndex:2];
        
        //修改sex
        firstObject.sex = @"shen";
        
        //提交事务，即被修改
        [realm commitWriteTransaction];
    }];
}

- (void)selectData {
    RLMResults *tempArray = [Person allObjects];
    for (Person *model in tempArray) {
        NSLog(@"ID : %ld, name : %@, age : %ld , sex : %@",model.ID,model.name,model.age,model.sex);
    }
}
// Specify default values for properties

+ (NSDictionary*)defaultPropertyValues {
    return @{@"age":@"18", @"sex":@"man"};
}

+ (NSDictionary*)replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

//+ (NSString*)primaryKey {
//    return @"ID";
//}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties {
    return @[@"ignore"];
}

@end
