import 'package:flutter/cupertino.dart';

import '../Util/SizingInfo.dart';
import 'EdgeInsetsApp.dart';

class ResponsiveApp {
  final BuildContext _context;
  double get _scaleFactor => isFold(_context) ? 0.75
      : isMobile(_context) ? 1
      : isTablet(_context) ? 1.3
      : 1.4;

  EdgeInsetsApp get edgeInsetsApp => EdgeInsetsApp(this);

  ResponsiveApp(this._context);

  //Container
  get menuContainerHeight => setHeight(100);

  get menuContainerWidth => setWidth(110);

  get productContainerWidth => setWidth(60);

  get carouselContainerWidth => setWidth(300);

  get carouselContainerHeight => setHeight(60);

  get carouselCircleContainerWidth => setWidth(10);

  get carouselCircleContainerHeight => setHeight(10);

  get menuTabContainerHeight => setHeight(400);

  get sectionHeight => setHeight(50);

  get sectionWidth => setWidth(8);

  get dialogWidth => setWidth(400);
  get dialogHeight => setHeight(400);

  //Radius
  get menuRadiusWidth => setWidth(30);

  get carouselRadiusWidth => setWidth(10);

  //Images
  get menuImageHeight => setHeight(60);

  get menuImageWidth => setWidth(50);

  get tabImageHeight => setHeight(30);

  get menuHeight => setHeight(850);

  get opacityHeight => setHeight(252);

  get drawerWidth => setWidth(252);

  //Divider and Line
  get dividerVtlHeight => setHeight(100);

  get dividerVtlWidth => setWidth(2);

  get dividerHznHeight => setHeight(1);

  get lineHznButtonHeight => setHeight(2);

  get lineHznButtonWidth => setWidth(20);

  //Spaces
  get barSpace1Width => setWidth(5);

  get barSpace2Width => setWidth(45);

  get barSpace3Width => setWidth(80);

  //Text Size
  get headline1 => setSp(60);

  get headline2 => setSp(50);

  get headline3 => setSp(30);

  get headline4 => setSp(20);

  get headline5 => setSp(18);

  get headline6 => setSp(15);

  get bodyText1 => setSp(14);

  get bodyText2 => setSp(12);

  //Spacing
  get letterSpacingCarouselWidth => setWidth(10);

  get letterSpacingHeaderWidth => setWidth(3);

  get wordSpacingHeaderWidth => setWidth(3);

  setWidth(int width) => width * scaleWidth;

  setHeight(int height) => height * scaleHeight;

  setSp(int fontSize) => setWidth(fontSize) * MediaQuery.of(_context).textScaleFactor;

  get scaleWidth => (windowWidth * _scaleFactor) / windowWidth;

  get scaleHeight => (windowHeight * _scaleFactor) / windowHeight;

  get windowWidth => MediaQuery.of(_context).size.width;

  get windowHeight => MediaQuery.of(_context).size.height;

  get scaleFactor => _scaleFactor;
}
