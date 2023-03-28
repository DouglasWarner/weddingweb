import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/Music.dart';

class MusicRef {
  static final musicRef = FirebaseFirestore.instance.collection('wedding-music-list').withConverter<Music>(
        fromFirestore: (snapshots, _) => Music.fromJson(snapshots.id, snapshots.data()!),
        toFirestore: (value, _) => value.toJson(),
      );

  static List<Music> listMusic = [];
  static var loading = true;

  static Future<List<Music>> readMusicListFromFirebase() async {
    loading = true;

    var result = await MusicRef.musicRef.orderBy('date', descending: true).get();
    result.docs.map((e) => e.data()).toList().forEach((element) {
      print(element.name);
    });
    listMusic = result.docs.map((e) => e.data()).toList();
    loading = false;

    return listMusic;
  }

  static Future<List<Music>> writeMusicDataToFirebase(Music music) async {
    var musicList = await musicRef.get();

    var exists = musicList.docs.where((element) => element.data().name.trim().toLowerCase() == music.name.trim().toLowerCase());
    if (exists.isNotEmpty) {
      await updateVoteToFirebase(exists.first.data());
    } else {
      await musicRef.doc(music.id).set(music);
    }

    var result = await readMusicListFromFirebase();

    return result;
  }

  static Future<List<Music>> updateVoteToFirebase(Music music) async {
    await musicRef.doc(music.id).update({'votes': music.votes + 1});

    var result = await readMusicListFromFirebase();

    return result;
  }
}
