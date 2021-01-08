import 'package:flutter/material.dart';
import 'package:vimeoplayer/vimeoplayer.dart';
import 'package:wakelock/wakelock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //primarySwatch: Colors.red,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey,
      ),
      home: LandingScreen(),
    );
  }
}

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Play Video'),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctxt) => VideoScreen()));
          },
        ),
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    Wakelock.enable();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          VimeoPlayer(
            id: '491722139',
            autoPlay: true,
            fullScreenBackgroundColor: Colors.black,
            commencingOverlay: true,
            //overlayTimeOut: 4,
            loadingIndicatorColor: Colors.purple,
            controlsColor: Colors.white,
          ),
          //YouVimPlayer('vimeo', '491722139'),
        ],
      ),
      // body: Center(
      //   child: Text('Hello World'),
      // ),
    );
  }
}
