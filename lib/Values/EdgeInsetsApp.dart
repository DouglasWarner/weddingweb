import 'package:flutter/material.dart';

import 'ResponsiveApp.dart';

class EdgeInsetsApp {
  // ALL
  late EdgeInsets allSmallEdgeInsets;
  late EdgeInsets allMediumEdgeInsets;
  late EdgeInsets allLargeEdgeInsets;
  late EdgeInsets allExtraLargeEdgeInsets;

  // Vertical
  late EdgeInsets verticalSmallEdgeInsets;
  late EdgeInsets verticalMediumEdgeInsets;
  late EdgeInsets verticalLargeEdgeInsets;
  late EdgeInsets verticalExtraLargeEdgeInsets;

  // Horizontal
  late EdgeInsets horizontalMediumEdgeInsets;
  late EdgeInsets horizontalSmallEdgeInsets;
  late EdgeInsets horizontalLargeEdgeInsets;
  late EdgeInsets horizontalExtraLargeEdgeInsets;

  // Solo derecha, izquierda, arriba y abajo SMALL
  late EdgeInsets smallTopEdgeInsets;
  late EdgeInsets smallBottomEdgeInsets;
  late EdgeInsets smallRightEdgeInsets;
  late EdgeInsets smallLeftEdgeInsets;

  // Solo derecha, izquierda, arriba y abajo MEDIUM
  late EdgeInsets mediumTopEdgeInsets;
  late EdgeInsets mediumBottomEdgeInsets;
  late EdgeInsets mediumRightEdgeInsets;
  late EdgeInsets mediumLeftEdgeInsets;

  // Solo derecha, izquierda, arriba y abajo LARGE
  late EdgeInsets largeTopEdgeInsets;
  late EdgeInsets largeBottomEdgeInsets;
  late EdgeInsets largeRightEdgeInsets;
  late EdgeInsets largeLeftEdgeInsets;

  // Solo derecha, izquierda, arriba y abajo EXTRA LARGE
  late EdgeInsets extraLargeTopEdgeInsets;

  late final ResponsiveApp _responsiveApp;

  EdgeInsetsApp(this._responsiveApp) {
    // Padding
    double smallHeightEdgeInsets = _responsiveApp.setHeight(5);
    double smallWidthEdgeInsets = _responsiveApp.setWidth(5);

    double mediumHeightEdgeInsets = _responsiveApp.setHeight(10);
    double mediumWidthEdgeInsets = _responsiveApp.setWidth(10);

    double largeHeightEdgeInsets = _responsiveApp.setHeight(20);
    double largeWidthEdgeInsets = _responsiveApp.setWidth(20);

    double extraLargeHeightEdgeInsets = _responsiveApp.setHeight(100);
    double extraLargeWidthEdgeInsets = _responsiveApp.setWidth(100);

    // ALL
    allSmallEdgeInsets = EdgeInsets.symmetric(vertical: smallHeightEdgeInsets, horizontal: smallWidthEdgeInsets);
    allMediumEdgeInsets = EdgeInsets.symmetric(vertical: mediumHeightEdgeInsets, horizontal: mediumWidthEdgeInsets);
    allLargeEdgeInsets = EdgeInsets.symmetric(vertical: largeHeightEdgeInsets, horizontal: largeWidthEdgeInsets);
    allExtraLargeEdgeInsets = EdgeInsets.symmetric(vertical: extraLargeHeightEdgeInsets, horizontal: extraLargeWidthEdgeInsets);

    // Vertical
    verticalSmallEdgeInsets = EdgeInsets.symmetric(vertical: smallHeightEdgeInsets);
    verticalMediumEdgeInsets = EdgeInsets.symmetric(vertical: mediumHeightEdgeInsets);
    verticalLargeEdgeInsets = EdgeInsets.symmetric(vertical: largeHeightEdgeInsets);
    verticalExtraLargeEdgeInsets = EdgeInsets.symmetric(vertical: extraLargeHeightEdgeInsets);

    // Horizontal
    horizontalMediumEdgeInsets = EdgeInsets.symmetric(horizontal: mediumWidthEdgeInsets);
    horizontalSmallEdgeInsets = EdgeInsets.symmetric(horizontal: smallWidthEdgeInsets);
    horizontalLargeEdgeInsets = EdgeInsets.symmetric(horizontal: largeWidthEdgeInsets);
    horizontalExtraLargeEdgeInsets = EdgeInsets.symmetric(horizontal: extraLargeWidthEdgeInsets);

    // Solo derecha, izquierda, arriba y abajo SMALL
    smallTopEdgeInsets = EdgeInsets.only(top: smallHeightEdgeInsets);
    smallBottomEdgeInsets = EdgeInsets.only(bottom: smallHeightEdgeInsets);
    smallRightEdgeInsets = EdgeInsets.only(right: smallWidthEdgeInsets);
    smallLeftEdgeInsets = EdgeInsets.only(left: smallWidthEdgeInsets);

    // Solo derecha, izquierda, arriba y abajo MEDIUM
    mediumTopEdgeInsets = EdgeInsets.only(top: mediumHeightEdgeInsets);
    mediumBottomEdgeInsets = EdgeInsets.only(bottom: mediumHeightEdgeInsets);
    mediumRightEdgeInsets = EdgeInsets.only(right: mediumWidthEdgeInsets);
    mediumLeftEdgeInsets = EdgeInsets.only(left: mediumWidthEdgeInsets);

    // Solo derecha, izquierda, arriba y abajo LARGE
    largeTopEdgeInsets = EdgeInsets.only(top: largeHeightEdgeInsets);
    largeBottomEdgeInsets = EdgeInsets.only(bottom: largeHeightEdgeInsets);
    largeRightEdgeInsets = EdgeInsets.only(right: largeWidthEdgeInsets);
    largeLeftEdgeInsets = EdgeInsets.only(left: largeWidthEdgeInsets);

    // Solo derecha, izquierda, arriba y abajo EXTRA LARGE
    extraLargeTopEdgeInsets = EdgeInsets.only(top: extraLargeHeightEdgeInsets);
  }
}
