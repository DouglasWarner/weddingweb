import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Util/AnimateFlipCounter.dart';
import '../Values/MyColors.dart';
import '../base/BaseState.dart';

class CircleTimer extends StatefulWidget {
  num timer;
  String text;

  CircleTimer(this.timer, this.text, {super.key});

  @override
  State<CircleTimer> createState() => _CircleTimer();
}

class _CircleTimer extends BaseState<CircleTimer> {
  @override
  Widget build(BuildContext context) {
    init(context);

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2), border: Border.all(color: primaryColor), shape: BoxShape.circle),
          constraints: BoxConstraints(minWidth: responsiveApp.setWidth(70)),
          padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
          // margin: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
          child: AnimatedFlipCounter(
            value: widget.timer,
            textStyle: Theme.of(context).primaryTextTheme.bodyText2,
          )),
      Text(
        widget.text,
        style: Theme.of(context).primaryTextTheme.bodyText2,
      )
    ]);
  }
}
