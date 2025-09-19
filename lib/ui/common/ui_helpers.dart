import 'dart:math';

import 'package:flutter/material.dart';

const double _tinySize = 5.0;
const double _smallSize = 10.0;
const double _mediumSize = 25.0;
const double _largeSize = 50.0;
const double _massiveSize = 120.0;

const Widget horizontalSpaceTiny = SizedBox(width: _tinySize);
const Widget horizontalSpaceSmall = SizedBox(width: _smallSize);
const Widget horizontalSpaceMedium = SizedBox(width: _mediumSize);
const Widget horizontalSpaceLarge = SizedBox(width: _largeSize);

const Widget verticalSpaceTiny = SizedBox(height: _tinySize);
const Widget verticalSpaceSmall = SizedBox(height: _smallSize);
const Widget verticalSpaceMedium = SizedBox(height: _mediumSize);
const Widget verticalSpaceLarge = SizedBox(height: _largeSize);
const Widget verticalSpaceMassive = SizedBox(height: _massiveSize);

Widget spacedDivider = const Column(
  children: <Widget>[
    verticalSpaceMedium,
    Divider(color: Colors.blueGrey, height: 5.0),
    verticalSpaceMedium,
  ],
);

Widget verticalSpace(double height) => SizedBox(height: height);

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) =>
    min((screenHeight(context) - offsetBy) / dividedBy, max);

double screenWidthFraction(
  BuildContext context, {
  int dividedBy = 1,
  double offsetBy = 0,
  double max = 3000,
}) =>
    min((screenWidth(context) - offsetBy) / dividedBy, max);

double halfScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 2);

double thirdScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 3);

double quarterScreenWidth(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 4);

double getResponsiveHorizontalSpaceMedium(BuildContext context) =>
    screenWidthFraction(context, dividedBy: 10);
double getResponsiveSmallFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 14, max: 15);

double getResponsiveMediumFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 16, max: 17);

double getResponsiveLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 21, max: 31);

double getResponsiveExtraLargeFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 25);

double getResponsiveMassiveFontSize(BuildContext context) =>
    getResponsiveFontSize(context, fontSize: 30);

double getResponsiveFontSize(
  BuildContext context, {
  double? fontSize,
  double? max,
}) {
  max ??= 100;

  var responsiveSize = min(
    screenWidthFraction(context, dividedBy: 10) * ((fontSize ?? 100) / 100),
    max,
  );

  return responsiveSize;
}

// Additional mobile-specific helpers for exercise views
double getMobileTitleSize(BuildContext context) {
  return getResponsiveFontSize(context, fontSize: 24, max: 28);
}

double getMobileSubtitleSize(BuildContext context) {
  return getResponsiveFontSize(context, fontSize: 16, max: 18);
}

double getMobileBodySize(BuildContext context) {
  return getResponsiveFontSize(context, fontSize: 14, max: 16);
}

double getMobileCaptionSize(BuildContext context) {
  return getResponsiveFontSize(context, fontSize: 12, max: 14);
}

double getMobilePadding(BuildContext context) {
  return screenWidthFraction(context, dividedBy: 20);
}

double getMobileCardPadding(BuildContext context) {
  return screenWidthFraction(context, dividedBy: 25);
}

double getMobileCardRadius(BuildContext context) {
  return screenWidthFraction(context, dividedBy: 30);
}

double getMobileIconSize(BuildContext context) {
  return screenWidthFraction(context, dividedBy: 15);
}

double getMobileButtonHeight(BuildContext context) {
  return screenHeightFraction(context, dividedBy: 15);
}

double getExerciseCardHeight(BuildContext context) {
  return screenHeightFraction(context, dividedBy: 3);
}

double getExerciseImageHeight(BuildContext context) {
  return screenHeightFraction(context, dividedBy: 4);
}

double getSetRowHeight(BuildContext context) {
  return screenHeightFraction(context, dividedBy: 12);
}

double getProgressIndicatorSize(BuildContext context) {
  return screenWidthFraction(context, dividedBy: 6);
}
