import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../utils.dart';

class ForYouScreen extends StatefulWidget {
  final List<String> videoAssets;

  const ForYouScreen({Key? key, required this.videoAssets}) : super(key: key);

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  late List<VideoPlayerController> _videoControllers;
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController(initialPage: _currentIndex);
    _videoControllers = List.generate(
      widget.videoAssets.length,
      (index) {
        final controller =
            VideoPlayerController.asset(widget.videoAssets[index]);
        controller.addListener(_onControllerUpdated);
        controller.initialize().then((_) {
          setState(() {});

          if (index == _currentIndex) controller.play();
        });
        return controller;
      },
    );
  }

  void _onControllerUpdated() {
    setState(() {});
    final controller = _videoControllers[_currentIndex];
    if (controller.value.position >= controller.value.duration) {
      controller.seekTo(Duration.zero);
      controller.play();
    }
  }

  void _togglePlayPause() {
    final controller = _videoControllers[_currentIndex];
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: _togglePlayPause,
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: _videoControllers.length,
          onPageChanged: (index) {
            _videoControllers[_currentIndex].pause();
            setState(() {
              _currentIndex = index;
            });
            _videoControllers[_currentIndex].play();
          },
          itemBuilder: (context, index) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: _videoControllers[index].value.aspectRatio,
                  child: VideoPlayer(_videoControllers[index]),
                ),
                Positioned(
                  bottom: 500,
                  right: 8,
                  child: IconButton(
                    icon: Icon(
                      Icons.list,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      _showBottomModalSheet(context);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  //Widget _buildVideoPlayer(int index) {
  //  final VideoPlayerController controller = _videoControllers[index];
  //  final double aspectRatio = controller.value.aspectRatio;
  //  log('${aspectRatio}   + ${index++}');
  //  if (aspectRatio > 0.9) {
  //    return RotatedBox(
  //      quarterTurns: 1,
  //      child: AspectRatio(
  //        aspectRatio: 16 / 9,
  //        child: VideoPlayer(controller),
  //      ),
  //    );
  //  } else {
  //    return AspectRatio(
  //      aspectRatio: 9 / 16,
  //      child: VideoPlayer(controller),
  //    );
  //  }
  //}

  void _showBottomModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Utils.primaryColor,
          height: MediaQuery.of(context).size.height * 0.6,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: 50,
            itemBuilder: (context, index) {
              if (index >= 8) {
                return _buildLockCard();
              } else {
                return Card(
                  child: Container(
                    width: 70,
                    height: 50,
                    child: Center(
                      child: Text('$index'),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildLockCard() {
    return Card(
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 50,
            child: Center(
              child: Text('Locked'),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Icon(Icons.lock),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    for (var controller in _videoControllers) {
      controller.removeListener(_onControllerUpdated);
      controller.dispose();
    }
    super.dispose();
  }
}






/* for videoUrl  */
// @override
//  void initState() {
//    super.initState();
//    _currentIndex = 0;
//    _pageController = PageController(initialPage: _currentIndex);
//    _videoControllers = List.generate(
//      widget.videoUrls.length,
//      (index) {
//        final controller =
//            VideoPlayerController.network(widget.videoUrls[index]);
//        controller.addListener(_onControllerUpdated);
//        controller.initialize().then((_) {
//          setState(() {});

//          if (index == _currentIndex) controller.play();
//        });
//        return controller;
//      },
//    );
//  }

//  void _onControllerUpdated() {
//    setState(() {});
//  }

//  void _togglePlayPause() {
//    final controller = _videoControllers[_currentIndex];
//    if (controller.value.isPlaying) {
//      controller.pause();
//    } else {
//      controller.play();
//    }
//  }


  //Widget _buildVideoPlayer(int index) {
  //  return Column(
  //    crossAxisAlignment: CrossAxisAlignment.start,
  //    children: [
  //      SizedBox(
  //        width: MediaQuery.of(context).size.width,
  //        height: MediaQuery.of(context).size.width * 1.75,
  //        child: Padding(
  //          padding: const EdgeInsets.only(bottom: 20.0),
  //          child: Stack(
  //            alignment: Alignment.center,
  //            children: [
  //              Chewie(
  //                controller: _chewieControllers[index],
  //              ),
  //              Positioned(
  //                bottom: 200,
  //                right: 8,
  //                child: IconButton(
  //                  icon: Icon(
  //                    Icons.list,
  //                    color: Colors.white,
  //                    size: 30,
  //                  ),
  //                  onPressed: () {
  //                    _showBottomModalSheet(context);
  //                  },
  //                ),
  //              ),
  //            ],
  //          ),
  //        ),
  //      ),
  //    ],
  //  );
  //}

  //void _showBottomModalSheet(BuildContext context) {
  //  showModalBottomSheet(
  //    context: context,
  //    builder: (BuildContext context) {
  //      return Container(
  //        color: Utils.primaryColor,
  //        height: MediaQuery.of(context).size.height * 0.6,
  //        child: GridView.builder(
  //          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //            crossAxisCount: 5,
  //            crossAxisSpacing: 5.0,
  //            mainAxisSpacing: 5.0,
  //          ),
  //          itemCount: 50,
  //          itemBuilder: (context, index) {
  //            if (index >= 8) {
  //              return _buildLockCard();
  //            } else {
  //              return Card(
  //                child: Container(
  //                  width: 70,
  //                  height: 50,
  //                  child: Center(
  //                    child: Text('$index'),
  //                  ),
  //                ),
  //              );
  //            }
  //          },
  //        ),
  //      );
  //    },
  //  );
  //}

  //Widget _buildLockCard() {
  //  return Card(
  //    child: Stack(
  //      children: [
  //        Container(
  //          width: 70,
  //          height: 50,
  //          child: Center(
  //            child: Text('Locked'),
  //          ),
  //        ),
  //        Positioned(
  //          top: 0,
  //          right: 0,
  //          child: Icon(Icons.lock),
  //        ),
  //      ],
  //    ),
  //  );
  //}

