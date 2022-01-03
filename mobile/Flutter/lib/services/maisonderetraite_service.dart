import 'dart:convert';

import './../Models/maisonderetraite.dart';
import 'package:http/http.dart';

class maisonderetraiteService{
  final String apiUrl = "http://10.0.2.2:8000/maisonderetraite";

  Future<List<Maisonderetraite>> getMaisonderetraites() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Maisonderetraite> maisonderetraite = body.map((dynamic item) => Maisonderetraite.fromJson(item)).toList();
      return maisonderetraite;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Maisonderetraite> createmaisonderetraites(Maisonderetraite maisonderetraite) async {
    Map data = {
       'id': maisonderetraite.id,
      'nom': maisonderetraite.nomMaisonderetraite,
      'matricule': maisonderetraite.matricule,
      'email': maisonderetraite.emailMaisonderetraite,
      'adresse': maisonderetraite.adresse,
      'motdepasse': maisonderetraite.motDePasseMaisonderetraite,
      'numTel': maisonderetraite.numTelMaisonderetraite
    };

    final Response response = await post(
      Uri.parse(apiUrl+'/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Maisonderetraite.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post maisonderetraites');
    }
    }

  Future<Maisonderetraite> updateMaisonderetraites(String id, Maisonderetraite aisonderetraite ) async {
    Map data = {
       'id': maisonderetraite.id,
      'nom': maisonderetraite.nomMaisonderetraite,
      'matricule': maisonderetraite.matricule,
      'email': maisonderetraite.emailMaisonderetraite,
      'adresse': maisonderetraite.adresse,
      'motdepasse': maisonderetraite.motDePasseMaisonderetraite,
      'numTel': maisonderetraite.numTelMaisonderetraite
    };

    final Response response = await put(
      Uri.parse(apiUrl+'/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Maisonderetraite.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a maisonderetraite');
    }
  }

  Future<void> deleteMaisonderetraite(String id) async {
    Response res = await delete(Uri.parse(apiUrl+'/$id'));

    if (res.statusCode == 200) {
      print("Maisonderetraite" deleted");
    } else {
      throw "Failed to delete a Maisonderetraite.";
    }
  }


}