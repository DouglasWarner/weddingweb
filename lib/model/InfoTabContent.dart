import 'MyLocation.dart';

class InfoTabContent {
  String title;
  InfoType type;
  String? url;
  String? phone;
  String? hora;
  String? descripcion;
  String? redSocial;
  String? direccion;
  MyLocation? latlng;

  InfoTabContent(
  {required this.title,
    required this.type,
    required this.url,
    required this.phone,
    required this.hora,
    required this.descripcion,
    required this.redSocial,
    required this.direccion,
    required this.latlng,}
  );
}

enum InfoType {
  Banquete,
  Hotel,
  Transporte,
  Proveedores;

  String getString() {
    if (index == 0) {
      return "Banquete y ceremonia";
    } else {
      return name;
    }
  }
}

List<InfoTabContent> infoContent = [
  InfoTabContent(
    title: "Valtari Eventos",
    type: InfoType.Banquete,
    url: "https://valtari.es/",
    phone: "952 411 543",
    hora: null,
    descripcion: null,
    redSocial: "https://www.instagram.com/valtari_eventos/",
    direccion: "Carretera Churriana-Cártama, Km. 6 Bajo, 29130, Alhaurín de la Torre (Málaga)",
    latlng: MyLocation(lat: 36.694717522097065, lng: -4.562684159841111)
  ),

  InfoTabContent(
    title: "Hotel Torremolinos Centro",
    type: InfoType.Hotel,
    url: "http://www.hoteltorremolinoscentro.es/",
    phone: "951 909 636 / 951 537 106",
    hora: null,
    descripcion: null,
    redSocial: null,
    direccion: "Plaza de la Independencia, 12, 29620, Torremolinos (Málaga)",
    latlng: MyLocation(lat: 36.624664496307275, lng: -4.50112462915508)
  ),

  InfoTabContent(
    title: "Autobus",
    type: InfoType.Transporte,
    url: null,
    phone: null,
    hora: null,
    descripcion: null,
    redSocial: null,
    direccion: null,
    latlng: null
  ),

  InfoTabContent(
      title: "Taxi Torremolinos",
      type: InfoType.Transporte,
      url: null,
      phone: "952 38 06 00 - 952 38 00 00 - 618 98 82 62",
      hora: null,
      descripcion: "Disponible con sillas para bebes",
      redSocial: null,
      direccion: null,
      latlng: null
  ),

  InfoTabContent(
      title: "Taxi Alhaurín de la Torre",
      type: InfoType.Transporte,
      url: null,
      phone: "646 71 11 43",
      hora: null,
      descripcion: "Disponible con sillas para bebes",
      redSocial: null,
      direccion: null,
      latlng: null
  ),

  InfoTabContent(
    title: "Miragal Fotografias",
    type: InfoType.Proveedores,
    url: "https://www.bodas.net/fotografos/miragal-fotografia--e85085",
    phone: null,
    hora: null,
    descripcion: null,
    redSocial: "https://www.instagram.com/miragal_fotografia/",
    direccion: null,
    latlng: null
  ),

  InfoTabContent(
      title: "Fotomaton andalucia",
      type: InfoType.Proveedores,
      url: "https://fotomatonandalucia.com/",
      phone: null,
      hora: null,
      descripcion: null,
      redSocial: "https://www.instagram.com/fotomatonandalucia/",
      direccion: null,
      latlng: null
  ),

  InfoTabContent(
      title: "Mi dulce valeria",
      type: InfoType.Proveedores,
      url: "http://midulcevaleria.com/",
      phone: null,
      hora: null,
      descripcion: null,
      redSocial: "www.instagram.com/mi_dulce_valeria/",
      direccion: null,
      latlng: null
  ),

  InfoTabContent(
      title: "Aries Floristas",
      type: InfoType.Proveedores,
      url: "https://ariesfloristass.com/",
      phone: null,
      hora: null,
      descripcion: null,
      redSocial: "https://www.instagram.com/aries_floristas/",
      direccion: null,
      latlng: null
  ),

  InfoTabContent(
      title: "Deseada MakeUp",
      type: InfoType.Proveedores,
      url: null,
      phone: "625 588 697",
      hora: null,
      descripcion: null,
      redSocial: "https://www.instagram.com/deseadamakeup/",
      direccion: null,
      latlng: null
  ),

];
