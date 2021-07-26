import 'package:flutter/material.dart';
import 'package:app/services/http_service.dart';
import 'package:app/services/post_model.dart';
import 'package:app/portcard.dart';

class Portfolio extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data as List<Post>;

            return ListView(
              children: posts
                  .map((Post post) => Card(
                          child: Column(
                        children: [
                          PortCard(id: post.id.toString(),
                          price: post.price.toString()),
                        ],
                      )
                          // subtitle: Text(post.price.toString()),
                          ))
                  .toList(),
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
