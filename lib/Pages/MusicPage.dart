import 'package:flutter/material.dart';
import 'package:my_wedding_web/Util/Keys.dart';
import 'package:my_wedding_web/Widgets/Header.dart';

import '../Widgets/mobile/MyDrawer.dart';
import '../base/BaseState.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  static const String route = '/music';
  static const int index = 4;

  @override
  State<MusicPage> createState() => _MusicPage();
}

class _MusicPage extends BaseState<MusicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: musicScaffoldKey,
        appBar: Header(opacity, MusicPage.index),
        drawer: const MyDrawer(pageIndex: MusicPage.index),
        body: const Center(
          child: Text("IN DEVELOPMENT"),
        ));
  }
}
