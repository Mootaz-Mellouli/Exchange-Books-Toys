import 'dart:convert';

import './../Models/User.dart';
import 'package:http/http.dart';

class userService{
  final String apiUrl = "http://10.0.2.2:8000/user";

  Future<List<User>> getUsers() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<User> user = body.map((dynamic item) => User.fromJson(item)).toList();
      return user;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<User> createUser(User user) async {
    Map data = {
      'id': user.id,
      'nom': user.nom,
      'cin': user.cin,
      'email': user.emailUser,
      'adresse': user.adresse,
      'motdepasse': user.motDePasseUser,
      'numTel':user.numTelUser
    };

    final Response response = await post(
      Uri.parse(apiUrl+'/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post users');
    }
    }

  Future<User> updateUsers(String id, User user) async {
    Map data = {
      'id': user.id,
      'nom': user.nom,
      'cin': user.cin,
      'email': user.emailUser,
      'adresse': user.adresse,
      'motdepasse': user.motDePasseUser,
      'numTel':user.numTelUser
    };

    final Response response = await put(
      Uri.parse(apiUrl+'/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a user');
    }
  }

  Future<void> deleteUser(String id) async {
    Response res = await delete(Uri.parse(apiUrl+'/$id'));

    if (res.statusCode == 200) {
      print("User deleted");
    } else {
      throw "Failed to delete a User.";
    }
  }


}