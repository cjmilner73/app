import 'package:flutter/material.dart';
import 'package:app/services/http_service.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';

// class PortCard extends StatefulWidget {
//   final String id;
//   final String price;

//   const PortCard({required this.id, required this.price});

//   @override
//   _ServerIpTextState createState() => _ServerIpTextState();
// }

// class _ServerIpTextState extends State<PortCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       child: Row(
//         children: [
//           Text(widget.id,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         ],
//       ),
//     );
//   }
// }

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
            children: [
              Image.asset(
                // 'assets/images/logos/cardano-ada-logo.png',
                "assets/images/logos/${this.id.toLowerCase()}.png",
                height: 30,
                width: 30,
              ),
              Text("   ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(this.id,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(":   ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(this.price,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(":   ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(total,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
