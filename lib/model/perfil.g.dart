// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perfil.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Perfil _$PerfilFromJson(Map<String, dynamic> json) {
  return Perfil(
    id: json['id'] as String?,
    title: json['title'] as String?,
    idUsers: json['idUsers'] as String?,
  );
}

Map<String, dynamic> _$PerfilToJson(Perfil instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'idUsers': instance.idUsers,
    };
