import 'dart:convert';

import './../Models/association.dart';
import 'package:http/http.dart';

class associationService{
  final String apiUrl = "http://10.0.2.2:8000/association";

  Future<List<Association>> getAssociations() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Association> association = body.map((dynamic item) => Association.fromJson(item)).toList();
      return association;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Association> createAssociation(Association association) async {
    Map data = {
       'id': association.id,
      'nom': association.nomAssociation,
      'matricule': association.matricule,
      'email': association.emailAssociation,
      'adresse': association.adresse,
      'motdepasse': association.motDePasseAssociation,
      'numTel':association.numTelAssociation
    };

    final Response response = await post(
      Uri.parse(apiUrl+'/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Association.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post Associations');
    }
    }

  Future<Association> updateAssociations(String id, Association association ) async {
    Map data = {
     'id': association.id,
      'nom': association.nomAssociation,
      'matricule': association.matricule,
      'email': association.emailAssociation,
      'adresse': association.adresse,
      'motdepasse': association.motDePasseAssociation,
      'numTel':association.numTelAssociation
    };

    final Response response = await put(
      Uri.parse(apiUrl+'/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Association.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a association');
    }
  }

  Future<void> deleteAssociationt(String id) async {
    Response res = await delete(Uri.parse(apiUrl+'/$id'));

    if (res.statusCode == 200) {
      print("Association" deleted");
    } else {
      throw "Failed to delete a Association.";
    }
  }


}
