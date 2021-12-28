import 'package:flutter/material.dart';

import 'appbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
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
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(

        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
                ("With our App you can exchange and donate your old books or toys with simple click! "),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'popin',
                color: Colors.blue
              ),
            )
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child:  Card(
              color: Colors.blueAccent,
              child: Column(

                children: <Widget>[
                  Text(
                      ("Exchange"),
                      style: TextStyle(
                          fontSize: 18 ,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                      (" Add your book to our list of exchanges"),
                      style: TextStyle(
                          fontSize: 12 ,
                          fontWeight: FontWeight.normal
                      )
                  ),

                  FlatButton(
                    child: Text('Add Book'),
                    textColor: Colors.purple,
                    onPressed: () {},
                  ),
                ],
              ),
              elevation: 5,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child:  Card(
              color: Colors.blueAccent,
              child: Column(

                children: <Widget>[
                  Text(
                      ("Receive"),
                      style: TextStyle(
                          fontSize: 18 ,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  Text(
                      ("Choose a book  "),
                      style: TextStyle(
                          fontSize: 12 ,
                          fontWeight: FontWeight.normal
                      )
                  ),

                  FlatButton(
                    child: Text('View List'),
                    textColor: Colors.purple,
                    onPressed: () {},
                  ),
                ],
              ),
              elevation: 5,
            ),
          ),
          Container(

            padding: EdgeInsets.all(10),
            width: double.infinity,
            child:  Card(
              color: Colors.blueAccent,
              child: Column(

                children: <Widget>[
                  Text(
                  ("Donate"),
                    style: TextStyle(
                        fontSize: 18 ,
                        fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                      ("Donate for who in need "),
                      style: TextStyle(
                          fontSize: 12 ,
                          fontWeight: FontWeight.normal
                      )
                  ),

                  FlatButton(
                    child: Text('Donate'),
                    textColor: Colors.purple,
                    onPressed: () {},
                  ),
                ],
              ),
              elevation: 5,
            ),
          ),
        ],
      ),

    );
  }
}
