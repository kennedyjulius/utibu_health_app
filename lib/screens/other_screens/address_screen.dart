import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
                    TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 0,
                      groupValue: _tabController.index,
                      onChanged: (value) {
                        setState(() {
                          _tabController.index = value as int;
                        });
                      },
                    ),
                    Text("Delivery"),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _tabController.index,
                      onChanged: (value) {
                        setState(() {
                          _tabController.index = value as int;
                        });
                      },
                    ),
                    Text('Pickup'),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // View 1
                Center(
                  child: Text('View 1 Content'),
                ),
                // View 2
                Center(
                  child: Text('View 2 Content'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
 