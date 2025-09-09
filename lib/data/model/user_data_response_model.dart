import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/user_data_response_entity.dart';

part 'user_data_response_model.g.dart';

@JsonSerializable()
class UserDataResponseModel extends UserDataResponseEntity {
  UserDataResponseModel({super.limit, super.total, this.users});

  @JsonKey(name: "users")
  final List<UsersDataModel>? users;

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseModelFromJson(json);
}

@JsonSerializable()
class UsersDataModel extends UsersDataEntity {
  UsersDataModel({
    super.id,
    this.firstName,
    this.lastName,
    this.username,
    super.image,
  });

  @JsonKey(name: 'firstName')
  final String? firstName;
  @JsonKey(name: 'lastName')
  final String? lastName;
  @JsonKey(name: 'username')
  final String? username;

  factory UsersDataModel.fromJson(Map<String, dynamic> json) =>
      _$UsersDataModelFromJson(json);
}
