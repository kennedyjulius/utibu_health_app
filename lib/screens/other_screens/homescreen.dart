import 'package:flutter/material.dart';
import 'package:utibu_health_app/commons/widgets/custom_textwidget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomTextWidget(
              text: "Hello Kennedy how are you feeling Today ?.",
              size: 14,
              color: Colors.black26,
              fontWeight: FontWeight.normal),
          SizedBox(
            height: 5,
          ),
          CustomTextWidget(
              text: "Allow us Find you some medicine ?.",
              size: 18,
              color: Colors.amber.shade200,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              color: Colors.grey,
              width: double.maxFinite,
              height: 60,
              child: SearchBar(
                hintText: "Search for a Medicine",
                onChanged: (value) {
                  print(value);
                },
                onSubmitted: (value) {
                  print(value);
                },
                leading: Icon(Icons.search),
                backgroundColor: MaterialStatePropertyAll(Colors.blue.shade50),
                controller: _searchController,
                
              ),
            ),
          ),
          CustomTextWidget(
              text: "We care About your Health ?.",
              size: 18,
              color: Colors.amber.shade200,
              fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
