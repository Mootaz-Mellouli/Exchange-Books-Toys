import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'Models/livre.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(AddBook());

class AddBook extends StatelessWidget {
  const AddBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllFieldsForm(),
    );
  }
}

class AllFieldsFormBloc extends FormBloc<String, String> {
  final text1 = TextFieldBloc();

  final boolean1 = BooleanFieldBloc();

  final boolean2 = BooleanFieldBloc();

  final categoryBook = SelectFieldBloc(
    items: ['Academic', 'Novel ','Scientific','Dictionary','Art','History'],
  );

  final shapeBook = SelectFieldBloc(
    items: ['Bad', 'Acceptable','Good','New'],
  );

  final multiSelect1 = MultiSelectFieldBloc<String, dynamic>(
    items: [
      'Option 1',
      'Option 2',
    ],
  );

  final date1 = InputFieldBloc<DateTime?, dynamic>(initialValue: null);

  final dateAndTime1 = InputFieldBloc<DateTime?, dynamic>(initialValue: null);

  final time1 = InputFieldBloc<TimeOfDay?, Object>(initialValue: null);

  AllFieldsFormBloc() {
    addFieldBlocs(fieldBlocs: [
      text1,
      boolean1,
      boolean2,
      categoryBook,
      shapeBook,
      multiSelect1,
      date1,
      dateAndTime1,
      time1,
    ]);
  }

  @override
  void onSubmitting() async {
    try {
      await Future<void>.delayed(Duration(milliseconds: 500));

      emitSuccess(canSubmitAgain: true);
    } catch (e) {
      emitFailure();
    }
  }
}

class AllFieldsForm extends StatelessWidget {

  var livre = Livre.constructor(id:'', titre:'', auteur:'', maisonEdition:'', etatLivre:'', categorieLivre:'');
  final _form = GlobalKey<FormState>();
  void _saveForm()
  {
    _form.currentState!.save();
    print(livre.titre);
    print(livre.auteur);
    print(livre.categorieLivre);
    print(livre.maisonEdition);
    print(livre.etatLivre);
  }
  void addBook(Livre livre)
  {
    var url = Uri.http('10.0.2.2:8080', '/livre/add') ;
    http.post(url,body: json.encode({
      'titre':livre.titre,
      'auteur':livre.auteur,
      'maison_edition':livre.maisonEdition,
      'etat_livre':livre.etatLivre,
      'categorie_livre':livre.categorieLivre

    }),);

  }


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllFieldsFormBloc(),
      child: Builder(
        builder: (context) {
          final formBloc = BlocProvider.of<AllFieldsFormBloc>(context);

          return Theme(
            data: Theme.of(context).copyWith(
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            child: Scaffold(
              appBar: AppBar(title: Text('Adding Book To Exchange')),
              body: FormBlocListener<AllFieldsFormBloc, String, String>(
                onSubmitting: (context, state) {
                  LoadingDialog.show(context);
                },
                onSuccess: (context, state) {
                  LoadingDialog.hide(context);

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => SuccessScreen()));
                },
                onFailure: (context, state) {
                  LoadingDialog.hide(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.failureResponse!)));
                },
                child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _form,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Book Title ',
                              prefixIcon: Icon(Icons.text_fields),
                            ),
                            onSaved: (value)
                            {
                              livre = Livre.constructor(id:livre.id,
                                  titre:value,
                                  auteur:livre.auteur,
                                  maisonEdition:livre.maisonEdition,
                                  etatLivre:livre.etatLivre,
                                  categorieLivre:livre.categorieLivre
                              );
                            },// onSaved()
                            keyboardType: TextInputType.multiline,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Book Author',
                              prefixIcon: Icon(Icons.text_fields),
                            ),
                            onSaved: (value)
                            {
                              livre = Livre.constructor(id:livre.id,
                                  titre:livre.titre,
                                  auteur:value,
                                  maisonEdition:livre.maisonEdition,
                                  etatLivre:livre.etatLivre,
                                  categorieLivre:livre.categorieLivre
                              );
                            },// onSaved()
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Book House Publishing',
                              prefixIcon: Icon(Icons.text_fields),
                            ),
                            onSaved: (value)
                            {
                              livre = Livre.constructor(id:livre.id,
                                  titre:livre.titre,
                                  auteur:livre.auteur,
                                  maisonEdition:value,
                                  etatLivre:livre.etatLivre,
                                  categorieLivre:livre.categorieLivre
                              );
                            },// onSaved()
                          ),
                          DropdownFieldBlocBuilder<String>(
                            selectFieldBloc: formBloc.categoryBook,
                            decoration: const InputDecoration(
                              labelText: 'Category',
                              prefixIcon: Icon(Icons.sentiment_satisfied),
                            ),
                            itemBuilder: (context, value) => FieldItem(
                              child: Text(value),
                            ),
                            onChanged: (value)
                            {
                              livre = Livre.constructor(id:livre.id,
                                  titre:livre.titre,
                                  auteur:livre.auteur,
                                  maisonEdition:livre.maisonEdition,
                                  etatLivre:livre.etatLivre,
                                  categorieLivre:value
                              );
                            },// onSaved()
                          ),
                          DropdownFieldBlocBuilder<String>(
                            selectFieldBloc: formBloc.shapeBook,
                            decoration: const InputDecoration(
                              labelText: 'SHAPE OF THE BOOK',
                              prefixIcon: Icon(Icons.sentiment_satisfied),
                            ),
                            itemBuilder: (context, value) => FieldItem(
                              child: Text(value),
                            ),
                            onChanged: (value)
                            {
                              livre = Livre.constructor(id:livre.id,
                                  titre:livre.titre,
                                  auteur:livre.auteur,
                                  maisonEdition:livre.maisonEdition,
                                  etatLivre:value,
                                  categorieLivre:livre.categorieLivre
                              );
                            },// onSaved()
                          ),
                          ElevatedButton(
                            onPressed:() {
                              _saveForm();
                              addBook(livre);
                            },
                            child: Text('Submit'),
                          ),
                          ElevatedButton(
                            onPressed:() {},
                            child: Text('Cancel'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
    context: context,
    useRootNavigator: false,
    barrierDismissible: false,
    builder: (_) => LoadingDialog(key: key),
  ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Card(
          child: Container(
            width: 80,
            height: 80,
            padding: EdgeInsets.all(12.0),
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}

class SuccessScreen extends StatelessWidget {
  SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.tag_faces, size: 100),
            SizedBox(height: 10),
            const Text(
              'Success',
              style: TextStyle(fontSize: 54, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => AllFieldsForm())),
              icon: Icon(Icons.replay),
              label: Text('AGAIN'),
            ),
          ],
        ),
      ),
    );
  }
}
