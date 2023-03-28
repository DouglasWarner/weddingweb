import 'package:cloud_firestore/cloud_firestore.dart';


class Music {
  String id;
  String artist;
  String name;
  int votes;
  Timestamp date;

  Music({required this.id, required this.name, required this.artist, required this.votes, required this.date});

  Music.fromJson(String id, Map<String, Object?> json) : this(
      id: id,
      name: json['name'] as String,
      artist: json['artist'] as String,
      votes: json['votes'] as int,
      date: json['date'] as Timestamp
  );

  Map<String, Object> toJson() => {'artist': artist, 'name': name, 'votes': votes, 'date': date};
}
