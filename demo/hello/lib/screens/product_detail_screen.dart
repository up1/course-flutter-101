import 'package:flutter/material.dart';
import 'package:hello/widgets/product_detail_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Product Detail'),
        centerTitle: true,
      ),
      body: ProductDetailWidget(productId: widget.productId),
    );
  }
}
