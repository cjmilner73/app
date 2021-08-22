import 'package:flutter/material.dart';
import 'package:app/services/http_service_2.dart';
import 'package:app/services/holding.dart';
import 'package:app/portcard.dart';

class HoldingsPage extends StatelessWidget {
  final HttpService2 httpService2 = HttpService2();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpService2.getHoldings(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          if (snapshot.hasData) {
            List<Holding> holdings = snapshot.data as List<Holding>;
            print("Found has data Holdings");
            print(holdings[0]);

            return Column(
              children: [
                Flexible(
                  child: ListView(
                    children: holdings.map((Holding holding) {
                      // print("GRAND TOTAL:" + grandTotal.toString());
                      return Card(
                          child: Column(
                        children: [
                          PortCard(
                              id: holding.id,
                              price: '0',
                              amount: '0',
                              total: '0')
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
