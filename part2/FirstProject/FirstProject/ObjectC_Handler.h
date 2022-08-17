//
//  ObjectC_Handler.h
//  FirstProject
//
//  Created by boyaa on 2022/8/17.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectC_Handler : NSObject

+(void) runNormalSql:(NSString *)splString;
+(void) selectSql;
@end

NS_ASSUME_NONNULL_END
