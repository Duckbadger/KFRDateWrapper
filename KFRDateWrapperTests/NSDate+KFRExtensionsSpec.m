//
//  NSDate+KFRExtensionsSpec.m
//  KFRDateWrapper
//
//  Created by Ken Boucher on 01/02/2015.
//  Copyright (c) 2015 SleekGeek. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"

#import "NSDate+KFRExtensions.h"

SpecBegin(NSDate_KFRExtensions)

describe(@"NSDate+KFRExtensions", ^{

  __block NSDate *baseDate = nil;
  __block NSDateComponents *baseComponents = nil;
  __block NSCalendar *calendar = nil;
  NSInteger noonHourUnit = 12;
  
  beforeEach(^{
    calendar = [NSCalendar currentCalendar];
    baseDate = [NSDate date];
    baseComponents = [calendar components:NSCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay | kCFCalendarUnitHour | NSCalendarUnitSecond fromDate:baseDate];
  });
  
  it(@"Should return a date representing noon today", ^{
    NSDate *noon = [NSDate kfr_noonToday];
    NSDateComponents *components = [calendar components:kCFCalendarUnitHour | kCFCalendarUnitMinute | kCFCalendarUnitSecond
                                               fromDate:noon];
    expect(components.hour).to.equal(12);
    expect(components.minute).to.equal(0);
    expect(components.second).to.equal(0);
  });
  
  it(@"Should return a new date with the offset correct", ^{
    NSInteger dayOffset = 3;
    NSDate *manualOffsetDate = [baseDate dateByAddingTimeInterval:[NSDate kfr_dayLengthInterval] * dayOffset];
    NSDate *wrapperOffsetDate = [baseDate kfr_dateWithDaysOffset:dayOffset];
    expect(manualOffsetDate.timeIntervalSinceReferenceDate).to.equal(wrapperOffsetDate.timeIntervalSinceReferenceDate);
  });
  
  it(@"Should return a date with the correct offset", ^{
    NSDate *baseDate = [NSDate date];
    NSInteger pastDaysOffset = -5;
    NSDate *pastDate = [NSDate kfr_noonWithDaysOffset:pastDaysOffset];
    NSDateComponents *pastDateComponents = [calendar components:kCFCalendarUnitDay | kCFCalendarUnitHour fromDate:pastDate];
    NSDate *manualPastDate = [baseDate dateByAddingTimeInterval:[NSDate kfr_dayLengthInterval] * pastDaysOffset];
    NSDateComponents *manualPastComponents = [calendar components:kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay fromDate:manualPastDate];
    expect(pastDateComponents.day).to.equal(manualPastComponents.day);
    expect(pastDateComponents.hour).to.equal(noonHourUnit);
  });
  
  it(@"Should return noon for a given date", ^{
    NSInteger pastDaysOffset = -5;
    NSDate *manualDate = [baseDate dateByAddingTimeInterval:[NSDate kfr_dayLengthInterval] * pastDaysOffset];
    NSDate *noonForManualDate = [NSDate kfr_noonForDate:manualDate];
    
    NSDateComponents *manualDateComponents = [calendar components:NSCalendarUnitDay fromDate:manualDate];
    NSDateComponents *noonDateComponents = [calendar components:kCFCalendarUnitDay | kCFCalendarUnitHour fromDate:noonForManualDate];
    expect(manualDateComponents.day).to.equal(noonDateComponents.day);
    expect(noonDateComponents.hour).to.equal(noonHourUnit);
  });
  
  it(@"Should return the start of the day for a given date", ^{
    NSDate *startOfToday = [NSDate kfr_startOfDayForDate:baseDate];
    NSDateComponents *startComponents = [calendar components:kCFCalendarUnitDay | kCFCalendarUnitHour fromDate:startOfToday];
    expect([startOfToday earlierDate:baseDate]).to.equal(startOfToday);
    expect(startComponents.day).to.equal(baseComponents.day);
    expect(startComponents.hour).to.equal(0);
  });
  
  it(@"Should return the start of the day for a given date", ^{
    NSDate *endOfToday = [NSDate kfr_endOfDayForDate:baseDate];
    NSDateComponents *endComponents = [calendar components:kCFCalendarUnitDay | kCFCalendarUnitHour fromDate:endOfToday];
    expect([endOfToday earlierDate:baseDate]).to.equal(baseDate);
    expect(endComponents.day).to.equal(baseComponents.day);
    expect(endComponents.hour).to.equal(23);
  });
  
  it(@"Should be able to check if date is today", ^{
    expect([NSDate kfr_isToday:baseDate]).to.equal(YES);
  });
  
  it(@"Should be able to check if date was yesterday", ^{
    NSDate *manualyesterday = [baseDate dateByAddingTimeInterval:-[NSDate kfr_dayLengthInterval]];
    expect([NSDate kfr_wasYesterday:manualyesterday]).to.equal(YES);
  });
  
  it(@"Should be able to check if date is tomorrow", ^{
    NSDate *manualTomorrow = [baseDate dateByAddingTimeInterval:[NSDate kfr_dayLengthInterval]];
    expect([NSDate kfr_isTomorrow:manualTomorrow]).to.equal(YES);
  });
  
});

SpecEnd