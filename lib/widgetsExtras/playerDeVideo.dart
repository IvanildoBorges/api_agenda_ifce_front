import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class PlayerDeVideo extends StatefulWidget {
  final VideoPlayerController controller;
  final bool looping;
  final autoPlay;
  
  PlayerDeVideo({
    required this.controller,
    required this.looping,
    required this.autoPlay,
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return PlayerDeVideoState();
  }
}

class PlayerDeVideoState extends State<PlayerDeVideo> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    _chewieController = ChewieController(
      videoPlayerController: widget.controller,
      aspectRatio: 16/9,
      autoInitialize: true,
      materialProgressColors: ChewieProgressColors(
        handleColor: Colors.red,
        backgroundColor: Colors.green,
        bufferedColor: Colors.lightGreenAccent
      ),
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      allowMuting: false,
      allowPlaybackSpeedChanging: true,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(errorMessage, style: TextStyle(color: Colors.white),),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: _chewieController != null
      ?
      Column(
        children: [
          Container(
            height: 220,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ],
      )
      :
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          CircularProgressIndicator(
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
          SizedBox(height: 20),
          Text("Loading"),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    widget.controller.dispose();
    _chewieController.dispose();
    _chewieController.pause();
  }
}
