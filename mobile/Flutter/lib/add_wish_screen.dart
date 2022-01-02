import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mobile/whish_list_item_card.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

import './backend_services.dart';

class AddWhishScreen extends StatefulWidget {
  const AddWhishScreen({Key? key}) : super(key: key);

  @override
  _AddWhishScreenState createState() => _AddWhishScreenState();
}

enum SingingCharacter { toy, book }

class _AddWhishScreenState extends State<AddWhishScreen> {
  late Future<Album> futureAlbum;
  int index = 0;
  int currentItemIndex = 0;
  void initState() {
    super.initState();
    futureAlbum = futureAlbum = Services().fetchAlbum();
  }

  TextEditingController descController = TextEditingController();
  TextEditingController updateItemController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  SingingCharacter? _character = SingingCharacter.toy;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Adding To Whishlist')),
      body: SingleChildScrollView(
          child: SafeArea(
        child: index == 0
            ? Container(
                height: height * .9,
                padding: EdgeInsets.only(
                    left: height * .0075, right: height * .0075),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Text(
                    //     "Add to whish list:",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: height * .03),
                    //   ),
                    // ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Category:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * .03),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: const Text('Toy'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.toy,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Book'),
                            leading: Radio<SingingCharacter>(
                              value: SingingCharacter.book,
                              groupValue: _character,
                              onChanged: (SingingCharacter? value) {
                                setState(() {
                                  _character = value;
                                });
                              },
                            ),
                          ),
                        ),

                        // ListTile(
                        //   title: const Text('Book'),
                        //   leading: Radio<SingingCharacter>(
                        //     value: SingingCharacter.book,
                        //     groupValue: _character,
                        //     onChanged: (SingingCharacter? value) {
                        //       setState(() {
                        //         _character = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                      ],
                    ),
                    Container(
                      height: height * .5,
                      padding: EdgeInsets.only(top: height * .005),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: null,
                        controller: descController,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          alignLabelWithHint: true,
                          prefixIcon: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, height * .42),
                            child: const Icon(Icons.text_fields),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Quantity:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: height * .03),
                      ),
                    ),
                    TextFormField(
                      maxLines: null,
                      controller: quantityController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Quantity',
                        alignLabelWithHint: true,
                        prefixIcon: const Icon(Icons.text_fields),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    FutureBuilder<Album>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data!.title);
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator();
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            var quan = int.tryParse(quantityController.text);
                            if (quan != null &&
                                descController.text.trim() != "" &&
                                quantityController.text.isNotEmpty) {
                              Services().addToList({
                                "Category": _character == SingingCharacter.book
                                    ? "Book"
                                    : "Toy",
                                "Description": descController.text,
                                "Quantity": int.parse(quantityController.text)
                              });
                              descController.text = "";
                            }

                            // print(await getFromWhishList());
                            // getFromWhishList();
                          },
                          child: const Text('ADD ITEM'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              index = 1;
                            });
                            // print(await getFromWhishList());
                            // getFromWhishList();
                          },
                          child: const Text('VIEW ITEMS'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : index == 1
                ? Column(
                    children: [
                      Wrap(
                        children: List<Widget>.generate(
                            Services.whishListItems.length, (i) {
                          return TouchableOpacity(
                            child: WishListItemCard(
                              category: Services.whishListItems[i]["Category"],
                              description: Services.whishListItems[i]
                                  ["Description"],
                              quantity: Services.whishListItems[i]["Quantity"],
                            ),
                            onTap: () {
                              setState(() {
                                currentItemIndex = i;
                                index = 2;
                              });
                            },
                          );
                        }),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios))
                    ],
                  )
                : Column(
                    children: [
                      WishListItemCard(
                        category: Services.whishListItems[currentItemIndex]
                            ["Category"],
                        description: Services.whishListItems[currentItemIndex]
                            ["Description"],
                        quantity: Services.whishListItems[currentItemIndex]
                            ["Quantity"],
                      ),
                      Container(
                        padding: EdgeInsets.all(height * .02),
                        child: TextFormField(
                          maxLines: null,
                          controller: updateItemController,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            labelText: 'Update quantity...',
                            alignLabelWithHint: true,
                            prefixIcon: const Icon(Icons.text_fields),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              Services().removeFromList(currentItemIndex);

                              setState(() {
                                index = 1;
                              });

                              // print(await getFromWhishList());
                              // getFromWhishList();
                            },
                            child: const Text('Remove'),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (updateItemController.text.trim() != "") {
                                setState(() {
                                  Services().updateList(currentItemIndex,
                                      updateItemController.text);
                                  updateItemController.text = "";
                                });
                              }

                              // print(await getFromWhishList());
                              // getFromWhishList();
                            },
                            child: const Text('Modify'),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          icon: const Icon(Icons.arrow_back_ios))
                    ],
                  ),
      )),
    );
  }
}
