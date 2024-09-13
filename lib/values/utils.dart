import 'package:flutter/material.dart';

extension IntExtension on int {
  Widget get spaceX => SizedBox(width: toDouble());
  Widget get spaceY => SizedBox(height: toDouble());

  Duration get days => Duration(days: this);
  Duration get hours => Duration(hours: this);
  Duration get minutes => Duration(minutes: this);
  Duration get seconds => Duration(seconds: this);
  Duration get milliseconds => Duration(milliseconds: this);
  Duration get microseconds => Duration(microseconds: this);
}

extension DoubleExtension on double {
  Widget get spaceX => SizedBox(width: this);
  Widget get spaceY => SizedBox(height: this);

  Duration get days => Duration(days: toInt());
  Duration get hours => Duration(hours: toInt());
  Duration get minutes => Duration(minutes: toInt());
  Duration get seconds => Duration(seconds: toInt());
  Duration get milliseconds => Duration(milliseconds: toInt());
  Duration get microseconds => Duration(microseconds: toInt());
}

extension ColorExtension on Color {
  Color o(double value) => this.withOpacity(value);
  Color withOpacity(double value) => this.withOpacity(value);
}

extension ContextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension WidgetExtension on Widget {
  Widget centered() => Center(child: this);
  Widget expanded({int flex = 1}) => Expanded(flex: flex, child: this);
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) => Flexible(flex: flex, fit: fit, child: this);
}
