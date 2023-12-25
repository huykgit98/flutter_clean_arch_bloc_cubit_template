abstract class User {
  User({this.apiToken, this.userId, this.name, this.roleId, this.rolevalue, this.encodeToken});

  late String? apiToken;
  late int? userId;
  late String? name;
  late int? roleId;
  late String? rolevalue;
  late String? encodeToken;
}
