import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_web/Pages/HomePage.dart';
import 'package:my_wedding_web/Pages/InfoPage.dart';
import 'package:my_wedding_web/Pages/PhotoPage.dart';
import 'package:my_wedding_web/Widgets/HeaderButton.dart';
import 'package:my_wedding_web/base/BaseState.dart';

import '../Util/SizingInfo.dart';
import '../Values/MyColors.dart';
import '../Values/StringApp.dart';
import 'mobile/MyAppBar.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  final double opacity;
  final int pageIndex;

  const Header(this.opacity, this.pageIndex, {super.key});

  @override
  State<Header> createState() => _HeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 15);
}

class _HeaderState extends BaseState<Header> {
  Color hoverColor = Colors.amber;
  Color background = Colors.transparent;
  Color borderColor = secondaryColor;

  onHover(bool value) {
    setState(() {
      value ? hoverColor = Colors.black : hoverColor = Colors.amber;
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);

    switch (widget.pageIndex) {
      case HomePage.index:
        background = Colors.transparent;
        break;
      default:
        background = primaryColor;
        break;
    }
    return isMobileAndTablet(context)
        ? MyAppBar()
        : Container(
            decoration: BoxDecoration(
                color: background, //primaryColor.withOpacity(widget.opacity),
                border: Border(
                    bottom: BorderSide(
                      color: borderColor,
                    )
                )
            ),
            child: Row(
              children: [
                Padding(
                  padding: responsiveApp.edgeInsetsApp.horizontalLargeEdgeInsets,
                  child: Text(
                    WEDDING_STRING,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(color: secondaryColor),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: listMenuHeader()
                  ),
                )
              ],
            ),
          );
  }

  listMenuHeader() => <Widget>[
    HeaderButton(HomePage.index, HOME_STRING, widget.pageIndex, () {
      Beamer.of(context).beamToNamed(HomePage.route, stacked: false);
    }),
    // HeaderButton(PhotoPage.index, PHOTOS_STRING, widget.pageIndex, () {
    //   Beamer.of(context).beamToNamed(PhotoPage.route, stacked: false);
    // }),
    HeaderButton(InfoPage.index, INFO_STRING, widget.pageIndex, () {
      Beamer.of(context).beamToNamed(InfoPage.route, stacked: false);
    }),
    // HeaderButton(GuestListPage.index, GUEST_BOOK_STRING, widget.pageIndex, () {
    //   Beamer.of(context).beamToNamed(GuestListPage.route, stacked: false);
    // }),
    // HeaderButton(MusicPage.index, MUSIC_STRING, widget.pageIndex, () {
    //   Beamer.of(context).beamToNamed(MusicPage.route, stacked: false);
    // }),
  ];
}
