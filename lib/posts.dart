import 'package:flutter/material.dart';
import 'package:app/services/http_service.dart';
import 'package:app/services/post_model.dart';

class PostPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    int noOfBTC = 12;

    return Scaffold(
        appBar: AppBar(
          title: Text("Portfolio"),
        ),
        body: FutureBuilder(
            future: httpService.getPosts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data as List<Post>;

                return ListView(
                  children: posts
                      .map((Post post) => Card(
                              child: Column(
                            children: [
                              Text(post.id.toString()),
                              Text(post.price.toString()),
                              Text(noOfBTC.toString()),
                            ],
                          )
                              // subtitle: Text(post.price.toString()),
                              ))
                      .toList(),
                );
              }
              return Center(child: CircularProgressIndicator());
            }));
  }
}
