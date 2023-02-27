import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_web/Pages/GuestListPage.dart';
import 'package:my_wedding_web/Pages/InfoPage.dart';
import 'package:my_wedding_web/Pages/MusicPage.dart';
import 'package:my_wedding_web/Pages/PhotoPage.dart';
import 'package:my_wedding_web/Values/MyColors.dart';
import 'package:my_wedding_web/Values/StringApp.dart';

import '../../../Pages/HomePage.dart';
import '../../../base/BaseState.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  State<MyDrawer> createState() => _MyDrawer();
}

class _MyDrawer extends BaseState<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    init(context);

    return SizedBox(
      width: responsiveApp.drawerWidth,
      child: Drawer(
        backgroundColor: primaryColor,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: ListView(children: listDrawerMenu()
              ),
            ),
            Padding(
              padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  COPYRIGHTS,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  listDrawerMenu() {
    return <Widget>[
      DrawerHeader(
        child: Text(
          WEDDING_STRING,
          textAlign: TextAlign.center,
          style: Theme.of(context).primaryTextTheme.displaySmall!.copyWith(color: secondaryColor),
        ),
      ),
      getItem(
          onTap: () {
            Beamer.of(context).beamToNamed(HomePage.route, stacked: false);
          },
          title: HOME_STRING,
          icon: Icons.home_rounded,
          selected: HomePage.index == widget.pageIndex),
      // getItem(
      //     onTap: () {
      //       Beamer.of(context).beamToNamed(PhotoPage.route, stacked: false);
      //     },
      //     title: PHOTOS_STRING,
      //     icon: Icons.photo_library_rounded,
      //     selected: PhotoPage.index == widget.pageIndex),
      getItem(
          onTap: () {
            Beamer.of(context).beamToNamed(InfoPage.route, stacked: false);
          },
          title: INFO_STRING,
          icon: Icons.description_rounded,
          selected: InfoPage.index == widget.pageIndex),
      // getItem(
      //     onTap: () {
      //       Beamer.of(context).beamToNamed(GuestListPage.route, stacked: false);
      //     },
      //     title: GUEST_BOOK_STRING,
      //     icon: Icons.book_rounded,
      //     selected: GuestListPage.index == widget.pageIndex),
      // getItem(
      //     onTap: () {
      //       Beamer.of(context).beamToNamed(MusicPage.route, stacked: false);
      //     },
      //     title: MUSIC_STRING,
      //     icon: Icons.queue_music,
      //     selected: MusicPage.index == widget.pageIndex),
    ];
  }

  getItem({required String title, required IconData icon, onTap, selected}) {
    return ListTile(
      selected: selected,
      selectedTileColor: secondaryColor.withOpacity(0.8),
      hoverColor: secondaryColor.withOpacity(0.4),
      onTap: onTap,
      title: Text(title, style: Theme.of(context).textTheme.bodyText2?.copyWith(color: selected ? primaryColor : secondaryColor)),
      leading: Icon(
        icon,
        color: selected ? primaryColor : secondaryColor,
      ),
    );
  }
}
