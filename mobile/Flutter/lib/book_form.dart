import 'package:flutter/material.dart';
import 'package:mobile/Models/livre.dart';
import 'services/book_service.dart';


class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  State<StatefulWidget> createState() =>  _AddDataWidgetState();


}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final bookService api = bookService();
  final _addFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _auteurController = TextEditingController();
  final _publishingHouseController = TextEditingController();
  final _CategoryController = TextEditingController();
  final _ShapeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Books'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Book Title'),
                              TextFormField(
                                controller: _titleController,
                                decoration: const InputDecoration(
                                  hintText: 'Book Title',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter full Title';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Book Author'),
                              TextFormField(
                                controller: _auteurController,
                                decoration: const InputDecoration(
                                  hintText: 'Author',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Book Author';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Publishing House Book'),
                              TextFormField(
                                controller: _publishingHouseController,
                                decoration: const InputDecoration(
                                  hintText: 'Publishing House',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Book Publishing House ';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Shape Book'),
                              TextFormField(
                                controller: _ShapeController,
                                decoration: const InputDecoration(
                                  hintText: 'Shape',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Book Shape';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Book Category'),
                              TextFormField(
                                controller: _CategoryController,
                                decoration: const InputDecoration(
                                  hintText: 'Category',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Book Category';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              RaisedButton(
                                splashColor: Colors.red,
                                onPressed: () {
                                  if (_addFormKey.currentState!.validate()) {
                                    _addFormKey.currentState!.save();
                                    api.createBook(Livre.constructor( titre:_titleController.text, auteur:_auteurController.text, maisonEdition:_publishingHouseController.text, etatLivre:_ShapeController.text, categorieLivre:_CategoryController.text));

                                    Navigator.pop(context) ;
                                  }
                                },
                                child: Text('Save', style: TextStyle(color: Colors.white)),
                                color: Colors.blue,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                )
            ),
          ),
        ),
      ),
    );
  }
}