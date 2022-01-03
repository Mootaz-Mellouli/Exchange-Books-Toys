import 'package:flutter/material.dart';
import 'package:mobile/Models/association.dart';
import 'services/association_service.dart';


class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  State<StatefulWidget> createState() =>  _AddDataWidgetState();


}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final associationService api = associationService();
  final _addFormKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _matriculeController = TextEditingController();
  final _adresseController = TextEditingController();
  final _emailController = TextEditingController();
  final _numtelController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add associations'),
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
                              Text('nom association'),
                              TextFormField(
                                controller: _nomController,
                                decoration: const InputDecoration(
                                  hintText: 'nom association',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter full nom association';
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
                              Text('matricule association'),
                              TextFormField(
                                controller: _matriculeController,
                                decoration: const InputDecoration(
                                  hintText: 'matricule',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter matricule association';
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
                              Text('Adresse association'),
                              TextFormField(
                                controller: _adresseController,
                                decoration: const InputDecoration(
                                  hintText: 'Adresse association',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Adresse association ';
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
                              Text('num tel association'),
                              TextFormField(
                                controller: _numtelController,
                                decoration: const InputDecoration(
                                  hintText: 'Numtel',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Num tel association';
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
                                    api.createAssociation(Association.constructor( nom:_nomController.text, matricule:_atriculeController.text, adresse:_adresseController.text, email:_emailController.text, numTel:_numtelController.text));

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