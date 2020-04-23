import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:radio_proto/songClass.dart';

void main() => runApp(MyApp());

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
  Song song1 = new Song.constructor("Plastic Love - Mariya Takeuchi [ENG]", "Cover by Caitlin Myers", "https://en.wikipedia.org/wiki/Plastic_Love", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/mp3s/plasticlove.mp3", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/art/plasticlove.png", "Pop");
  Song song2 = new Song.constructor("A-Piano-Waltz", "WeeksExpedition", "infolink", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/mp3s/A-Piano-Waltz.mp3", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/art/PianoWaltz.jpg", "Classical");
  Song song3 = new Song.constructor("Old King Cole", "WeeksExpedition", "infolink", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/mp3s/Old%20King%20Cole.mp3", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/art/OldKingCole.png", "Country");
  Song song4 = new Song.constructor("Shop", "WeeksExpedition", "infolink", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/mp3s/Shop-Ocarina_of_Time.mp3", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/art/Shop.png", "Tango");
  Song song5 = new Song.constructor("Redwood", "WeeksExpedition", "infolink", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/mp3s/Redwood.mp3", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/art/RedWood.png", "Jazz");
  Song song6 = new Song.constructor("Midna-s_Lament", "WeeksExpedition", "infolink", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/mp3s/Midna-s_Lament.mp3", "https://raw.githubusercontent.com/letoastylenny/radioapp/master/assets/art/Midna-s_Lament.jpg", "Tango");
  
  List<Song> _songList = new List<Song>();
  int _songQueue = 0;

  @override
  void initState() {
    super.initState();
    _songList.add(song1);
    _songList.add(song2);
    _songList.add(song3);
    _player = AudioPlayer();
    _player.setUrl(_songList[_songQueue].songMP3);  //mp3 url here
  }

  /*
  This function advances to the next song in the song list.
   */
  void nextSong() {
    setState(() {
      if (_songQueue < _songList.length - 1){ //while there is a next song to queue
        _player.stop();
        _songQueue++;
        _player.setUrl(_songList[_songQueue].songMP3);  //next mp3 url here
      } else {  //if reached the end of the song list, loop back to the beginning
        _player.stop();
        _songQueue = 0;
        _player.setUrl(_songList[_songQueue].songMP3);
      }
    });
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
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                _songList[_songQueue].songArt,  //cover art for song
              ),
              SizedBox(height: 10),
              Text(_songList[_songQueue].songTitle), //song title
              Text(_songList[_songQueue].songArtist), //song artist
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
                      IconButton(
                        icon: Icon(Icons.arrow_forward),
                        iconSize: 64.0,
                        onPressed: () {
                          nextSong();
                        }
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
