import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utibu_health_app/commons/widgets/app_icon.dart';
import 'package:utibu_health_app/commons/widgets/big_text.dart';
import 'package:utibu_health_app/commons/widgets/expandable_text_widget.dart';
import 'package:utibu_health_app/models/products_modal.dart';

class ProductsDetails extends StatefulWidget {
  final int productId;
  //final ProductModel singleProduct;

  const ProductsDetails({Key? key, required this.productId,}) : super(key: key);

  @override
  _ProductsDetailsState createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  late DocumentSnapshot productSnapshot;

  @override
  void initState() {
    super.initState();
    // Fetch product details from Firestore when widget is initialized
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    try {
      // Fetch product details from Firestore based on productId
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Products')
          .doc(widget.productId.toString())
          .get();

      if (snapshot.exists) {
        setState(() {
          productSnapshot = snapshot;
        });
      } else {
        // Document with the specified ID doesn't exist
        print('Product with ID ${widget.productId} does not exist.');
      }
    } catch (e) {
      // Handle error
      print('Error fetching product details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Display product details in UI
    if (productSnapshot != null && productSnapshot.exists) {
      // Product details are available
      String name = productSnapshot['name'];
      String description = productSnapshot['description'];
      String image = productSnapshot['image'];
      double price = double.parse(productSnapshot['price']);
      int quantity = productSnapshot['quantity'];

      var size = MediaQuery.of(context).size.height;

      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      // if(page=="cartpage"){
                      //   Get.toNamed(RouteHelper.getCartPage());
                      // }else{
                      //   Get.toNamed(RouteHelper.getInitial());
                      // }
                    },
                    child: AppIcon(
                      icon: Icons.clear,
                      iconsize: 24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        AppIcon(
                          icon: Icons.shopping_cart_outlined,
                          iconsize: 24,
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: AppIcon(
                            icon: Icons.circle,
                            size: 20,
                            iconColor: Colors.transparent,
                            backgroundColor: Colors.greenAccent,
                            iconsize: 24,
                          ),
                        ),
                        Positioned(
                          right: 3,
                          top: 3,
                          child: BigText(
                            text: '1', // Placeholder for cart count
                            size: 14,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              pinned: true,
              backgroundColor: Colors.purple,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  image,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
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
                      text: description,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Price: \$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Quantity: $quantity',
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
        ),
      );
    } else {
      // Product details are still loading or not found
      return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
