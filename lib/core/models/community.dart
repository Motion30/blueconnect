import 'package:flutter/foundation.dart';

class Community{
  final String id;
  final String name;
  final String description;
  final String logo;
  final List<String> users;
  final String admin;

  Community({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.users,
    @required this.admin,
    @required this.logo,
  });

  Community.fromMap(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'],
        description = data['description'],
        users = [...data['users']],
        admin = data['admin'],
        logo  = data['logo'];

  Map<String, dynamic> toJson(){
    return {
      'id' : id,
      'name' : name,
      'logo' : logo,
      'description' : description,
      'users' : users,
      'admin' : admin,
    };
  }
}