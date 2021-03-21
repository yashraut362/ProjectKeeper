import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  Video({Key key}) : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  List<Map<String, Object>> _list = [
    {
      'id': "2",
      'name': "Angular.Js",
      'videoUrl':
          "https://github.com/barkenikhil02/eth-todo-list/raw/master/Angular_in_100_Seconds(360p).mp4",
    },
  ];
  FlickManager flickManager;
  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          "https://github.com/barkenikhil02/eth-todo-list/raw/master/Angular_in_100_Seconds(360p).mp4"),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Free Tutorials",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext ctx, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    _list[index]['name'],
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 28.0),
                  ),
                ),
                FlickVideoPlayer(flickManager: flickManager),
              ],
            );
          },
        ),
      ),
    );
  }
}
