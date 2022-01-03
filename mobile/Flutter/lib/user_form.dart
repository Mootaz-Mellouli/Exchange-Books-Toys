import 'package:flutter/material.dart';
import 'package:mobile/Models/User.dart';
import 'services/user_service.dart';


class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  State<StatefulWidget> createState() =>  _AddDataWidgetState();


}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final userService api = userService();
  final _addFormKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _cinController = TextEditingController();
  final _adresseController = TextEditingController();
  final _emailController = TextEditingController();
  final _numtelController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Users'),
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
                              Text('nom user'),
                              TextFormField(
                                controller: _nomController,
                                decoration: const InputDecoration(
                                  hintText: 'nom user',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter full nom';
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
                              Text('user cin'),
                              TextFormField(
                                controller: _cinController,
                                decoration: const InputDecoration(
                                  hintText: 'cin',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter cin user';
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
                              Text('Adresse user'),
                              TextFormField(
                                controller: _adresseController,
                                decoration: const InputDecoration(
                                  hintText: 'Adresse user',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Adresse user ';
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
                              Text('email'),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'email',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter email';
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
                              Text('num tel user'),
                              TextFormField(
                                controller: _numtelController,
                                decoration: const InputDecoration(
                                  hintText: 'Numtel',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Num tel user';
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
                                    api.createUser(User.constructor( nom:_nomController.text, cin:_cinController.text, adresse:_adresseController.text, email:_emailController.text, numTel:_numtelController.text));

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