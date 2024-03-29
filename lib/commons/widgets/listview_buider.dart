import 'package:flutter/material.dart';
import 'package:utibu_health_app/commons/widgets/custom_textwidget.dart';

class ListViewCustom extends StatelessWidget {
  ListViewCustom({Key? key});

  final List<String> images = [
    "assets/profile.jpg",
    "assets/profile.jpg",
    "assets/profile.jpg",
    "assets/profile.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    // return MedicineDetailScreen(index: index);
                    return Text("data");
                  },
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(images[index % images.length]), // Use images based on index
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextWidget(
                    text: "Medicine Name ${index + 1}",
                    size: 18,
                    color: Colors.amber.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomTextWidget(
                    text: "Medicine Description ${index + 1}",
                    size: 18,
                    color: Colors.amber.shade200,
                    fontWeight: FontWeight.bold,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
