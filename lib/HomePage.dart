import 'package:assignment4/CardWidget.dart';
import 'package:assignment4/CardWidget2.dart';
import 'package:assignment4/CardWidget3.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          title: const Text(
            'My Home',
            style: TextStyle(color: Colors.black),
          ),
        ),
    
        body: Column(children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: const TabBar(
              indicatorPadding: EdgeInsets.all(10),
              labelPadding: EdgeInsets.only(
                left:5, right: 5, top: 10, bottom: 10
              ),
              labelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Colors.grey,

              tabs: [
                Text('All'),
                Text('Living Room'),
                Text('BedRoom'),
                Icon(Icons.keyboard_control_outlined)
            ]),
          )
  
        ,const Expanded(
          child: TabBarView(
            children: [
              CardWidget1(),
              CardWidget2(),
              CardWidget3(),
            ]),
        ),
        ],),
        bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home, color: Colors.grey), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.heat_pump, color: Colors.grey), label: 'Scene'),
          NavigationDestination(icon: Icon(Icons.add_box, color: Colors.blue,size: 40,), label: ''),
          NavigationDestination(icon: Icon(Icons.message, color: Colors.grey), label: 'Message'),
          NavigationDestination(icon: Icon(Icons.person, color: Colors.grey), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
      ),
    );
  }
}
