//
//  NSString+Time.m
//  CollectionViewDemo(MVVM)
//
//  Created by majianjie on 2019/4/10.
//  Copyright © 2019 majianjie. All rights reserved.
//

#import "NSString+Time.h"


typedef NS_ENUM(NSInteger, FLMiscUtilityDateFormat) {
    FLMiscUtilityDateFormat_FORMAT1,
    FLMiscUtilityDateFormat_FORMAT2,
    FLMiscUtilityDateFormat_FORMAT3,
    FLMiscUtilityDateFormat_FORMAT4,
    FLMiscUtilityDateFormat_FORMAT5,
    FLMiscUtilityDateFormat_FORMAT6,
    FLMiscUtilityDateFormat_FORMAT7,
    FLMiscUtilityDateFormat_FORMAT8,
    FLMiscUtilityDateFormat_FORMAT9,
    FLMiscUtilityDateFormat_FORMAT10,
    FLMiscUtilityDateFormat_FORMAT11,
    FLMiscUtilityDateFormat_FORMAT12,
    FLMiscUtilityDateFormat_FORMAT13,
    FLMiscUtilityDateFormat_FORMAT14,
    FLMiscUtilityDateFormat_FORMAT15,
    FLMiscUtilityDateFormat_FORMAT16,
    FLMiscUtilityDateFormat_FORMAT17,
    FLMiscUtilityDateFormat_FORMAT18,
    FLMiscUtilityDateFormat_FORMAT19,
    FLMiscUtilityDateFormat_FORMAT20,
};


static NSString *FORMAT1 = @"yyyyMMddHHmmss";
static NSString *FORMAT2 = @"yyyy-MM-dd HH:mm:ss";
static NSString *FORMAT3 = @"yyyy-M-d HH:mm:ss";
static NSString *FORMAT4 = @"yyyy-MM-dd HH:mm";
static NSString *FORMAT5 = @"yyyy-M-d HH:mm";
static NSString *FORMAT6 = @"yyyyMMdd";
static NSString *FORMAT7 = @"yyyy-MM-dd";
static NSString *FORMAT8 = @"yyyy-M-d";
static NSString *FORMAT9 = @"yyyy年MM月dd日";
static NSString *FORMAT10 = @"yyyy年M月d日";
static NSString *FORMAT11 = @"M月d日";
static NSString *FORMAT12 = @"HH:mm:ss";
static NSString *FORMAT13 = @"HH:mm";
static NSString *FORMAT14 = @"yyyy/MM/dd";
static NSString *FORMAT15 = @"yyyy年MM月";
static NSString *FORMAT16 = @"yyyyMMddHHmmssSSS";
static NSString *FORMAT17 = @"yyyy-MM-dd HH:mm:ss.SSS";
static NSString *FORMAT18 = @"yyyy/MM/dd HH:mm:ss";
static NSString *FORMAT19 = @"yyyy-MM";
static NSString *FORMAT20 = @"yyyy/MM/dd HH:mm";



@implementation NSString (Time)

-(NSString *)convertToJsonData:(NSDictionary *)dict{
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}



+ (NSString*)getDateTextWithTimeStamp:(long long)timeStamp {
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *date = [NSDate date];
    NSDate * date1 =  [[NSDate alloc] initWithTimeIntervalSinceNow:-secondsPerDay];
    NSDate * date2 =  [[NSDate alloc] initWithTimeIntervalSinceNow:-secondsPerDay*2];
    
    NSString *comeDate = [self formatDateTime:timeStamp format:FLMiscUtilityDateFormat_FORMAT6];
    
    NSString *strDate = [self formatDate:date format:FLMiscUtilityDateFormat_FORMAT6];
    NSString *strDate1 = [self formatDate:date1 format:FLMiscUtilityDateFormat_FORMAT6];
    NSString *strDate2 = [self formatDate:date2 format:FLMiscUtilityDateFormat_FORMAT6];
    
    if ([comeDate isEqualToString:strDate]) {
        return @"今日";
    }else if ([comeDate isEqualToString:strDate1]) {
        return @"昨天";
    }else if ([comeDate isEqualToString:strDate2]) {
        return @"前天";
    }else {
        NSString *result;
        if (comeDate.length == 8) {
            result = [NSString stringWithFormat:@"%@月%@日", [comeDate substringWithRange:NSMakeRange(4, 2)], [comeDate substringWithRange:NSMakeRange(6, 2)]];
        }else {
            result = @"更早";
        }
        return result;
    }
}

+ (NSString *)formatDateTime:(long long)time format:(FLMiscUtilityDateFormat)format {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    return [self formatDate:date format:format];
}

+ (NSString *)formatDate:(NSDate*)date format:(FLMiscUtilityDateFormat)format {
    NSString *strFormat = [self formatText: format];
    if (!strFormat) return nil;
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"]];
    [dateFormater setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    [dateFormater setDateFormat:strFormat];
    NSString *str = [dateFormater stringFromDate:date];
    return str;
}

+ (NSString*)formatText:(FLMiscUtilityDateFormat)format {
    switch (format) {
        case FLMiscUtilityDateFormat_FORMAT1:
            return FORMAT1;
        case FLMiscUtilityDateFormat_FORMAT2:
            return FORMAT2;
        case FLMiscUtilityDateFormat_FORMAT3:
            return FORMAT3;
        case FLMiscUtilityDateFormat_FORMAT4:
            return FORMAT4;
        case FLMiscUtilityDateFormat_FORMAT5:
            return FORMAT5;
        case FLMiscUtilityDateFormat_FORMAT6:
            return FORMAT6;
        case FLMiscUtilityDateFormat_FORMAT7:
            return FORMAT7;
        case FLMiscUtilityDateFormat_FORMAT8:
            return FORMAT8;
        case FLMiscUtilityDateFormat_FORMAT9:
            return FORMAT9;
        case FLMiscUtilityDateFormat_FORMAT10:
            return FORMAT10;
        case FLMiscUtilityDateFormat_FORMAT11:
            return FORMAT11;
        case FLMiscUtilityDateFormat_FORMAT12:
            return FORMAT12;
        case FLMiscUtilityDateFormat_FORMAT13:
            return FORMAT13;
        case FLMiscUtilityDateFormat_FORMAT14:
            return FORMAT14;
        case FLMiscUtilityDateFormat_FORMAT15:
            return FORMAT15;
        case FLMiscUtilityDateFormat_FORMAT16:
            return FORMAT16;
        case FLMiscUtilityDateFormat_FORMAT17:
            return FORMAT17;
        case FLMiscUtilityDateFormat_FORMAT18:
            return FORMAT18;
        case FLMiscUtilityDateFormat_FORMAT19:
            return FORMAT19;
        case FLMiscUtilityDateFormat_FORMAT20:
            return FORMAT20;
        default:
            return nil;
    }
}

@end


//    NSDictionary *dic = @{

//                           @"home" : @"papertiger",

//                           @"folks":@[

//                                   @{

//                                       @"name" : @"小n",

//                                       @"role" : @"2",

//                                       @"devices" : @"98:5a:eb:c9:3b:08"

//                                       },

//                                   @{

//                                       @"name" : @"小m",

//                                       @"role" : @"6",

//                                       @"devices" : @"98:5a:eb:g9:3b:08"

//                                       }

//                                   ]

//                           };

//    NSString *jst = [self dictionaryToJson:dic];
