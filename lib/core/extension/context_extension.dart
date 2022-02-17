import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get witdh => mediaQuery.size.width;
  double dynamicHeight(value) => height * value;
  double dynamicWidth(value) => witdh * value;

  double get heighLowValue => height * 0.01;
  double get heightNormalValue => height * 0.02;
  double get heightMediumValue => height * 0.04;
  double get heightHighValue => height * 0.1;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get heightLowPadding => EdgeInsets.all(heighLowValue);
  EdgeInsets get heightNormalPadding => EdgeInsets.all(heightNormalValue);
  EdgeInsets get heightMediumPadding => EdgeInsets.all(heightMediumValue);
  EdgeInsets get heightHighPadding => EdgeInsets.all(heightHighValue);
}

extension SymetricPaddingExtension on BuildContext {
  EdgeInsets get verticalLowPadding =>
      EdgeInsets.symmetric(vertical: heighLowValue);
  EdgeInsets get verticalNormalPadding =>
      EdgeInsets.symmetric(vertical: heightNormalValue);
  EdgeInsets get verticalMediumPadding =>
      EdgeInsets.symmetric(vertical: heightMediumValue);
  EdgeInsets get verticalHighPadding =>
      EdgeInsets.symmetric(vertical: heightHighValue);

  EdgeInsets get horizontalLowPadding =>
      EdgeInsets.symmetric(horizontal: heighLowValue);
  EdgeInsets get horizontalNormalPadding =>
      EdgeInsets.symmetric(horizontal: heightNormalValue);
  EdgeInsets get horizontalMediumPadding =>
      EdgeInsets.symmetric(horizontal: heightMediumValue);
  EdgeInsets get horizontalHighPadding =>
      EdgeInsets.symmetric(horizontal: heightHighValue);

  EdgeInsets get verticalAndHorizontalLowPadding =>
      EdgeInsets.symmetric(vertical: heighLowValue, horizontal: heighLowValue);
  EdgeInsets get verticalAndHorizontalNormalPadding => EdgeInsets.symmetric(
      vertical: heightNormalValue, horizontal: heightNormalValue);
  EdgeInsets get verticalAndHorizontalMediumPadding => EdgeInsets.symmetric(
      vertical: heightMediumValue, horizontal: heightMediumValue);
  EdgeInsets get verticalAndHorizontalHighPadding => EdgeInsets.symmetric(
      vertical: heightHighValue, horizontal: heightHighValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
