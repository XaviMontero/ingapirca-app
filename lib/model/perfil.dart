import 'package:json_annotation/json_annotation.dart';

part 'perfil.g.dart';

@JsonSerializable()
class Perfil {
  String? id;
  String? title;
  String? idUsers;

  Perfil({this.id, this.title, this.idUsers});
  factory Perfil.fromJson(Map<String, dynamic> json) => _$PerfilFromJson(json);
  Map<String, dynamic> toJson() => _$PerfilToJson(this);
}

class Perfiles {
  List<Perfil> items = List<Perfil>.empty();

  Perfiles();

  Perfiles.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final result = new Perfil.fromJson(item);
      items.add(result);
    }
  }
}
