import 'package:flutter/material.dart';
import 'package:app/services/http_service.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portfolio.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int noOfBTC = 12;

    return Scaffold(
      appBar: AppBar(
        title: Text("Portfolio"),
      ),
      body: Portfolio(),
    );
  }
}
