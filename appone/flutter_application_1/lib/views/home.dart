import 'package:flutter/material.dart';
import '/models/products.api.dart';
import 'widgets/products_cart.dart';
import '/models/products.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late List<Product> _products;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getProducts();
  }

  Future<void> getProducts() async {
    _products = await ProductApi.getProduct();

    setState(() {
      _isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.store_outlined),
              SizedBox(width: 10),
              Text('Ecom Shop')
            ],
          ),
        ),
        body: _isLoading 
        ? Center(child: CircularProgressIndicator())
        : ListView.builder(
            itemCount: _products.length,
            itemBuilder: (context, index){
              return Productcart(
                  title: _products[index].name,
                  cookTime: _products[index].totalTime,
                  rating:  _products[index].rating.toString(),
                  thumbnailUrl:  _products[index].images);
            }
            ));
  }
}
