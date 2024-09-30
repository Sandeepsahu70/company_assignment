import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../widgets/dynamic_link.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayer;
  // String url = "https://www.pexels.com/video/aerial-view-of-a-train-traveling-along-a-mountain-pass-28180180/";
  // String url = "https://www.pexels.com/video/aerial-view-of-a-train-traveling-along-a-mountain-pass-28180180/";
  @override
  void initState() {
    _controller = VideoPlayerController.asset('assets/video/12319997_3840_2160_60fps.mp4');
    // _controller = VideoPlayerController.networkUrl(Uri.parse(url));
    _initializeVideoPlayer = _controller.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
              future: _initializeVideoPlayer,
              builder: (context,snapshot){

                if( snapshot.connectionState == ConnectionState.done){
                   return AspectRatio(aspectRatio: _controller.value.aspectRatio,
                   child: Center(
                     child: VideoPlayer(_controller),
                   ),
                   );
                }
                else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },

              ),
          SizedBox(height: 10,),
          Container(
            width: 400,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87
                ),
              onPressed: () {
                // Call setState to update the UI when the button is pressed
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                  } else {
                    _controller.play();
                  }
                });
              },
              child: Icon(_controller.value.isPlaying ? Icons.pause:Icons.play_arrow,size: 50,),),
          ),
          Container(
            width: 300,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple
                ),
                onPressed: (){
                  DynamicLinkProvider()
                      .createLink("rniX") // Pass your referral code here
                      .then((generatedLink) {
                    Share.share(generatedLink);
                  })
                      .catchError((error) {
                    print("Error generating dynamic link: $error");
                  });
                },
                child: Text(' Click for link ', style: TextStyle(fontSize: 16,color: Colors.white),)),
          )

        ],
      ),

    );
  }
}
