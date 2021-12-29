import 'package:flutter/material.dart';
import 'package:mobile/add_book_donate_screen.dart';
import 'package:mobile/add_toy_donate_screen.dart';
import 'package:mobile/add_toy_screen.dart';
import './add_book_screen.dart';
import 'appbar.dart';
import 'products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
      routes: {
        '/add_book': (BuildContext context) => AddBook(),
        '/add_toy': (BuildContext context) => AddToy(),
        '/home': (BuildContext context) => MyHomePage(),
        '/add_book_donate': (BuildContext context) => AddBookDonate(),
        '/add_toy_donate': (BuildContext context) => AddToyDonate(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('EXCHANGE AND DONATE YOUR BOOKS AND TOYS'),
            ),
            ListTile(
              title: const Text('Add Your Book'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/add_book');
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Donate Your Book'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/add_book_donate');
              },
            ),
            ListTile(
              title: const Text('View List Of Books'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: const Text('Add Your Toy'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/add_toy');
              },
            ),
            ListTile(
              title: const Text('Donate Your Toy'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/add_toy_donate');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: const Text(
                  (" "),
                  style: TextStyle(
                      fontSize: 30, fontFamily: 'popin', color: Colors.blue),
                )),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    const Text(("Exchange"),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text((" Add your book to our list of exchanges"),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                    FlatButton(
                      child: Text('Add Book'),
                      textColor: Colors.purple,
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_book');
                      },
                    ),
                  ],
                ),
                elevation: 5,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    const Text(("Exchange"),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text((" Add your Toy to our list of exchanges"),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                    FlatButton(
                      child: Text('Add Toy'),
                      textColor: Colors.purple,
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_toy');
                      },
                    ),
                  ],
                ),
                elevation: 5,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    const Text(("Receive"),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text(("Choose a book  "),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                    FlatButton(
                      child: Text('View List'),
                      textColor: Colors.purple,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchAPI()));
                      },
                    ),
                  ],
                ),
                elevation: 5,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    const Text(("Donate"),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text(("Donate Your Book for who in need "),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                    FlatButton(
                      child: const Text('Donate Your Book'),
                      textColor: Colors.purple,
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_book_donate');
                      },
                    ),
                  ],
                ),
                elevation: 5,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              child: Card(
                color: Colors.blueAccent,
                child: Column(
                  children: <Widget>[
                    const Text(("Donate"),
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text(("Donate Your Toy for who in need "),
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.normal)),
                    FlatButton(
                      child: Text('Donate Your Toy'),
                      textColor: Colors.purple,
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_toy_donate');
                      },
                    ),
                  ],
                ),
                elevation: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
