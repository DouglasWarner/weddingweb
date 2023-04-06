import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_wedding_web/base/BaseStateless.dart';

class MyImageWidget extends BaseStateless {
  final String imageUrl;

  MyImageWidget({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    init(context);
    return FutureBuilder(
      future: getImageUrl(imageUrl),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return Text('Error loading image: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return CachedNetworkImage(
            imageUrl: snapshot.requireData,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Future<String> getImageUrl(String imagePath) async {
    String downloadURL = await FirebaseStorage.instance.ref().child("images").child(imagePath).getDownloadURL();

    return downloadURL;
  }

  Future<Uint8List?> getImage(String imagePath) async {
    Uint8List? downloadURL = await FirebaseStorage.instance.ref().child("images").child(imagePath).getData();

    return downloadURL;
  }
}
