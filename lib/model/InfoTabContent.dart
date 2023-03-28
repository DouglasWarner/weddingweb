class InfoTabContent {
  String title;
  InfoType type;
  String? url;
  String? phone;
  String? hora;
  String? descripcion;
  String? redSocial;
  String? direccion;
  String? mapLocation;
  int? sortType;
  List<dynamic>? images;

  InfoTabContent(
    this.sortType, this.images, {
    required this.title,
    required this.type,
    required this.url,
    required this.phone,
    required this.hora,
    required this.descripcion,
    required this.redSocial,
    required this.direccion,
    required this.mapLocation,
  });

  InfoTabContent.fromJson(Map<String, Object?> json)
      : this(
          json['sortType'] as int?,
          json['images'] as List<dynamic>?,
          title: json['title'] as String,
          type: InfoType.values[json['type'] as int],
          url: json['url'] as String?,
          phone: json['phone'] as String?,
          hora: json['hora'] as String?,
          descripcion: json['descripcion'] as String?,
          redSocial: json['redSocial'] as String?,
          direccion: json['direccion'] as String?,
          mapLocation: json['mapLocation'] as String?,
        );

  Map<String, Object?> toJson() => {
        'title': title,
        'type': type.index,
        'url': url,
        'phone': phone,
        'hora': hora,
        'descripcion': descripcion,
        'redSocial': redSocial,
        'direccion': direccion,
        'mapLocation': mapLocation,
        'images': images,
        'sortType': sortType
      };
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
