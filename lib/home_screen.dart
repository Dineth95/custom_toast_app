import 'package:custom_toast_flutter_app/pages/home_page.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Homepage(),
          Center(
            child: Text("search content"),
          ),
          Center(
            child: Text("favourite content"),
          ),
          Center(
            child: Text("my profile"),
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        padding: const EdgeInsets.only(bottom: 10),
        
        controller: _tabController,
        tabs: <Widget>[
          const Tab(
            icon: Icon(Icons.home,color: Colors.grey,),
          ),
          const Tab(
            icon: Icon(Icons.search,color: Colors.grey,),
          ),
          const Tab(
            icon: Icon(Icons.favorite_outline,color: Colors.grey,),
          ),
          Tab(
            child: CircleAvatar(
                radius: 12,
                child: Image.network(
                    "https://play-lh.googleusercontent.com/97SBxbD2bNm201fHNM440s71k2jmaYPuJrQVBHZuFu81Cr83VWrXei_SZuaR2jIbReY"
                    ,fit: BoxFit.fill,
                    )),
          )
        ],
      ),
    );
  }
}
