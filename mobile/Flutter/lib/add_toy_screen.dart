import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

void main() => runApp(AddToy());

class AddToy extends StatelessWidget {
  const AddToy({Key? key}) : super(key: key);

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

  final categoryToy = SelectFieldBloc(
    items: ['Society', 'Educative ','Awkening','Puzzle','Exterior','Imitation'],
  );

  final shapeToy = SelectFieldBloc(
    items: ['Bad', 'Acceptable','Good','New'],
  );


  AllFieldsFormBloc() {
    addFieldBlocs(fieldBlocs: [
      text1,
      boolean1,
      boolean2,
      categoryToy,
      shapeToy,
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
              appBar: AppBar(title: const Text('Adding Toy To Exchange')),
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
                    child: Column(
                      children: <Widget>[
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text1,
                          decoration: const InputDecoration(
                            labelText: 'Toy Title',
                            prefixIcon: Icon(Icons.text_fields),
                          ),
                        ),
                        TextFieldBlocBuilder(
                          textFieldBloc: formBloc.text1,
                          decoration: const InputDecoration(
                            labelText: 'Toy Description',
                            prefixIcon: Icon(Icons.text_fields),
                          ),
                        ),
                        DropdownFieldBlocBuilder<String>(
                          selectFieldBloc: formBloc.categoryToy,
                          decoration: const InputDecoration(
                            labelText: 'Category',
                            prefixIcon: Icon(Icons.sentiment_satisfied),
                          ),
                          itemBuilder: (context, value) => FieldItem(
                            child: Text(value),
                          ),
                        ),
                        DropdownFieldBlocBuilder<String>(
                          selectFieldBloc: formBloc.shapeToy,
                          decoration: const InputDecoration(
                            labelText: 'SHAPE OF THE BOOK',
                            prefixIcon: Icon(Icons.sentiment_satisfied),
                          ),
                          itemBuilder: (context, value) => FieldItem(
                            child: Text(value),
                          ),
                        ),
                        ElevatedButton(
                          onPressed:() {},
                          child: Text('Submit'),
                        ),
                        ElevatedButton(
                          onPressed:() {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text('Cancel'),
                        ),
                      ],
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
            Text(
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
