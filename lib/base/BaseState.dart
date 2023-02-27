import 'package:flutter/material.dart';
import 'package:my_wedding_web/Values/MyColors.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../Values/FontsApp.dart';
import '../Values/ResponsiveApp.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double scrollPosition = 0;

  late ResponsiveApp responsiveApp;
  late AutoScrollController autoScrollController;

  double opacity = 0;

  _scrollListener() {
    setState(() {
      scrollPosition = autoScrollController.position.pixels;
    });
  }

  @override
  void initState() {
    autoScrollController = AutoScrollController(
        //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
        axis: Axis.vertical);

    autoScrollController.addListener(_scrollListener);
    super.initState();
  }

  void init(BuildContext context) {
    responsiveApp = ResponsiveApp(context);

    opacity = scrollPosition < responsiveApp.opacityHeight ? scrollPosition / responsiveApp.opacityHeight : 1;
  }

  getTextTheme() => TextTheme(
    titleLarge: TextStyle(color: secondaryColor, fontSize: responsiveApp.headline6),
    headlineLarge: TextStyle(color: secondaryColor, fontSize: responsiveApp.headline2, fontWeight: FontWeight.w600,),
    headlineMedium: TextStyle(
      color: primaryColor,
      fontSize: responsiveApp.headline3,
      fontFamily: FONT_MONTSERRAT,
      fontWeight: FontWeight.w400,
      letterSpacing: responsiveApp.letterSpacingHeaderWidth
    ),
    bodyLarge: TextStyle(
        color: secondaryColor,
        fontFamily: FONT_MONTSERRAT,
        fontSize: responsiveApp.bodyText1
    ),
    bodyMedium: TextStyle(
        color: secondaryColor,
        fontFamily: FONT_MONTSERRAT,
        fontWeight: FontWeight.w600,
        fontSize: responsiveApp.bodyText1
    ),
    displayMedium: TextStyle(
      color: secondaryColor,
      fontSize: responsiveApp.headline2,
      fontFamily: FONT_MONTSERRAT,
      fontWeight: FontWeight.w400,
      letterSpacing: responsiveApp.letterSpacingHeaderWidth,
    ),
    displaySmall: TextStyle(
      color: secondaryColor,
      fontSize: responsiveApp.headline5,
      fontFamily: FONT_MONTSERRAT,
      fontWeight: FontWeight.w600,
      letterSpacing: responsiveApp.letterSpacingHeaderWidth,
    ),
    labelLarge: TextStyle(
        color: secondaryColor,
        fontFamily: FONT_MONTSERRAT,
        fontWeight: FontWeight.w500,
        fontSize: responsiveApp.bodyText2
    ),
  );

  getPrimaryTextTheme() => TextTheme(
    titleLarge: TextStyle(color: primaryColor, fontFamily: FONT_MONTSERRAT, fontSize: responsiveApp.headline6),
    headlineLarge: TextStyle(
      color: primaryColor,
      fontSize: responsiveApp.headline2,
      fontFamily: FONT_MONTSERRAT,
      fontWeight: FontWeight.w600,
      letterSpacing: responsiveApp.letterSpacingHeaderWidth),
    headlineMedium: TextStyle(
        color: primaryColor,
        fontSize: responsiveApp.headline3,
        fontFamily: FONT_LIANA,
        fontWeight: FontWeight.w800,
        letterSpacing: responsiveApp.letterSpacingHeaderWidth),
    headlineSmall: TextStyle(
        color: primaryColor,
        fontSize: responsiveApp.headline5,
        fontFamily: FONT_LIANA,
        fontWeight: FontWeight.w400,
        letterSpacing: responsiveApp.letterSpacingHeaderWidth),
    displayLarge: TextStyle(
        color: primaryColor,
        fontSize: responsiveApp.headline1,
        fontFamily: FONT_LIANA,
        fontWeight: FontWeight.w700,
        wordSpacing: responsiveApp.wordSpacingHeaderWidth,
        letterSpacing: responsiveApp.letterSpacingHeaderWidth),
    displayMedium: TextStyle(
        color: primaryColor,
        fontSize: responsiveApp.headline2,
        fontFamily: FONT_MONTSERRAT,
        fontWeight: FontWeight.w400,
        letterSpacing: responsiveApp.letterSpacingHeaderWidth),
    displaySmall: TextStyle(
        color: primaryColor,
        fontFamily: FONT_LIANA,
        fontWeight: FontWeight.w700,
        fontSize: responsiveApp.headline3),
    bodyLarge: TextStyle(color: primaryColor, fontFamily: FONT_LIANA, fontSize: responsiveApp.bodyText1),
    bodyMedium: TextStyle(
        color: primaryColor, fontFamily: FONT_MONTSERRAT, fontWeight: FontWeight.w600, fontSize: responsiveApp.bodyText1),
    labelLarge: TextStyle(
        color: primaryColor, fontFamily: FONT_MONTSERRAT, fontWeight: FontWeight.w500, fontSize: responsiveApp.bodyText2),
  );
}
