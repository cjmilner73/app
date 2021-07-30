import 'package:http/http.dart';
import 'package:app/services/post_model.dart';
import 'package:app/services/holdings.dart';
import 'dart:convert';

class HttpService {
  final String postsUrl =
      "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cethereum&vs_currencies=usd";
  final String postsPreUrl =
      "https://api.coingecko.com/api/v3/simple/price?ids=";
  final String postPostUrl = "&vs_currencies=usd";
  //String postsUrl = "";
  // bitcoin%2Cethereum&vs_currencies=usd

  String formURL() {
    Holdings holdings = new Holdings();
    String bodyUrl = "";

    Map thisHoldings = holdings.getHoldings();

    for (var v in thisHoldings.keys) {
      bodyUrl = bodyUrl + v + "%2C";
    }

    bodyUrl = bodyUrl.substring(0, bodyUrl.length - 1);
    String postsUrl = postsPreUrl + bodyUrl + postPostUrl;
    print(postsUrl);
    return postsUrl;
  }

  Future<List<Post>> getPosts() async {
    String postsUrl = formURL();
    Response res = await get(Uri.parse(postsUrl));

    if (res.statusCode == 200) {
      print("Status 200");
      print(res.body);
      Map<String, dynamic> mymap = jsonDecode(res.body);

      print(mymap);
      List<Post> list = [];
      Post p = Post(id: '', price: 0.0);
      mymap.forEach((k, v) {
        print('HERE: ' + v['usd'].toString());
        double thisPrice = v['usd'].toDouble();
        String thisId = k;
        p = Post(id: thisId, price: thisPrice);
        list.add(p);
      });
      list.forEach((element) {
        print(element.id);
      });
      // List<dynamic> mbody = jsonDecode(res.body);
      // print(mbody.toString());

      // List<Post> posts =
      //     mbody.map((dynamic item) => Post.fromJson(item)).toList();
      print("Posts list: " + list.toString());
      return list;
    } else {
      print("Error getting posts.");
      throw "Can't get posts.";
    }
  }
}