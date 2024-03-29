import 'package:flutter/material.dart';
import 'package:utibu_health_app/commons/widgets/custom_textwidget.dart';
import 'package:utibu_health_app/commons/widgets/listview_buider.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: SearchBar(
              shadowColor: MaterialStatePropertyAll(Colors.grey),
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
          CustomTextWidget(
              text: "We care About your Health ?.",
              size: 18,
              color: Colors.amber.shade200,
              fontWeight: FontWeight.bold),

              SizedBox(height: 10,),
              CustomTextWidget(
              text: "Top Rated Medication ?.",
              size: 18,
              color: Colors.amber.shade200,
              fontWeight: FontWeight.bold
              ),

              SizedBox(height: 10,),
              Expanded(
                child: 
                ListViewCustom()
                ),


        ],
      ),
    );
  }
}
