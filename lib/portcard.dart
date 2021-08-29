import 'package:flutter/material.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';

class PortCard extends StatelessWidget {
  final String id;
  final String price;
  final String amount;
  final String total;

  PortCard(
      {required this.id,
      required this.price,
      required this.amount,
      required this.total});

  // final Map myMap = {'bitcoin': 'BTC'};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Image.asset(
                // 'assets/images/logos/cardano-ada-logo.png',
                "assets/images/logos/${this.id.toLowerCase()}.png",
                height: 25,
                width: 25,
              ),
              Text(" ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 80,
                child: Text(this.id,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              SizedBox(
                width: 140,
                child: Text(this.price,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Text(total,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(" USD",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
            ],
          ),
          Divider(height: 10),
          Row(
            children: [
              SizedBox(width: 47),
              Text(this.amount, style: TextStyle(color: Colors.green)),
            ],
          )
        ],
      ),
    );
  }
}
