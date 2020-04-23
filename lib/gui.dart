import 'package:flutter/material.dart';
import 'package:radio_proto/main.dart';
import 'package:flutter/services.dart';

//----------------------------------------------
//Gui Driver
//----------------------------------------------
class ChannelSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select a Channel", style: TextStyle(fontSize: 30)),
          backgroundColor: Colors.purple,
          centerTitle: true,),
        body: MyChannel(),
        backgroundColor: Colors.white30,
    );
  }
}

//-------------------------------------------------
//Gui Layout
//-------------------------------------------------
class MyChannel extends StatelessWidget {
  MyChannel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([     //forces portrait Orientation
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: viewportConstraints.maxWidth,
              minHeight: viewportConstraints.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 30),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute( //navigation
                        builder: (context) => MyApp(
                          genre: "Jazz",
                        )
                    )),
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Jazz', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),

                  ),
                ),

                const SizedBox(height: 30),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute( //navigation
                        builder: (context) => MyApp(
                          genre: "Tango",
                        )
                    )),
                  },

                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Tango', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ),
                ),

                const SizedBox(height: 30),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute( //navigation
                        builder: (context) => MyApp(
                          genre: "Classical",
                        )
                    )),
                  },

                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Classical', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ),
                ),

                const SizedBox(height: 30),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute( //navigation
                        builder: (context) => MyApp(
                          genre: "Pop",
                        )
                    )),
                  },

                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Pop', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ),
                ),

                const SizedBox(height: 30),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute( //navigation
                        builder: (context) => MyApp(
                          genre: "Country",
                        )
                    )),
                  },

                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Country', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ),
                ),

                const SizedBox(height: 30),
                FlatButton(
                  onPressed: () => {
                    Navigator.push(context, MaterialPageRoute( //navigation
                        builder: (context) => MyApp(
                          genre: "Hiphop",
                        )
                    )),
                  },

                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 150,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                          Color(0xFF673AB7),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: const Text('Hip Hop', style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
                  ),
                ),

              ],

            ),
          ),
        );
      },
    );
  }
}
//---------------------------------------------
