import 'package:covid19/ui/date_range_screen.dart';
import 'package:covid19/ui/maps_screen.dart';
import 'package:covid19/ui/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TabBarScreen extends StatefulWidget {
  @override
  TabBarScreenState createState() => TabBarScreenState();
}

class TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid19'),
        centerTitle: true,
      ),
      bottomNavigationBar: TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.blue,
        tabs: [
          Tab(
            icon: Icon(Icons.location_on),
          ),
          Tab(
            icon: Icon(Icons.search),
          ),
          Tab(
            icon: Icon(Icons.assessment),
          ),
        ],
        controller: _tabController,
      ),
      body: TabBarView(
        children: [
          MapsScreen(),
          SearchScreen(),
          DateRangeScreen(),
        ],
        controller: _tabController,
      ),
    );
  }
}
