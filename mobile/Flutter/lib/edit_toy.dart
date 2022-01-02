import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile/appbar.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:http/http.dart' as http;
import 'Models/jouet.dart';
class EditToy extends StatefulWidget {
  final String value;
  const EditToy({Key? key, required this.value}) : super(key: key);

  @override
  _Form createState() => _Form();
}


class _Form extends State<EditToy> {
  TextEditingController titleC = TextEditingController();
  TextEditingController descriptionC = TextEditingController();
  TextEditingController categorieC = TextEditingController();
  TextEditingController etatC = TextEditingController();
  final List<Map<String, dynamic>> _catItems = [
    {
      'value': 'Society',
      'label':'Society'
    },
    {
      'value': 'Educative',
      'label':'Educative'
    },
    {
      'value': 'Awkening',
      'label':'Awkening'
    },
    {
      'value': 'Puzzle',
      'label':'Puzzle'
    },
    {
      'value': 'Exterior',
      'label':'Exterior'
    },
    {
      'value': 'Imitation',
      'label':'Imitation'
    },
  ];
  final List<Map<String, dynamic>> _etatItems = [
    {
      'value': 'Bad',
      'label':'Bad'
    },
    {
      'value': 'Acceptable',
      'label':'Acceptable'
    },
    {
      'value': 'Good',
      'label':'Good'
    },
    {
      'value': 'New',
      'label':'New'
    }
  ];

  Future<String> submitData(String a, String b, String c, String d) async {
    var toyResponse = await http.put(Uri.http("10.0.2.2:8080", '/jouet/${widget.value}'), body: json.encode({
      "titre": a,
      "description":b,
      "etat_jouet":d,
      "categorie_jouet":c,
      "donate":true,
      "uploaded_by": "USER"
    }), headers: {
      "content-type" : "application/json",
      "accept" : "application/json",
    });
    print(toyResponse.body);
    return toyResponse.body;
  }
  getToy() async{
      var toyResponse = await http.get(Uri.http("10.0.2.2:8080", '/jouet/${widget.value}'));
      var toy = jsonDecode(toyResponse.body);
      Jouet toys = Jouet(toy['id'].toString(), toy['titre'].toString(),
          toy['description'].toString(), toy['etat_jouet'].toString(),
          toy['categorie_jouet'].toString());
      return toys;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: MainAppBar(
        title: const Text(
          ("EXCHANGE AND DONATE "),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),

      ),

      body: Form(
        child: FutureBuilder(
          future: getToy(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: const Center(
                child: Text('Loading...'),
                ),
              );
            }else {
              titleC.text = snapshot.data.titre;
              descriptionC.text = snapshot.data.description;
              categorieC.text = snapshot.data.categorieJouet;
              etatC.text = snapshot.data.etatJouet;
              return ListView.builder(
              itemCount: 1,
              itemBuilder: (context, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  TextFormField(
                  decoration: InputDecoration(
                    icon: const Icon(Icons.title),
                    labelText: "Title",

                  ),
                  controller: titleC,
                  ),
                  TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.text_fields),
                    labelText: "Description",
                  ),
                  controller: descriptionC,
                  ),
                  SelectFormField(
                    icon: const Icon(Icons.security_update_good),
                    labelText:"Categorie",
                    items: _catItems,
                    controller: categorieC,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                  SelectFormField(
                    icon: Icon(Icons.format_shapes_outlined),
                    labelText: "Shape",
                    items: _etatItems,
                    controller: etatC,
                    onChanged: (val) => print(val),
                    onSaved: (val) => print(val),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    child: ElevatedButton(onPressed: (){
                      submitData(titleC.text, descriptionC.text, categorieC.text, etatC.text);
                      }, child: Text("Submit"),
                  )),
                  ],
                );
              }
              );
            }
          }
        ),
    ),
    );
  }
}