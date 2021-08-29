import 'package:flutter/material.dart';
import 'package:app/services/http_service.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';
import 'package:app/summary_card.dart';
import 'package:app/pie.dart';
import 'package:app/services/holdings.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'dart:convert';

class Portfolio extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    Holdings holdings = new Holdings();
    Map mapOfHoldings = holdings.getHoldings();

    Map<String, double> holdingsMap = {};

    _launchURL(String code) async {
      String url =
          "https://www.google.com/search?q=${code}+news&oq=${code}+news&aqs=chrome..69i57j69i60l2j69i61.1797j0j4&sourceid=chrome&ie=UTF-8";
      if (await canLaunch(url)) {
        print("Lanuching...");
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    String formatNumber(double num) {
      String retVal = "";
      String tmpNum = "";

      if (num > 1000000) {
        num = num / 1000000;
        tmpNum = num.toStringAsFixed(3);
        retVal = tmpNum + "M";
      } else if (num > 100000) {
        num = num / 1000;
        tmpNum = num.toStringAsFixed(1);
        retVal = tmpNum + "K";
      }
      return retVal;
    }

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
            for (var i = 0; i < posts.length; i++) {
              // print(posts[i].price.toDouble());
              amt = (mapOfHoldings[posts[i].id.toString()]
                  .elementAt(1)
                  .toDouble());
              price = posts[i].price.toDouble();
              gTotal = gTotal + (amt * price);
            }
            print("GT: " + gTotal.toString());
            // String value = gTotalM.toStringAsFixed(3);
            String value = formatNumber(gTotal);
            String delta = formatNumber(250958);
            print("DELTA: " + delta);

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PiePage(holdingsMap)),
                    );
                  },
                  child:
                      SummaryCard(value: value, delta: delta, deltaPercent: ""),
                ),
                Expanded(
                  child: ListView(
                    children: posts.map((Post post) {
                      String code =
                          mapOfHoldings[post.id.toString()].elementAt(0);
                      double amount = mapOfHoldings[post.id.toString()]
                          .elementAt(1)
                          .toDouble();
                      // int totalAmount = (amount * post.price * 3.75).toInt();
                      int totalAmount = (amount * post.price).toInt();
                      grandTotal = grandTotal + totalAmount;
                      holdingsMap[code] = totalAmount.toDouble();
                      // print("GRAND TOTAL:" + grandTotal.toString());
                      return GestureDetector(
                        // onTap: () => print('Tapped'),
                        onTap: () => _launchURL(code),
                        child: Card(
                            child: Column(
                          children: [
                            PortCard(
                              id: code,
                              price: post.price.toString(),
                              amount: amount.toString(),
                              total: totalAmount.toString(),
                            )
                          ],
                        )
                            // subtitle: Text(post.price.toString()),
                            ),
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
