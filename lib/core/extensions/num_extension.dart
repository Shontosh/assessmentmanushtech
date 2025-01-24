import 'dart:async';

extension NumExtension on num {
  bool isLowerThan(num b) => b < this;

  bool isGreaterThan(num b) => b > this;

  bool isEqual(num b) => b == this;

  Future delay([FutureOr Function()? callback]) async => Future.delayed(
    Duration(milliseconds: (this * 1000).round()),
    callback,
  );

  Duration get milliseconds => Duration(microseconds: (this * 1000).round());

  Duration get seconds => Duration(milliseconds: (this * 1000).round());

  Duration get minutes =>
      Duration(seconds: (this * Duration.secondsPerMinute).round());

  Duration get hours =>
      Duration(minutes: (this * Duration.minutesPerHour).round());

  Duration get days => Duration(hours: (this * Duration.hoursPerDay).round());


}