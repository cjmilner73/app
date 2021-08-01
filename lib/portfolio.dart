import 'package:flutter/material.dart';
import 'package:app/services/http_service.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';
import 'package:app/services/holdings.dart';

// import 'dart:convert';

class Portfolio extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    Holdings holdings = new Holdings();
    Map mapOfHoldings = holdings.getHoldings();

    return FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data as List<Post>;

            // var key = myMap.keys.elementAt(0);
            // print(myMap[key].toString());
            // Type type = myMap[key].runtimeType;
            // print(type);
            // print(myMap[key].elementAt(1));
            double grandTotal = 0.0;
            // print(tempMap['BTC']);
            // String tempMap = myMap[key];
            // print(key.keys.elementAt(0));
            double amt;
            double gTotal = 0.0;
            double price = 0.0;
            for (var i=0; i<posts.length; i++) {
              print(posts[i].price.toDouble());
              amt = (mapOfHoldings[posts[i].id.toString()].elementAt(1).toDouble());
              price = posts[i].price.toDouble();
              gTotal = gTotal + (amt * price);
            }
            print("GT: " + gTotal.toString());

            return Column(
              children: [
                Card(
                  margin: EdgeInsets.all(10),
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: Text(
                    "SUMMARY: " + gTotal.toInt().toString(),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  )),
                Expanded(
                    child: ListView(
                    children: posts.map((Post post) {
                      String code = mapOfHoldings[post.id.toString()].elementAt(0);
                      double amount =
                          mapOfHoldings[post.id.toString()].elementAt(1).toDouble();
                      // int totalAmount = (amount * post.price * 3.75).toInt();
                      int totalAmount = (amount * post.price).toInt();
                      grandTotal = grandTotal + totalAmount;
                      // print("GRAND TOTAL:" + grandTotal.toString());
                      return Card(
                          child: Column(
                        children: [
                          PortCard(
                            id: code,
                            price: post.price.toString(),
                            total: totalAmount.toString(),
                          )
                        ],
                      )
                          // subtitle: Text(post.price.toString()),
                          );
                    }).toList(),
                  ),
                ),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
