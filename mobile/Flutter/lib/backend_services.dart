import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  static List<Map<dynamic, dynamic>> whishListItems = [];
  void addToList(Map item) {
    whishListItems.add(item);
  }

  void removeFromList(int index) {
    whishListItems.removeAt(index);
  }

  void updateList(int index, String newValue) {
    //whishListItems[index] = newValue;
  }

  Future<http.Response> getFromWhishList() {
    return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  }

  Future<http.Response> addToWhishList(String title, int id, String userId) {
    return http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'userId': title,
        'id': 124,
        'title': "Hellooooooo"
      }),
    );
  }

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<Album> updateAlbum(String title) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update album.');
    }
  }

  Future<http.Response> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/albums/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response;
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
