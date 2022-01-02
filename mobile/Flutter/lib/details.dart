import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Models/data.dart';
import 'package:mobile/Models/jouet.dart';
import 'package:mobile/edit_toy.dart';
import 'Models/livre.dart';
import 'appbar.dart';

class Details extends StatefulWidget {
  final Type value;

  Details({Key? key, required this.value}) : super(key: key);
  @override
  _ProductDetails createState() => _ProductDetails();
}

class _ProductDetails extends State<Details> {
  getProduct() async {
    if(widget.value.type == "toy"){
      var toyResponse = await http.get(Uri.http("10.0.2.2:8080", '/jouet/${widget.value.id}'));
      var toy = jsonDecode(toyResponse.body);
      Jouet toys = Jouet(toy['id'].toString(), toy['titre'].toString(),
          toy['description'].toString(), toy['etat_jouet'].toString(),
          toy['categorie_jouet'].toString());
      return toys;
    }
    else {
        var bookResponse = await http.get(Uri.http("10.0.2.2:8080", '/livre/${widget.value.id}'));
        var book = jsonDecode(bookResponse.body);
        Livre livre = Livre(book['_id'].toString(), book['titre'].toString(), book['auteur'].toString(), book['maison_edition'].toString(), book['etat_livre'].toString(), book['categorie_livre'].toString());
        return livre;
    }
  }
  String selectedID = "";
  String types = "";
  @override
  Widget build(BuildContext context) {
    var route = MaterialPageRoute(
      builder: (BuildContext context) => EditToy(value: selectedID),
    );
    return Scaffold(
      appBar: MainAppBar(
        title: const Text(
          ("EXCHANGE AND DONATE "),
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Container(
        child: Card(
          child: FutureBuilder(
            future: getProduct(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: const Center(
                    child: Text('Loading...'),
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, i) {
                      if (widget.value.type == "toy") {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(snapshot.data.titre, style: TextStyle(
                                  fontSize: 35, letterSpacing: 3)),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                              child: Text("Description", style: TextStyle(
                                  fontSize: 30, letterSpacing: 1)),

                            ),
                            Text(
                                snapshot.data.description,
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                              child: Text("Shape", style: TextStyle(
                                  fontSize: 30, letterSpacing: 1)),
                            ),
                            Text(
                                snapshot.data.etatJouet,
                                style: TextStyle(fontSize: 20)
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                              child: Text("Categorie", style: TextStyle(
                                  fontSize: 30, letterSpacing: 1)),
                            ),
                            Text(
                                snapshot.data.categorieJouet,
                                style: TextStyle(fontSize: 20)
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 60, 5, 20),
                              width: 300,
                              child: Image.asset("assets/Images/toy.jpg"),
                            ),
                            ElevatedButton(onPressed: (){}, child: Text("Delete")),
                            ElevatedButton(onPressed: (){selectedID = snapshot.data.id; Navigator.of(context).push(route);}, child: Text("Edit")),
                          ],
                        );
                      }
                      if (widget.value.type == "book") {
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(15),
                              child: Text(snapshot.data.titre,style: TextStyle(fontSize: 35, letterSpacing: 3)),
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                              child: Text("Description",style: TextStyle(fontSize: 30, letterSpacing: 1)),

                            ),
                            Text(
                                snapshot.data.auteur,
                                style: TextStyle(fontSize: 20),
                                textAlign: TextAlign.center
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                              child: Text("Shape",style: TextStyle(fontSize: 30, letterSpacing: 1)),
                            ),
                            Text(
                                snapshot.data.etatLivre,
                                style: TextStyle(fontSize: 20)
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                              child: Text("Categorie",style: TextStyle(fontSize: 30, letterSpacing: 1)),
                            ),
                            Text(
                                snapshot.data.categorieLivre,
                                style: TextStyle(fontSize: 20)
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(5, 60, 5, 20),
                              width: 300,
                              child: Image.asset("assets/Images/books.jpg"),
                            ),
                            ElevatedButton(onPressed: (){}, child: Text("Delete")),
                            ElevatedButton(onPressed: (){}, child: Text("Edit")),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            Text("dsqsqd"),
                          ],
                        );
                      }
                    });
              }
            },
          ),
        ),
      ),
    );
  }
}