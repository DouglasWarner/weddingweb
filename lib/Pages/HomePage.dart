import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:my_wedding_web/Values/MyColors.dart';
import 'package:my_wedding_web/base/BaseState.dart';

import '../Util/Keys.dart';
import '../Values/MyImages.dart';
import '../Widgets/CircleTimer.dart';
import '../Widgets/Header.dart';
import '../Widgets/dialogs/FormDialog.dart';
import '../Widgets/mobile/MyDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/';
  static const int index = 0;

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends BaseState<HomePage> {
  DateTime weddingDateTime = DateTime(2023, 7, 8, 19, 30);
  int days = 1;
  int hours = 0;
  int minutes = 0;
  int seconds = 0;
  Timer? timerSecond;
  Timer? timerMinute;
  Timer? timerHour;
  Timer? timerDays;

  bool finishCounter = false;

  initCounterValues() {
    days = weddingDateTime.difference(DateTime.now()).inDays;
    hours = (weddingDateTime.hour - DateTime.now().hour) % 24;
    minutes = (weddingDateTime.minute - DateTime.now().minute) % 60;
    seconds = 60 - DateTime.now().second;

    if (days <= 0) {
      finishCounter = true;
      return;
    }

    timerDays ??= Timer.periodic(const Duration(days: 1), (timer) {
      setState(() {
        days = weddingDateTime.difference(DateTime.now()).inDays;
      });
    });
    timerHour ??= Timer.periodic(const Duration(hours: 1), (timer) {
      setState(() {
        hours = (weddingDateTime.hour - DateTime.now().hour) % 24;
      });
    });
    timerMinute ??= Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        minutes = (weddingDateTime.minute - DateTime.now().minute) % 60;
      });
    });
    timerSecond ??= Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        seconds = 60 - DateTime.now().second;
      });
    });
  }

  @override
  void dispose() {
    timerDays?.cancel();
    timerHour?.cancel();
    timerMinute?.cancel();
    timerSecond?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    init(context);
    initCounterValues();

    return Scaffold(
      key: homeScaffoldKey,
      appBar: Header(opacity, HomePage.index),
      // extendBody: true,
      drawer: const MyDrawer(pageIndex: HomePage.index),
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(BACKGROUND_IMAGE),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.center,
          child: ListView(
              scrollDirection: Axis.vertical,
              primary: true,
              itemExtent: responsiveApp.windowHeight-150,//responsiveApp.setHeight(550),
              padding: responsiveApp.edgeInsetsApp.allLargeEdgeInsets,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.2), borderRadius: const BorderRadius.all(Radius.circular(10))),
                    padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
                    child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Padding(
                        padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
                        child:
                            Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                          Padding(
                            padding: responsiveApp.edgeInsetsApp.verticalMediumEdgeInsets,
                            child: Text("Coral & Douglas",
                                style: Theme.of(context).primaryTextTheme.displayLarge, textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: responsiveApp.edgeInsetsApp.verticalMediumEdgeInsets,
                            child: Column(
                              children: [
                                Text("08",
                                    style: Theme.of(context).primaryTextTheme.headlineMedium, textAlign: TextAlign.center),
                                Text("Julio",
                                    style: Theme.of(context).primaryTextTheme.headlineMedium, textAlign: TextAlign.center),
                                Text("2023",
                                    style: Theme.of(context).primaryTextTheme.headlineMedium, textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: responsiveApp.edgeInsetsApp.verticalMediumEdgeInsets,
                          //   child: Text("19:30",
                          //       style: Theme.of(context).primaryTextTheme.headlineMedium, textAlign: TextAlign.center),
                          // ),
                          // Padding(
                          //   padding: responsiveApp.edgeInsetsApp.verticalMediumEdgeInsets,
                          //   child: Text("Valtari Eventos",
                          //       style: Theme.of(context).primaryTextTheme.headlineMedium, textAlign: TextAlign.center),
                          // ),
                        ]),
                      ),
                      Padding(
                        padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            side: MaterialStatePropertyAll(BorderSide(color: secondaryColor, width: 2)),
                              minimumSize:
                                  MaterialStatePropertyAll(Size(responsiveApp.setWidth(100), responsiveApp.setHeight(50))),
                              backgroundColor: MaterialStatePropertyAll(secondaryColor.withOpacity(0.7))),
                          onPressed: () async {
                            await showDialog(context: context, builder: (context) => FormDialog());
                          },
                          child: Text("Haz click aqui para confirmar", style: Theme.of(context).primaryTextTheme.labelLarge),
                        ),
                      ),
                      finishCounter ? contentFinishTimer() : contentTimer()
                    ]))
              ])),
    );
  }

  contentFinishTimer() => Padding(
    padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
    child: Container(
      decoration: BoxDecoration(
        color: primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryColor)
      ),
      padding: responsiveApp.edgeInsetsApp.allSmallEdgeInsets,
      child: Text(
        "YA LLEGÓ EL DÍA, PREPARAOS QUE HOY SE VIENEN CURVAS.",
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
    ),
  );

  contentTimer() => Padding(
    padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        CircleTimer(days, "Días"),
        CircleTimer(hours, "Horas"),
        CircleTimer(minutes, "Minutos"),
        CircleTimer(seconds, "Segundos"),
      ],
    ),
  );

}
