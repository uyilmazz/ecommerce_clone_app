import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get height => mediaQuery.size.height;
  double get witdh => mediaQuery.size.width;
  double dynamicHeight(value) => height * value;
  double dynamicWidth(value) => witdh * value;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension PaddingExtension on BuildContext {
  EdgeInsets get lowPadding => EdgeInsets.all(lowValue);
  EdgeInsets get normalPadding => EdgeInsets.all(normalValue);
  EdgeInsets get mediumPadding => EdgeInsets.all(mediumValue);
  EdgeInsets get highPadding => EdgeInsets.all(highValue);
}

extension SymetricPaddingExtension on BuildContext {
  EdgeInsets get verticalLowPadding => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get verticalNormalPadding =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get verticalMediumPadding =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get verticalHighPadding =>
      EdgeInsets.symmetric(vertical: highValue);

  EdgeInsets get horizontalLowPadding =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get horizontalNormalPadding =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get horizontalMediumPadding =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get horizontalHighPadding =>
      EdgeInsets.symmetric(horizontal: highValue);

  EdgeInsets get verticalAndHorizontalLowPadding =>
      EdgeInsets.symmetric(vertical: lowValue, horizontal: lowValue);
  EdgeInsets get verticalAndHorizontalNormalPadding =>
      EdgeInsets.symmetric(vertical: normalValue, horizontal: normalValue);
  EdgeInsets get verticalAndHorizontalMediumPadding =>
      EdgeInsets.symmetric(vertical: mediumValue, horizontal: mediumValue);
  EdgeInsets get verticalAndHorizontalHighPadding =>
      EdgeInsets.symmetric(vertical: highValue, horizontal: highValue);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}
