import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final String value;
  final String delta;
  final String deltaPercent;

  SummaryCard(
      {required this.value, required this.delta, required this.deltaPercent});

  // final Map myMap = {'bitcoin': 'BTC'};

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                SizedBox(width: 10),
                Text(value,
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.normal)),
                Text("M",
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.normal)),
                SizedBox(width: 4),
                Text("USD",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
                SizedBox(width: 40),
                Text("+58K",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.normal,
                        color: Colors.green)),
                SizedBox(width: 4),
                Text("USD",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey)),
              ]),
          Row(
            children: [
              SizedBox(width: 10),
              Text("VALUE", style: TextStyle(fontSize: 10, color: Colors.grey)),
            ],
          )
        ],
      ),
    );
  }
}
