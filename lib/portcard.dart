import 'package:flutter/material.dart';
import 'package:app/services/http_service.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';

class PortCard extends StatefulWidget {
  final String id;
  final String price;

  const PortCard({required this.price, required this.id});

  @override
  _ServerIpTextState createState() => _ServerIpTextState();
}

class _ServerIpTextState extends State<PortCard> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.id, style: TextStyle(fontWeight: FontWeight.bold));
  }
}
