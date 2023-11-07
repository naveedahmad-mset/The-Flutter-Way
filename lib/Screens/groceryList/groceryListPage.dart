import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GroceryListPage extends StatefulWidget {
  const GroceryListPage({super.key, required this.title});

  final String title;

  @override
  State<GroceryListPage> createState() => _GroceryListPageState();
}

class _GroceryListPageState extends State<GroceryListPage> {
  
  var list = [];
  var basicList = [
    {'productTitle': 'Apple',
      'productDescription':
          'This is a sample product description, This is a sample product description, This is a sample product description', 'productPrice': '1.29', 'currency': 'EUR'},
    {'productTitle': 'Orange',
      'productDescription':
          'This is a sample product description, This is a sample product description, This is a sample product description', 'productPrice': '1.49', 'currency': 'USD'},
    {'productTitle': 'Carrot',
      'productDescription':
          'This is a sample product description, This is a sample product description, This is a sample product description', 'productPrice': '0.99', 'currency': 'USD'},
    {'productTitle': 'Tomato',
      'productDescription':
          'This is a sample product description, This is a sample product description, This is a sample product description', 'productPrice': '2.99', 'currency': 'EUR'}
  ];

  @override
  void initState() {
    super.initState();

    list = [...basicList, ...basicList, ...basicList, ...basicList, ...basicList];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          var item = list[index];
          var title = item['productTitle'] ?? "N/A";
          var description = item['productDescription'] ?? "N/A";
          var price = item['productPrice'] ?? "0.0";
          var currency = item['currency'] ?? "USD";
          return Card(
            child: ListTile(
              title: Text(title),
              subtitle: Text(description),
              trailing: Text('$currency $price'),
              leading: Text('${index + 1}'),
            ),
          );
        }),
    );
  }
}
