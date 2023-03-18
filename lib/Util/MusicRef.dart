import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/Music.dart';

class MusicRef {
  static final musicRef = FirebaseFirestore.instance.collection('wedding-music-list').withConverter<Music>(
        fromFirestore: (snapshots, _) => Music.fromJson(snapshots.id, snapshots.data()!),
        toFirestore: (value, _) => value.toJson(),
      );

  static Future<List<Music>?> readMusicListFromFirebase() async {
    /// A reference to the list of movies.
    /// We are using `withConverter` to ensure that interactions with the collection
    /// are type-safe.
    var musicList = await musicRef.get();

    return musicList.docs.map((e) => e.data()).toList();
  }

  static Future<void> writeMusicDataToFirebase(Music music) async {
    var musicList = await musicRef.get();

    var exists = musicList.docs.where((element) => element.data().name.trim().toLowerCase() == music.name.trim().toLowerCase());
    if (exists.isNotEmpty) {
      await updateVoteToFirebase(exists.first.data());
    } else {
      await musicRef.doc(music.id).set(music);
    }
  }

  static Future<void> updateVoteToFirebase(Music music) async {
    await musicRef.doc(music.id).update({'votes': music.votes + 1});
  }
}
