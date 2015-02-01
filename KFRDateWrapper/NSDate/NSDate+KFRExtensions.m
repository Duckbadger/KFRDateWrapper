//
//  NSDate+Midday.m
//  Caffeinated
//
//  Created by Ken Boucher on 26/08/2013.
//  Copyright (c) 2013 SleekGeek. All rights reserved.
//

#import "NSDate+KFRExtensions.h"

@implementation NSDate (Extensions)

+ (NSDate *)kfr_noonToday
{
	NSDate *today = [NSDate date];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay
							 fromDate:today];
	components.hour = 12;
	components.minute = 0;
  components.second = 0;

  return [calendar dateFromComponents:components];
}

- (NSDate *)kfr_dateWithDaysOffset:(NSInteger)daysOffset
{
  return [self dateByAddingTimeInterval:[NSDate kfr_dayLengthInterval] * daysOffset];
}

+ (NSDate *)kfr_noonWithDaysOffset:(NSInteger)daysOffset
{
	NSDate *dateDaysAgo = [NSDate dateWithTimeIntervalSinceNow:(daysOffset * [NSDate kfr_dayLengthInterval])];
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay
											   fromDate:dateDaysAgo];
	components.hour = 12;
	components.minute = 0;
  components.second = 0;
	
  return [calendar dateFromComponents:components];
}

+ (NSDate *)kfr_noonForDate:(NSDate *)date
{
  NSParameterAssert(date);
	NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *components = [calendar components:kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay
											   fromDate:date];
	components.hour = 12;
	components.minute = 0;
  components.second = 0;
	
  return [calendar dateFromComponents:components];
}

+ (NSDate *)kfr_startOfDayForDate:(NSDate *)date
{
  NSParameterAssert(date);
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay
											   fromDate:date];
	components.hour = 0;
	components.minute = 0;
  components.second = 0;
	
  return [calendar dateFromComponents:components];
}

+ (NSDate *)kfr_endOfDayForDate:(NSDate *)date
{
  NSParameterAssert(date);
	NSCalendar *calendar = [NSCalendar currentCalendar];
	NSDateComponents *components = [calendar components:kCFCalendarUnitYear | kCFCalendarUnitMonth | kCFCalendarUnitDay
											   fromDate:date];
	components.hour = 23;
	components.minute = 59;
  components.second = 59;
	
  return [calendar dateFromComponents:components];
}

+ (NSTimeInterval)kfr_dayLengthInterval
{
	// 60s * 60m * 24h
	return 60 * 60 * 24;
}

+ (BOOL)kfr_isToday:(NSDate *)date
{
  if (!date) {
    return NO;
  }
  
	NSTimeInterval startToday = [NSDate kfr_startOfDayForDate:[NSDate date]].timeIntervalSinceReferenceDate;
	NSTimeInterval endToday = [NSDate kfr_endOfDayForDate:[NSDate date]].timeIntervalSinceReferenceDate;
	NSTimeInterval dateInterval = date.timeIntervalSinceReferenceDate;
	
  return (startToday < dateInterval && dateInterval < endToday);
}

+ (BOOL)kfr_wasYesterday:(NSDate *)date
{
  if (!date) {
    return NO;
  }
  
	NSTimeInterval startYesterday = [NSDate kfr_startOfDayForDate:[NSDate date]].timeIntervalSinceReferenceDate - [NSDate kfr_dayLengthInterval];
	NSTimeInterval endYesterday = [NSDate kfr_endOfDayForDate:[NSDate date]].timeIntervalSinceReferenceDate - [NSDate kfr_dayLengthInterval];
	NSTimeInterval dateInterval = date.timeIntervalSinceReferenceDate;
	
  return (startYesterday < dateInterval && dateInterval < endYesterday);
}

+ (BOOL)kfr_isTomorrow:(NSDate *)date
{
  if (!date) {
    return NO;
  }
  
  NSTimeInterval startTomorrow = [NSDate kfr_startOfDayForDate:[NSDate date]].timeIntervalSinceReferenceDate + [NSDate kfr_dayLengthInterval];
  NSTimeInterval endTomorrow = [NSDate kfr_endOfDayForDate:[NSDate date]].timeIntervalSinceReferenceDate + [NSDate kfr_dayLengthInterval];
  NSTimeInterval dateInterval = date.timeIntervalSinceReferenceDate;
  
  return (startTomorrow < dateInterval && dateInterval < endTomorrow);
}

@end
