import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_web/Pages/GuestListPage.dart';
import 'package:my_wedding_web/Pages/InfoPage.dart';
import 'package:my_wedding_web/Pages/MusicPage.dart';
import 'package:my_wedding_web/Pages/PhotoPage.dart';
import 'package:my_wedding_web/Util/InfoRef.dart';
import 'package:my_wedding_web/base/BaseState.dart';

import 'Pages/HomePage.dart';
import 'Util/Keys.dart';
import 'Values/FontsApp.dart';
import 'Values/MyColors.dart';
import 'firebase_options.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  InfoRef.read();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends BaseState<MyApp> {
  final routerDelegate = BeamerDelegate(
      setBrowserTabTitle: false,
      initialPath: HomePage.route,
      locationBuilder: RoutesLocationBuilder(routes: {
        HomePage.route: (context, state, data) => const HomePage(),
        PhotoPage.route: (context, state, data) => const PhotoPage(),
        InfoPage.route: (context, state, data) => const InfoPage(),
        GuestListPage.route: (context, state, data) => const GuestListPage(),
        MusicPage.route: (context, state, data) => const MusicPage()
      }));

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => BeamerProvider(
        key: beamerStateKey,
        routerDelegate: routerDelegate,
        child: MaterialApp.router(
            title: "C & D Wedding",
            debugShowCheckedModeBanner: false,
            routeInformationParser: BeamerParser(),
            routerDelegate: routerDelegate,
            builder: (context, child) {
              init(context);
              return Theme(
                data: ThemeData(
                    useMaterial3: true,
                    primaryColor: primaryColor,
                    iconTheme: const IconThemeData(color: Colors.white),
                    cardColor: Colors.white,
                    scaffoldBackgroundColor: primaryColor,
                    primaryTextTheme: getPrimaryTextTheme(),
                    textTheme: getTextTheme(),
                    indicatorColor: Colors.white,
                    unselectedWidgetColor: Colors.blueGrey[300],
                    appBarTheme: AppBarTheme(color: primaryColor, elevation: 2, centerTitle: true, surfaceTintColor: primaryColor),
                    tabBarTheme: TabBarTheme(
                        labelColor: secondaryColor,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                        unselectedLabelColor: Colors.white,
                        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold)),
                    fontFamily: FONT_MONTSERRAT),
                child: child ??
                    const Center(
                      child: Text("Not Found"),
                    ),
              );
            }),
      );
}
