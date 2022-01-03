import 'package:flutter/material.dart';
import 'package:mobile/Models/villagedenfant.dart';
import 'services/villagedenfant_service.dart';


class AddDataWidget extends StatefulWidget {
  AddDataWidget();

  @override
  State<StatefulWidget> createState() =>  _AddDataWidgetState();


}

class _AddDataWidgetState extends State<AddDataWidget> {
  _AddDataWidgetState();

  final villagedenfantService api = villagedenfantService();
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
        title: const Text('Add villagedenfants'),
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
                              Text('nom villagedenfant'),
                              TextFormField(
                                controller: _nomController,
                                decoration: const InputDecoration(
                                  hintText: 'nom villagedenfant',
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
                              Text('matricule'),
                              TextFormField(
                                controller: _cinController,
                                decoration: const InputDecoration(
                                  hintText: 'matricule',
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter matricule villagedenfant';
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
                              Text('Adresse villagedenfant'),
                              TextFormField(
                                controller: _adresseController,
                                decoration: const InputDecoration(
                                  hintText: 'Adresse villagedenfant',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Adresse villagedenfant';
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
                              Text('num tel villagedenfant'),
                              TextFormField(
                                controller: _numtelController,
                                decoration: const InputDecoration(
                                  hintText: 'Numtel',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Num tel villagedenfant';
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
                                    api.createVillagedenfant(Villagedenfant.constructor( nom:_nomController.text, matricule:_matriculeController.text, adresse:_adresseController.text, email:_emailController.text, numTel:_numtelController.text));

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