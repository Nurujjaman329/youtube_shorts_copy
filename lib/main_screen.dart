//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:drama_box_copy/screens/home_screen.dart';
//import 'package:drama_box_copy/screens/my_list_screen.dart';
//import 'package:drama_box_copy/screens/new_screen/for_you_screen.dart';
//import 'package:drama_box_copy/screens/profile_screen.dart';
//import 'package:flutter/material.dart';

//class MainScreen extends StatefulWidget {
//  const MainScreen({super.key});

//  @override
//  State<MainScreen> createState() => _MainScreenState();
//}

//class _MainScreenState extends State<MainScreen> {
//  int _currentIndex = 0;
//  final List<Widget> _pages = [
//    HomeScreen(),
//    MyListScreen(),
//    ForYouScreen(
//      videoUrls: [
//        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
//        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//        'https://www.youtube.com/watch?v=lalOy8Mbfdc'
//            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
//        'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
//        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//        'https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8',
//      ],
//    ),
//    ProfileScreen(),
//  ];
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        bottomNavigationBar: _bottomNavigationBar(),
//        backgroundColor: Colors.white,
//        body: _pages[_currentIndex],
//      ),
//    );
//  }

//  Widget _bottomNavigationBar() {
//    return CurvedNavigationBar(
//      backgroundColor: Colors.white,
//      color: Color(0XFF29292B),
//      index: _currentIndex,
//      height: 60.0,
//      items: <Widget>[
//        Icon(
//          Icons.home,
//          color: Colors.white,
//        ),
//        Icon(
//          Icons.save,
//          color: Colors.white,
//        ),
//        Icon(
//          Icons.collections,
//          color: Colors.white,
//        ),
//        Icon(
//          Icons.man,
//          color: Colors.white,
//        ),
//      ],
//      onTap: (index) {
//        setState(() {
//          _currentIndex = index;
//        });
//      },
//    );
//  }
//}

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:drama_box_copy/screens/new_screen/for_you_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/my_list_screen.dart';
import 'screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: [
              HomeScreen(),
              MyListScreen(),
              ForYouScreen(
                videoAssets: [
                  'assets/videos/video_1.mp4',
                  'assets/videos/video_3.mp4',
                  'assets/videos/video_4.mp4',
                  'assets/videos/video_2.mp4',
                  'assets/videos/video_5.mp4',
                  'assets/videos/video_6.mp4',

                  //'https://www.kapwing.com/videos/6603c293bba170c72fe4b412',
                  //'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  //'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
                  //'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
                  //'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  //'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
                  //'https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8',
                ],
              ),
              ProfileScreen(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: CurvedNavigationBar(
              backgroundColor: Colors.white,
              color: Color(0XFF29292B),
              index: _currentIndex,
              height: 60.0,
              items: <Widget>[
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                Icon(
                  Icons.save,
                  color: Colors.white,
                ),
                Icon(
                  Icons.collections,
                  color: Colors.white,
                ),
                Icon(
                  Icons.man,
                  color: Colors.white,
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
