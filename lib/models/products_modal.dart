import 'dart:convert';
ProductModel productModelFromJson(String str)=>ProductModel.fromJson(json.decode(str));
String productModelToJson(ProductModel data)=>json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.productId,
    //required this.isFavourite,
    required this.name,
    required this.price,
    required this.description,
    //required this.status,
    this.quantity,

  });

  String image;
  String productId;
  //bool isFavourite;
  String name;


  String price;
  String description;
  //String status;
  int ? quantity;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    image: json["image"],
    productId: json["productId"],
    //isFavourite: false,
    quantity: json["quantity"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    //status: json["status"],


  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "productid": productId,
    //"isFavourite":isFavourite,
    "quantity": quantity,
    "name": name,
    "price": price,
    "description":description,
  };
  ProductModel copyWith({
    String? image,
    String? productId,
    //bool? isFavourite,
    String? name,
    String? price,
    String? description,
    //String? status,
    int ? quantity,
  }) {
    return ProductModel(
      image: image ?? this.image,
      productId: productId ?? this.productId,
      //isFavourite: isFavourite ?? this.isFavourite,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      //status: status ?? this.status,
      quantity: quantity ?? this.quantity,
    );
  }
}
