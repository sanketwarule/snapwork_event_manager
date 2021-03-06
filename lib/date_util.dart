import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var monthsNames = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec"
];

bool leapYear(int year) {
  bool leapYear = false;

  bool leap = ((year % 100 == 0) && (year % 400 != 0));
  if (leap == true)
    leapYear = false;
  else if (year % 4 == 0) leapYear = true;

  return leapYear;
}

int daysInMonth(final int monthNum, final int year) {
  List<int> monthLength = List(12);

  monthLength[0] = 31;
  monthLength[2] = 31;
  monthLength[4] = 31;
  monthLength[6] = 31;
  monthLength[7] = 31;
  monthLength[9] = 31;
  monthLength[11] = 31;
  monthLength[3] = 30;
  monthLength[8] = 30;
  monthLength[5] = 30;
  monthLength[10] = 30;

  if (leapYear(year) == true)
    monthLength[1] = 29;
  else
    monthLength[1] = 28;

  return monthLength[monthNum];
}


String getFormattedDate(int dateToBeFormat) {
  if (dateToBeFormat != null) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(dateToBeFormat);
    return "${date.day}-${monthsNames[date.month - 1]}-${date.year}";
  }
}


DateTime toDateTimeFormat(String date, String time){
  if(date != null && time != null){
    var format;
    if(time.contains(" ")) {
      format = DateFormat("dd'-'MMM'-'yyyy hh:mm a");
    }else{
      format = DateFormat("dd'-'MMM'-'yyyy hh:mma");
    }


    return format.parse('$date $time');
  }
}
