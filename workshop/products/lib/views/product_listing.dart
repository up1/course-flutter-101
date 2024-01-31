import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:products/models/product.dart';
import 'package:products/views/product_detail.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  ProductListingPageState createState() => ProductListingPageState();
}

class ProductListingPageState extends State<ProductListingPage> {
  List<Product> products = [
    Product(
        name: "Prod name 01",
        description: "Prod desc 01",
        price: 10.00,
        imageUrl:
            'https://images.unsplash.com/photo-1606107557195-0e29a4b5b4aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80'),
    Product(
        name: "Prod name 02",
        description: "Prod desc 01",
        price: 20.00,
        imageUrl:
            'https://images.unsplash.com/photo-1549298916-b41d501d3772?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1624&q=80'),
    Product(
        name: "Prod name 03",
        description: "Prod desc 01",
        price: 30.00,
        imageUrl:
            'https://images.unsplash.com/photo-1604671801908-6f0c6a092c05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
    Product(
        name: "Prod name 04",
        description: "Prod desc 01",
        price: 40.00,
        imageUrl:
            'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
  ];
  List<Product> searchedProducts = [];
  bool isSearchStarted = false;

  void searchProducts(String query) {
    searchedProducts = products
        .where((product) =>
            product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      isSearchStarted = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Product Listing'),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                searchProducts(value);
              },
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
                childAspectRatio:
                    MediaQuery.of(context).size.width > 600 ? 0.8 : 0.9,
              ),
              itemCount:
                  isSearchStarted ? searchedProducts.length : products.length,
              itemBuilder: (context, index) {
                Product product =
                    isSearchStarted ? searchedProducts[index] : products[index];
                return InkWell(
                  //margin: const EdgeInsets.all(8),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailPage(
                        product: products[index],
                      ),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Padding(padding: EdgeInsets.all(5)),
                      CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        width: 150,
                        height: 110,
                        fit: BoxFit.cover,
                      ),
                      Text(product.name),
                      Text(product.description),
                      Text('\$${product.price.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
