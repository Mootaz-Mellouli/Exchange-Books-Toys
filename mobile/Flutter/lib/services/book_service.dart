import 'dart:convert';

import './../Models/livre.dart';
import 'package:http/http.dart';

class bookService{
  final String apiUrl = "http://10.0.2.2:8000/livre";

  Future<List<Livre>> getBooks() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Livre> livre = body.map((dynamic item) => Livre.fromJson(item)).toList();
      return livre;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Livre> createBook(Livre livre) async {
    Map data = {
      'id': livre.id,
      'titre': livre.titre,
      'auteur': livre.auteur,
      'maisonEdition': livre.maisonEdition,
      'etatLivre': livre.etatLivre,
      'categorieLivre': livre.categorieLivre,
    };

    final Response response = await post(
      Uri.parse(apiUrl+'/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Livre.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post books');
    }
    }

  Future<Livre> updateBooks(String id, Livre livre) async {
    Map data = {
      'id': livre.id,
      'titre': livre.titre,
      'auteur': livre.auteur,
      'maisonEdition': livre.maisonEdition,
      'etatLivre': livre.etatLivre,
      'categorieLivre': livre.categorieLivre,
    };

    final Response response = await put(
      Uri.parse(apiUrl+'/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Livre.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteBook(String id) async {
    Response res = await delete(Uri.parse(apiUrl+'/$id'));

    if (res.statusCode == 200) {
      print("Book deleted");
    } else {
      throw "Failed to delete a Book.";
    }
  }


}