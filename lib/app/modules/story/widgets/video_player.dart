import 'package:case_study/app/modules/story/story_package/story.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../story_package/story.dart';


/// Stateful widget to fetch and then display video content.
class VideoPlayerWidget extends StatefulWidget {
  VideoPlayerWidget({
    super.key,
    required this.videoURL,
    required this.indicatorAnimationController,
  });
  String videoURL;
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController; 

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.asset(widget.videoURL)
      ..initialize().then((_) {
        controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  bool _buttonPressed = false;
  bool _loopActive = false;

  void _increaseCounterWhilePressed() async {
    // make sure that only one loop is active
    if (_loopActive) return;

    _loopActive = true;

    while (_buttonPressed) {
      // do your thing
      setState(() {
        widget.indicatorAnimationController.value = IndicatorAnimationCommand.pause;
        controller.pause();
      });

      // wait a bit
      await Future.delayed(const Duration(milliseconds: 200));
    }

    _loopActive = false;
    widget.indicatorAnimationController.value = IndicatorAnimationCommand.resume;
    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: controller.value.isInitialized
              ? 
              Center(
                child: Listener(
                  onPointerDown: (details) {
                    _buttonPressed = true;
                    _increaseCounterWhilePressed();
                  },
                  onPointerUp: (details) {
                    _buttonPressed = false;
                  },
                  child:
                  //---------
                  AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                  //---------
                )
              )
              : Container(
                  color: Colors.black,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
