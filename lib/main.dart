import 'package:flutter/material.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drama Box Copy',
      home: MainScreen(),
    );
  }
}











//import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';

//void main() {
//  runApp(MyApp());
//}

//class Video {
//  final String title;
//  final String url;

//  Video({required this.title, required this.url});
//}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'YouTube Shorts',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(),
//    );
//  }
//}

//class MyHomePage extends StatelessWidget {
//  final List<Video> videos = [
//    Video(
//        title: 'Awesome Short Video 1',
//        url:
//            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
//    Video(
//        title: 'Amazing Short Video 2',
//        url:
//            'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4'),
//    Video(
//        title: 'Awesome Short Video 1',
//        url:
//            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
//    Video(
//        title: 'Amazing Short Video 2',
//        url:
//            'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
//  ];

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: PageView.builder(
//        scrollDirection: Axis.vertical,
//        itemCount: videos.length,
//        itemBuilder: (context, index) {
//          return VideoPlayerWidget(videoUrl: videos[index].url);
//        },
//      ),
//    );
//  }
//}

//class VideoPlayerWidget extends StatefulWidget {
//  final String videoUrl;

//  VideoPlayerWidget({required this.videoUrl});

//  @override
//  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
//}

//class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//  late VideoPlayerController _controller;

//  @override
//  void initState() {
//    super.initState();
//    _controller = VideoPlayerController.network(widget.videoUrl)
//      ..initialize().then((_) {
//        setState(() {}); // Update the state once video is initialized
//        _controller.play(); // Play the video automatically
//      });
//  }

//  @override
//  Widget build(BuildContext context) {
//    return AspectRatio(
//      aspectRatio: _controller.value.aspectRatio,
//      child: Stack(
//        alignment: Alignment.bottomCenter,
//        children: <Widget>[
//          VideoPlayer(_controller),
//          VideoProgressIndicator(_controller, allowScrubbing: true),
//        ],
//      ),
//    );
//  }

//  @override
//  void dispose() {
//    _controller.dispose();
//    super.dispose();
//  }
//}
