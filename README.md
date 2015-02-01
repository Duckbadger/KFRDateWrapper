KFRDateWrapper
==============
At WWDC 2013, in the Keynote "[Solutions to Common Date and Time Challenges](http://asciiwwdc.com/2013/sessions/227)" , it was noted by Chris Kane to use noon as a timestamp, the reason being that using midnight can be problematic due to time changes between seasons.
Doing this every time can get tedious, especially when writing apps that use timestamps frequently, so I created my own date wrappers. 

Usage
========
There are a few methods available to create a date object set to noon.

    +(NSDate *)kfr_noonToday
	+(NSDate *)kfr_noonWithDaysOffset:(NSInteger)daysOffset
	+(NSDate *)kfr_noonForDate:(NSDate *)date
     
There are also some really nice and simple additions to help with date handling.

    +(BOOL)kfr_isToday:(NSDate *)date
    +(BOOL)kfr_wasYesterday:(NSDate *)date
    +(BOOL)kfr_isTomorrow:(NSDate *)date

And additional methods that you may find useful.

    -(NSDate *)kfr_dateWithDaysOffset:
    -(NSInteger)daysOffset
    +(NSDate *)kfr_startOfDayForDate:(NSDate *)date
    +(NSDate *)kfr_endOfDayForDate:(NSDate *)date
    +(NSTimeInterval)kfr_dayLengthInterval

TO DO
======

 - Podspec
 - Alias methods to remove "kfr_" prefix

License
========

MIT

Copyright (c) 2015 Ken Boucher. All rights reserved.

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