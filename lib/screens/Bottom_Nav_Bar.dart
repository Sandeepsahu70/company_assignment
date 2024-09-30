import 'package:company_app/screens/image_screen.dart';
import 'package:company_app/screens/text_screen.dart';
import 'package:company_app/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
  int _selectedindex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener((){
      setState(() {
        _selectedindex = _tabController.index;
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.cyanAccent.shade100,
          title:Center(child: Text('Company App')),),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(padding: const EdgeInsets.all(16.0),
        child: GNav(
          backgroundColor: Colors.white,
          color: Colors.grey,
          activeColor: Colors.yellow,
          tabBackgroundColor: Colors.grey,
          padding: EdgeInsets.all(10.0),
          gap: 14,
          tabs: [
            GButton(icon: Icons.textsms_outlined,text: 'Text',),
            GButton(icon: Icons.image_outlined,text: 'Image',),
            GButton(icon: Icons.video_camera_back_outlined,text: 'Video',)
          ],
         selectedIndex: _selectedindex,
          onTabChange: (index){
            _tabController.index = index;
          },
        )
        ),
      ),
      body: TabBarView(
        controller: _tabController,
          children: [
            TextScreen(),
            ImageScreen(),
            VideoScreen(),
      ]),
    );
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
