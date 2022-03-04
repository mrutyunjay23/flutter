import 'dart:convert';
import '/models/products.dart';
import 'package:http/http.dart' as http;

class ProductApi {

  static Future<List<Product>> getProduct() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"}
        );

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "db286fdda9msh5059467ecb3ee8fp17e1b9jsna40e81f6247c",
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Product.productsFromSnapshot(_temp);
  }
}
