import 'dart:convert';

import './../Models/villagedenfant.dart';
import 'package:http/http.dart';

class villagedenfantService{
  final String apiUrl = "http://10.0.2.2:8000/villagedenfant";

  Future<List<Villagedenfant>> getVillagedenfants() async {
    Response res = await get(Uri.parse(apiUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Villagedenfant> villagedenfant = body.map((dynamic item) => Villagedenfant.fromJson(item)).toList();
      return villagedenfant;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Villagedenfant> createVillagedenfant(Villagedenfant villagedenfant) async {
    Map data = {
       'id': villagedenfant.id,
      'nom': villagedenfant.nomVillagedenfant,
      'matricule': villagedenfant.matricule,
      'email': villagedenfant.emailVillagedenfant,
      'adresse': villagedenfant.adresse,
      'motdepasse': villagedenfant.motDePasseVillagedenfant,
      'numTel':villagedenfant.numTelVillagedenfant
    };

    final Response response = await post(
      Uri.parse(apiUrl+'/add'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Villagedenfant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post villagedenfants');
    }
    }

  Future<Villagedenfant> updateVillagedenfants(String id, Villagedenfant villagedenfant ) async {
    Map data = {
      'id': villagedenfant.id,
      'nom': villagedenfant.nom,
      'matricule': villagedenfant.matricule,
      'email': villagedenfant.emailVillagedenfant,
      'adresse': villagedenfant.adresse,
      'motdepasse': villagedenfant.motDePasseVillagedenfant,
      'numTel':villagedenfant.numTelVillagedenfant
    };

    final Response response = await put(
      Uri.parse(apiUrl+'/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Villagedenfant.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a villagedenfant');
    }
  }

  Future<void> deleteVillagedenfant(String id) async {
    Response res = await delete(Uri.parse(apiUrl+'/$id'));

    if (res.statusCode == 200) {
      print("Villagedenfant" deleted");
    } else {
      throw "Failed to delete a Villagedenfant.";
    }
  }


}