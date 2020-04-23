import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_proto/login_page.dart';

void main() {
  runApp(MaterialApp(
    home : LoginPage(),
    routes:{
      '/home':(BuildContext context) => MyApp(),
      '/login':(BuildContext context) => LoginPage(),
    }
  ));
}


final ThemeData _themeData = new ThemeData(   //sets app color theme
  brightness: Brightness.dark,
  primarySwatch: Colors.purple,
  accentColor: Colors.purpleAccent,
);

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AudioPlayer _player;
  String value ="log_in";     //This variable value is used to determine user signed in or not
                              //Will take the username returned from login page

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setUrl(
        "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/mp3s/plasticlove.mp3");  //mp3 url here
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _themeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Radio App Demo'),

          actions: <Widget>[
            new Text("$value"),
          ],
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/art/plasticlove.png',  //cover art for song
              ),
              SizedBox(height: 10),
              Text("Plastic Love - Mariya Takeuchi [ENG]"), //song title
              Text("Cover by Caitlin Myers"), //song artist
              StreamBuilder<FullAudioPlaybackState>(
                stream: _player.fullPlaybackStateStream,
                builder: (context, snapshot) {
                  final fullState = snapshot.data;
                  final state = fullState?.state;
                  final buffering = fullState?.buffering;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (state == AudioPlaybackState.connecting ||
                          buffering == true)
                        Container(
                          margin: EdgeInsets.all(8.0),
                          width: 64.0,
                          height: 64.0,
                          child: CircularProgressIndicator(),
                        )
                      else if (state == AudioPlaybackState.playing)
                        IconButton(
                          icon: Icon(Icons.pause),
                          iconSize: 64.0,
                          onPressed: _player.pause,
                        )
                      else
                        IconButton(
                          icon: Icon(Icons.play_arrow),
                          iconSize: 64.0,
                          onPressed: _player.play,
                        ),
                      IconButton(
                        icon: Icon(Icons.stop),
                        iconSize: 64.0,
                        onPressed: state == AudioPlaybackState.stopped ||
                            state == AudioPlaybackState.none
                            ? null
                            : _player.stop,
                      ),
                    ],
                  );
                },
              ),
              Text("Track position"),
              StreamBuilder<Duration>(
                stream: _player.durationStream,
                builder: (context, snapshot) {
                  final duration = snapshot.data ?? Duration.zero;
                  return StreamBuilder<Duration>(
                    stream: _player.getPositionStream(),
                    builder: (context, snapshot) {
                      var position = snapshot.data ?? Duration.zero;
                      if (position > duration) {
                        position = duration;
                      }
                      return SeekBar(
                        duration: duration,
                        position: position,
                        onChangeEnd: (newPosition) {
                          _player.seek(newPosition);
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeekBar extends StatefulWidget {
  final Duration duration;
  final Duration position;
  final ValueChanged<Duration> onChanged;
  final ValueChanged<Duration> onChangeEnd;

  SeekBar({
    @required this.duration,
    @required this.position,
    this.onChanged,
    this.onChangeEnd,
  });

  @override
  _SeekBarState createState() => _SeekBarState();
}

class _SeekBarState extends State<SeekBar> {
  double _dragValue;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0.0,
      max: widget.duration.inMilliseconds.toDouble(),
      value: _dragValue ?? widget.position.inMilliseconds.toDouble(),
      onChanged: (value) {
        setState(() {
          _dragValue = value;
        });
        if (widget.onChanged != null) {
          widget.onChanged(Duration(milliseconds: value.round()));
        }
      },
      onChangeEnd: (value) {
        _dragValue = null;
        if (widget.onChangeEnd != null) {
          widget.onChangeEnd(Duration(milliseconds: value.round()));
        }
      },
    );
  }
}