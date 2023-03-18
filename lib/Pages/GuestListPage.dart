import 'package:flutter/material.dart';

import '../Util/Keys.dart';
import '../Widgets/header/Header.dart';
import '../Widgets/mobile/MyDrawer.dart';
import '../base/BaseState.dart';

class GuestListPage extends StatefulWidget {
  const GuestListPage({super.key});

  static const String route = '/guest';
  static const int index = 3;

  @override
  State<GuestListPage> createState() => _GuestListPage();
}

class _GuestListPage extends BaseState<GuestListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: guestListScaffoldKey,
        appBar: Header(opacity, GuestListPage.index),
        drawer: const MyDrawer(pageIndex: GuestListPage.index),
        body: const Center(
          child: Text("IN DEVELOP"),
        ));
  }
}
