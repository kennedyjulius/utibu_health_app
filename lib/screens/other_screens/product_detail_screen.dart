import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utibu_health_app/commons/widgets/app_icon.dart';
import 'package:utibu_health_app/commons/widgets/big_text.dart';
import 'package:utibu_health_app/commons/widgets/expandable_text_widget.dart';

class ProductsDetails extends StatefulWidget {
  final String productId;

  const ProductsDetails({Key? key, required this.productId}) : super(key: key);

  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  DocumentSnapshot? productSnapshot;

  @override
  void initState() {
    super.initState();
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Products')
          .doc(widget.productId)
          .get();

      if (snapshot.exists && snapshot.id == widget.productId) {
        setState(() {
          productSnapshot = snapshot;
        });
      } else {
        print('Product with ID ${widget.productId} does not exist.');
      }
    } catch (e) {
      print('Error fetching product details: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: productSnapshot != null && productSnapshot!.exists
          ? CustomScrollView(
              slivers: [
                SliverAppBar(
                  // Your SliverAppBar implementation
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        ExpandableTextWidget(
                          text: productSnapshot!['description'],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Price: \$${double.parse(productSnapshot!['price']).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Quantity: ${productSnapshot!['quantity']}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
