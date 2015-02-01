/*
 Copyright (c) 2015 Ken Boucher
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

//  NSDate+Midday.h
//  Caffeinated
//
//  Created by Ken Boucher on 26/08/2013.
//  Copyright (c) 2015 SleekGeek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extensions)

/**
 *  Returns an NSTimeInterval representing a day.
 *
 *  @return An NSTimeInterval representing a day.
 */
+ (NSTimeInterval)kfr_dayLengthInterval;

/**
 *  Returns a new date set to noon today.
 *
 *  @return NSDate object set to noon today
 */
+ (NSDate *)kfr_noonToday;

/**
 *  Returns a new date by offsetting by n days on the receiver.
 *
 *  @param daysOffset The number of days to offset.
 *
 *  @return A new date offset by the number of days.
 */
- (NSDate *)kfr_dateWithDaysOffset:(NSInteger)daysOffset;

/**
 *  Returns a new date set to noon plus or minus n days.
 *
 *  @param daysOffset The number of days +/- to offset
 *
 *  @return A new date set to noon +/- days offset
 */
+ (NSDate *)kfr_noonWithDaysOffset:(NSInteger)daysOffset;

/**
 *  Returns a new date set to the date given at noon.
 *
 *  @param date The date to use as a base.
 *
 *  @return A new date set to the date given at noon.
 */
+ (NSDate *)kfr_noonForDate:(NSDate *)date;

/**
 *  Returns a new date set to the start of the day (midnight) for a given date.
 *
 *  @param date The date to use as a base.
 *
 *  @return A new date set to midnight for the given date.
 */
+ (NSDate *)kfr_startOfDayForDate:(NSDate *)date;

/**
 *  Returns a new date set the end of the day (23:59pm) for a given date.
 *
 *  @param date The date to use as a base.
 *
 *  @return A new date set to 2359 hours for the given date.
 */
+ (NSDate *)kfr_endOfDayForDate:(NSDate *)date;

/**
 *  Checks whether the given date is today.
 *
 *  @param date The date to compare against.
 *
 *  @return YES if the date is today, otherwise NO.
 */
+ (BOOL)kfr_isToday:(NSDate *)date;

/**
 *  Checks whether the given date was yesterday.
 *
 *  @param date The date to compare against.
 *
 *  @return YES if the date was yesterday, otherwise NO.
 */
+ (BOOL)kfr_wasYesterday:(NSDate *)date;

/**
 *  Checks whether the given date is tomorrow.
 *
 *  @param date The date to compae against.
 *
 *  @return YES if the date is tomorrow, otherwise NO.
 */
+ (BOOL)kfr_isTomorrow:(NSDate *)date;

@end
