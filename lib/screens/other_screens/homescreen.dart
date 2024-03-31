import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:utibu_health_app/models/products_modal.dart';
import 'package:utibu_health_app/screens/other_screens/product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductModel>> productsFuture;

  @override
  void initState() {
    super.initState();
    productsFuture = fetchProducts();
  }

  Future<List<ProductModel>> fetchProducts() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Products').get();
      return snapshot.docs.map((doc) {
        final data = (doc.data() as Map<String, dynamic>);
        final image = data?['image'] ?? ''; // Provide default value if image is null
        final productId = data?['productId'] ?? ''; // Provide default value if id is null
        final name = data?['name'] ?? ''; // Provide default value if name is null
        final price = data?['price'] ?? ''; // Provide default value if price is null
        final description = data?['description'] ?? ''; // Provide default value if description is null
        final quantity = data?['quantity'] ?? 0; // Provide default value if quantity is null
        
        // Validate required fields
        if (image.isEmpty || productId.isEmpty || name.isEmpty || price.isEmpty || description.isEmpty) {
          throw Exception('Invalid product data: $data');
        }
        
        return ProductModel(
          image: image,
          productId: productId,
          name: name,
          price: price,
          description: description,
          quantity: quantity,
        );
      }).toList();
    } catch (e) {
      print('Error fetching products: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          splashRadius: 20,
          icon: Icon(
            Icons.menu,
            color: Colors.indigo,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Utibu Health',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.message),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notification_add),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder<List<ProductModel>>(
                future: productsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List<ProductModel>? products = snapshot.data;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 4,
                      ),
                      itemCount: products!.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        ProductModel product = products[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductsDetails(
                                  productId: product.productId,
                                )
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      clipBehavior: Clip.hardEdge,
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        product.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          product.description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Price: Kshs ${product.price}',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Spacer(),
                                            TextButton(
                                              onPressed: () {
                                                // Buy button action
                                              },
                                              child: Text("Buy"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.message),
      ),
    );
  }
}
