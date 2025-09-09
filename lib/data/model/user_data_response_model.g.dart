// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataResponseModel _$UserDataResponseModelFromJson(
  Map<String, dynamic> json,
) => UserDataResponseModel(
  limit: json['limit'] as num?,
  total: json['total'] as num?,
  users: (json['users'] as List<dynamic>?)
      ?.map((e) => UsersDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserDataResponseModelToJson(
  UserDataResponseModel instance,
) => <String, dynamic>{
  'total': instance.total,
  'limit': instance.limit,
  'users': instance.users,
};

UsersDataModel _$UsersDataModelFromJson(Map<String, dynamic> json) =>
    UsersDataModel(
      id: json['id'] as num?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$UsersDataModelToJson(UsersDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
    };
