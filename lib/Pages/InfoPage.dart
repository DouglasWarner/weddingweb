import 'package:flutter/material.dart';
import 'package:my_wedding_web/Widgets/button/TabButton.dart';
import 'package:my_wedding_web/Widgets/header/Header.dart';

import '../Util/InfoRef.dart';
import '../Util/Keys.dart';
import '../Widgets/content/InfoContent.dart';
import '../Widgets/mobile/MyDrawer.dart';
import '../base/BaseState.dart';
import '../model/InfoTabContent.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  static const String route = '/info';
  static const int index = 2;

  @override
  State<InfoPage> createState() => _InfoPage();
}

class _InfoPage extends BaseState<InfoPage> {
  List<InfoTabContent> content = []; //InfoRef.listInfoContent.where((element) => element.type.index == 0).toList();
  int tabIndex = 0;

  onTap(int index) {
    setState(() {
      tabIndex = index;

      content = InfoRef.listInfoContent.where((element) => element.type.index == tabIndex).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    if (InfoRef.listInfoContent.isEmpty) {
      InfoRef.read().then((value) {
        setState(() {
          content = value.where((element) => element.type.index == 0).toList();
        });
      });
    } else {
      setState(() {
        content = InfoRef.listInfoContent.where((element) => element.type.index == 0).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    init(context);

    return Scaffold(
        key: infoScaffoldKey, appBar: Header(opacity, InfoPage.index), drawer: const MyDrawer(pageIndex: InfoPage.index), backgroundColor: Colors.white, body: infoPageContent());
  }

  Widget headerInfo() => GridView.builder(
        itemCount: InfoType.values.length,
        padding: responsiveApp.edgeInsetsApp.verticalSmallEdgeInsets,
        primary: true,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: responsiveApp.setWidth(400), mainAxisExtent: responsiveApp.setHeight(50), crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        itemBuilder: (context, index) {
          return TabButton(index, InfoType.values[index].getString(), tabIndex, (value) => onTap(value));
        },
      );

  ListView infoPageContent() => ListView.builder(
        scrollDirection: Axis.vertical,
        primary: true,
        padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
        itemCount: content.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return headerInfo();
          } else {
            return InfoContent(content: content[index - 1]);
          }
        },
      );
}
