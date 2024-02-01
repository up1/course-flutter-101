import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductListingWidget extends StatelessWidget {
  const ProductListingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => ListTile(
          leading: const FlutterLogo(),
          title: Text('Product $index'),
          subtitle: Text('Description of product $index'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => {
                context.push('/product/$index'),
              }),
    );
  }
}
