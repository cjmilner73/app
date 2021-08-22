import 'package:http/http.dart';
import 'package:app/services/holding.dart';
import 'dart:convert';


class HttpService2 {
  final String holdingsUrl = "http://127.0.0.1:5000/holdings";
//String postsUrl = "";
// bitcoin%2Cethereum&vs_currencies=usd

  Future<List<Holding>> getHoldings() async {
    Response res = await get(Uri.parse(holdingsUrl));

    if (res.statusCode == 200) {
      print("Status 202");
      Map<String, dynamic> mymap = jsonDecode(res.body);
      List<dynamic> tmpList = mymap['holdings'];
      List<Holding> holdingList = [];
      print(tmpList);
      // Holding h = Holding(id: '', name: '', amount: 0);
      for (var i = 0; i < tmpList.length; i++) {
        String name = tmpList[i]['name'];
        String id = tmpList[i]['id'];
        int amount = tmpList[i]['amount'];

        // Holding h = new Holding(name, id, amount);
        Holding h = new Holding(name: name, id: id, amount: amount);
        print("h: ");
        print(h.amount);
        holdingList.add(h);
      }
      // mymap.forEach((k, v) {
      //   String thisID = v['id'];
      //   String thisName = v['name'];
      //   h = Holding(id: thisID, name: thisName);
      //   print("Adding " + h.toString());
      //   holdingList.add(h);
      //   //   list.sort((a, b) => b.price.compareTo(a.price));
      // });
      // list.forEach((element) {
      //   print(element.id);
      // });
      // List<dynamic> mbody = jsonDecode(res.body);
      // print(mbody.toString());

      // List<Post> posts =
      //     mbody.map((dynamic item) => Post.fromJson(item)).toList();
      // print("Holdings list: " + list.toString());
      return holdingList;
    } else {
      print("Error getting posts.");
      throw "Can't get posts.";
    }
  }
}
