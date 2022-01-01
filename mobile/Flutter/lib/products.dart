import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/Models/data.dart';
import 'package:mobile/Models/livre.dart';
import 'Models/jouet.dart';
import 'appbar.dart';
import 'details.dart';

class FetchAPI extends StatefulWidget {
  @override
  _ProductList createState() => _ProductList();
}

class _ProductList extends State<FetchAPI> {
  getBooks() async {
    var response = await http.get(Uri.http("10.0.2.2:8080", "/livre/"));
    var data = jsonDecode(response.body);

    List<Livre> books = [];
    for(var book in data) {
      Livre livre = Livre(book['id'].toString(),book['titre'].toString(), book['auteur'].toString(),book['maison_edition'].toString(), book['etat_livre'].toString(), book['categorie_livre'].toString());
      books.add(livre);
    }
    return books;
  }

  getToys() async {
    var response = await http.get(Uri.http("10.0.2.2:8080", "/jouet/"));
    var data = jsonDecode(response.body);
    List<Jouet> toys = [];
    for(var x in data) {
      Jouet toy = Jouet(x['id'].toString(), x['titre'].toString(), x['description'].toString(), x['etat_jouet'].toString(), x['categorie_jouet'].toString());
      toys.add(toy);
    }
    return toys;

  }

  String selectedID = "";
  String type = "";
  Widget createToysListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    var route = MaterialPageRoute(
      builder: (BuildContext context) => Details(value: Type(id: selectedID, type: type)),
    );
    if(values!=null){
      return ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return values.isNotEmpty
              ?
          GestureDetector(
              onTap: (){
                setState(() {
                  selectedID = values[index].id;
                  type = "toy";
                });
                Navigator.of(context).push(route);
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(values[index].titre),
                    subtitle: Text(values[index].description),
                    trailing: Image.asset("assets/Images/toy.jpg"),
                  ),
                  const Divider(
                    height: 2.0,
                  ),
                ],
              ))
              : CircularProgressIndicator();
        },
      );
    }else {
      return Container(child: const Center(child: Text("No data", textAlign: TextAlign.center,)),);
    }
  }

  Widget createBooksListView(BuildContext context, AsyncSnapshot snapshot) {
    var values = snapshot.data;
    var route = MaterialPageRoute(
      builder: (BuildContext context) => Details(value: Type(id: selectedID, type: type)),
    );
    if(values!=null){
      return ListView.builder(
        itemCount: values.length,
        itemBuilder: (BuildContext context, int index) {
          return values.isNotEmpty
              ?
          GestureDetector(
              onTap: (){
                setState(() {
                  selectedID = values[index].id;
                  type = "book";
                });
                Navigator.of(context).push(route);
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(values[index].titre),
                    subtitle: Text(values[index].auteur),
                    trailing: Image.asset("assets/Images/books.jpg"),
                  ),
                  const Divider(
                    height: 2.0,
                  ),
                ],
              ))
              : CircularProgressIndicator();
        },
      );
    }
    else {
      return Container(child: const Center(child: Text("No data")),);
    }

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
      body: Row(children: <Widget>[
        Expanded(
          child: FutureBuilder<dynamic>(
              future: getBooks(),
              builder: (context, snapshot) {
                if(snapshot.data!=null) {
                  return createBooksListView(context, snapshot);
                }
                else {
                  return const Text("No Book Data");
                }
              }),
        ),
        Expanded(
          child: FutureBuilder<dynamic>(
              future: getToys(),
              builder: (context, snapshot) {
              if(snapshot.data!=null) {
                return createToysListView(context, snapshot);
              } else {
                  return const Text("No Toy Data");
              }
              }),
        ),
      ],

      ),
    );
  }

}
