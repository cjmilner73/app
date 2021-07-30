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
    Map myMap = holdings.getHoldings();

    return FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data as List<Post>;

            var key = myMap.keys.elementAt(0);
            print(myMap[key].toString());
            Type type = myMap[key].runtimeType;
            print(type);
            print(myMap[key].elementAt(1));
            double grandTotal = 0.0;
            // print(tempMap['BTC']);
            // String tempMap = myMap[key];
            // print(key.keys.elementAt(0));

            return ListView(
              children: posts.map((Post post) {
                String code = myMap[post.id.toString()].elementAt(0);
                double amount =
                    myMap[post.id.toString()].elementAt(1).toDouble();
                int totalAmount = (amount * post.price).toInt();
                print(post.id.toString() + " : " + post.price.toString());
                print(post.id.toString() + " : " + totalAmount.toString());
                grandTotal = grandTotal + totalAmount;
                print("GRAND TOTAL:" + grandTotal.toString());
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
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
