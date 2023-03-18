import 'package:flutter/material.dart';
import 'package:my_wedding_web/Widgets/header/Header.dart';
import 'package:my_wedding_web/Widgets/button/TabButton.dart';

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
  int tabIndex = 0;
  List<InfoTabContent> content = infoContent.where((element) {
    return element.type.index == 0;
  }).toList();

  onTap(int index) {
    setState(() {
      tabIndex = index;

      content = infoContent.where((element) {
        return element.type.index == tabIndex;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);

    return Scaffold(
        key: infoScaffoldKey,
        appBar: Header(opacity, InfoPage.index),
        drawer: const MyDrawer(pageIndex: InfoPage.index),
        backgroundColor: Colors.white,
        body: ListView(
            scrollDirection: Axis.vertical,
            primary: true,
            padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
            children: List.generate(content.length + 1, (index) {
              return (index == 0) ?
                  GridView.builder(
                    itemCount: InfoType.values.length,
                    padding: responsiveApp.edgeInsetsApp.verticalSmallEdgeInsets,
                    primary: true,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: responsiveApp.setWidth(400),
                        mainAxisExtent: responsiveApp.setHeight(50),
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0), itemBuilder: (context, index) {
                      return TabButton(index, InfoType.values[index].getString(), tabIndex, (value) => onTap(value));
                    },
                  )
                : InfoContent(content: content[index-1]);
              },
            )
        )
    );
  }
}
