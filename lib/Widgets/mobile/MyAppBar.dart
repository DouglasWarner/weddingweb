import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_web/Values/FontsApp.dart';
import 'package:my_wedding_web/Values/MyColors.dart';
import 'package:my_wedding_web/base/BaseStateless.dart';

import '../../../Util/Keys.dart';
import '../../../Values/StringApp.dart';
import '../../../base/BaseState.dart';

class MyAppBar extends BaseStateless implements PreferredSizeWidget {
  MyAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);

  @override
  Widget build(BuildContext context) {
    init(context);

    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        color: secondaryColor,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        iconSize: responsiveApp.setHeight(40),
        onPressed: () {
          if (Scaffold.of(context).isDrawerOpen) {
            Scaffold.of(context).closeDrawer();
          }
          Scaffold.of(context).openDrawer();
        },
      ),
      centerTitle: true,
      title: Padding(
        padding: responsiveApp.edgeInsetsApp.mediumTopEdgeInsets,
        child: Text(
          WEDDING_STRING,
          textAlign: TextAlign.center,
          style: Theme
              .of(context)
              .primaryTextTheme
              .displaySmall!
              .copyWith(color: secondaryColor),
        ),
      ),
    );
  }
}