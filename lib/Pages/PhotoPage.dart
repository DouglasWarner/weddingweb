import 'package:flutter/material.dart';

import '../Util/Keys.dart';
import '../Widgets/Header.dart';
import '../Widgets/mobile/MyDrawer.dart';
import '../base/BaseState.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({super.key});

  static const String route = '/fotos';
  static const int index = 1;

  @override
  State<PhotoPage> createState() => _PhotoPage();
}

class _PhotoPage extends BaseState<PhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: photoScaffoldKey,
        appBar: Header(opacity, PhotoPage.index),
        drawer: const MyDrawer(pageIndex: PhotoPage.index),
        body: const Center(
          child: Text("IN DEVELOP"),
        )
    );
  }
}
