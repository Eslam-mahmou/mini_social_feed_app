class UserDataResponseEntity {
  UserDataResponseEntity({this.users, this.total, this.limit});

  List<UsersDataEntity>? users;
  num? total;
  num? limit;
}

class UsersDataEntity {
  UsersDataEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.image,
  });

  num? id;
  String? firstName;
  String? lastName;
  String? username;
  String? image;
}
