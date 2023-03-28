import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_wedding_web/model/InfoTabContent.dart';

class InfoRef {
  static final infoRef = FirebaseFirestore.instance.collection('wedding-info-list').withConverter<InfoTabContent>(
    fromFirestore: (snapshots, _) => InfoTabContent.fromJson(snapshots.data()!),
    toFirestore: (value, options) => value.toJson(),
  );

  static List<InfoTabContent> listInfoContent = [];

  static write() async {
    var list = await infoRef.get();
    
    list.docs.forEach((element) { 
      var newData = element.data() as InfoTabContent;
      if (newData.title.contains("Deseada")) {
        newData.sortType = 1;
      } else {
        newData.sortType = 0;
      }
      infoRef.doc(element.id).set(newData);
    });
        
    // infoContent.forEach((element) {
    //   infoRef.doc().set(element);
    // });
  }

  static Future<void> read() async {
    var listInfo = await infoRef.get();

    listInfoContent = listInfo.docs.map((e) => e.data()).toList();
  }
}
