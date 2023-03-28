import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_web/Util/Keys.dart';
import 'package:my_wedding_web/Util/MusicRef.dart';
import 'package:my_wedding_web/Values/MyColors.dart';
import 'package:my_wedding_web/Widgets/common/CustomTextField.dart';
import 'package:my_wedding_web/Widgets/header/Header.dart';
import 'package:my_wedding_web/model/Music.dart';
import 'package:uuid/uuid.dart';

import '../Widgets/mobile/MyDrawer.dart';
import '../base/BaseState.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  static const String route = '/music';
  static const int index = 4;

  @override
  State<MusicPage> createState() => _MusicPage();
}

class _MusicPage extends BaseState<MusicPage> /*with AutomaticKeepAliveClientMixin */ {
  var artistName = "";
  var artistTextController = TextEditingController();
  var musicName = "";
  var musicTextController = TextEditingController();

  List<Music> listMusic = [];//MusicRef.listMusic;
  var loading = true;

  onSaveMusic(Music music) {
    setState(() {
      artistName = "";
      artistTextController.clear();
      musicName = "";
      musicTextController.clear();

      MusicRef.writeMusicDataToFirebase(music).then((value){
        setState(() {

        listMusic = value;
        });
      });
    });
  }

  onMusicVoted(Music music) {
    setState(() {
      MusicRef.updateVoteToFirebase(music).then((value){
        setState(() {
        listMusic = value;

        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    MusicRef.readMusicListFromFirebase().then((value) {
      setState(() {
        listMusic = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    init(context);

    return Scaffold(
        key: musicScaffoldKey,
        appBar: Header(opacity, MusicPage.index),
        drawer: const MyDrawer(pageIndex: MusicPage.index),
        backgroundColor: Colors.white,
        body: ListView(
            children: headerMusic() +
                (MusicRef.loading
                    ? [Center(child: CircularProgressIndicator())]
                    : List.generate(listMusic.length, (index) {
                        Music music = listMusic[index];
                        return Container(
                          margin: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
                          padding: responsiveApp.edgeInsetsApp.allMediumEdgeInsets,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child:
                                      Padding(padding: responsiveApp.edgeInsetsApp.horizontalMediumEdgeInsets, child: Text(music.artist, style: TextStyle(color: Colors.white)))),
                              Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: responsiveApp.edgeInsetsApp.horizontalMediumEdgeInsets,
                                    child: Text(music.name, style: TextStyle(color: Colors.white)),
                                  )),
                              Expanded(
                                flex: 0,
                                child: Padding(
                                  padding: responsiveApp.edgeInsetsApp.horizontalMediumEdgeInsets,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("${music.votes} votos", style: TextStyle(color: Colors.white)),
                                      IconButton(
                                        onPressed: () {
                                          onMusicVoted(music);
                                        },
                                        icon: Icon(Icons.add_circle_outlined),
                                        iconSize: 30,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }))));
  }

  List<Widget> headerMusic() => [
        SizedBox(
          height: responsiveApp.setHeight(30),
        ),
        Center(
          child: Text("Hagamos juntos la playlist perfecta!!!"),
        ),
        SizedBox(
          height: responsiveApp.setHeight(30),
        ),
        Padding(
          padding: responsiveApp.edgeInsetsApp.horizontalLargeEdgeInsets,
          child: Center(
            child: Text(
                "Queremos que nuestra boda sea la mejor fiesta posible para todos. Por eso os invitamos a que propongáis canciones que os gustaría escuchar y al mismo tiempo votéis las canciones ya propuestas."),
          ),
        ),
        SizedBox(
          height: responsiveApp.setHeight(40),
        ),
        Padding(
          padding: responsiveApp.edgeInsetsApp.horizontalLargeEdgeInsets,
          child: CustomTextField((value) {
            artistName = value;
          }, artistTextController, label: "ARTISTA", hint: "Badbunny, Wade, Karol G, Oliver Heldens, etc...", minLines: 1, maxLines: null, expands: true, optional: false),
        ),
        SizedBox(
          height: responsiveApp.setHeight(20),
        ),
        Padding(
          padding: responsiveApp.edgeInsetsApp.horizontalLargeEdgeInsets,
          child: CustomTextField((value) {
            musicName = value;
          }, musicTextController, label: "CANCIÓN", hint: "La difícil, Pan Jabi, Tusa, Groove, etc...", minLines: 1, maxLines: null, expands: true, optional: false),
        ),
        SizedBox(
          height: responsiveApp.setHeight(20),
        ),
        Center(
          child: MaterialButton(
            color: secondaryColor,
            elevation: 5,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            height: responsiveApp.setHeight(40),
            minWidth: responsiveApp.setWidth(150),
            // style: ButtonStyle(
            //   backgroundColor: MaterialStatePropertyAll(secondaryColor),
            //   foregroundColor: MaterialStatePropertyAll(primaryColor),
            //   padding: MaterialStatePropertyAll(responsiveApp.edgeInsetsApp.allLargeEdgeInsets)
            // ),
            onPressed: () {
              var music = Music(id: Uuid().v1(), name: musicName, artist: artistName, votes: 1, date: Timestamp.now());
              if (musicName.isNotEmpty && artistName.isNotEmpty) {
                onSaveMusic(music);
              }
            },
            child: Text("Añadir canción"),
          ),
        ),
        SizedBox(
          height: responsiveApp.setHeight(40),
        ),
        Padding(
          padding: responsiveApp.edgeInsetsApp.horizontalLargeEdgeInsets,
          child: Text("Esta la lista de canciones hasta el momento:"),
        ),
        SizedBox(
          height: responsiveApp.setHeight(20),
        ),
      ];
}
