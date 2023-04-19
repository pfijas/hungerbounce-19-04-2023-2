import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restuarant/Splash/cart.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:restuarant/model/breakfast_model.dart';

class breakfast extends StatefulWidget {
  const breakfast({Key? key}) : super(key: key);

  @override
  State<breakfast> createState() => _breakfastState();
}

class _breakfastState extends State<breakfast> {
  void initState() {
    super.initState();

  }
  //calling the class into array
List<Breakfast>breakfastlist=[];
  //calling the methods
  final dbbreakfastcall=BreakfastGet();
  bool isLoading = true;

  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
        itemCount: title.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image(
                              image: NetworkImage('${image[index]}'),
                              //AppImages.magazinePhoto,
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          ListTile(
                            // title: const Text(
                            //   'Magazine Name',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            trailing:  Text(
                              '${title[index]}',
                              style: TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                             '${description[index]}'
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => cart_1(),));
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                    minimumSize: Size(
                                      250,40
                                    )
                                  ),
                                  child: const Text(
                                    'Add to cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              FavoriteButton(
                                iconSize: 45,
                                isFavorite: true,
                                // iconDisabledColor: Colors.white,
                                valueChanged: (_isFavorite) {
                                  print('Is Favorite : $_isFavorite');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                );
              },
            ),
    );
  }
}
