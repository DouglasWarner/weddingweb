import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import '../base/BaseState.dart';

class MyGoogleMap extends StatefulWidget {
  String location;

  MyGoogleMap(this.location, {super.key});

  @override
  State<MyGoogleMap> createState() => _MyGoogleMap();
}

class _MyGoogleMap extends BaseState<MyGoogleMap> {
  bool showMaps = true;

  @override
  Widget build(BuildContext context) {
    init(context);

    return Padding(padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets, child:
      showMaps ?
          Container(
            height: 500,
            width: responsiveApp.setWidth(700),
            padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: getMap(widget.location)
          )
      : CircularProgressIndicator(),
    );
  }

  Widget getMap(String location) {
    String htmlId = "$location.hashCode";

    IFrameElement frame = IFrameElement();
    // frame.height = "400";
    // frame.width = "600";
    frame.src = location;
    frame.style.border = "none";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        htmlId,
        (int viewId) => frame
    );

    return HtmlElementView(
        key: UniqueKey(),
        viewType: htmlId
    );
  }

}