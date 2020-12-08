import 'package:flutter/material.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSwitched = true;
  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive UI'),
      ),
      body: isPortrait
          ? Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Switch(
                        value: _isSwitched,
                        onChanged: (bool value) {
                          setState(
                            () {
                              _isSwitched = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Container(
                    height: size.height * 0.5,
                    color: Colors.amberAccent,
                    margin: EdgeInsets.all(20.0),
                  ),
                  Container(
                    height: size.height * 0.2,
                    color: Colors.amberAccent,
                    margin: EdgeInsets.all(20.0),
                  ),
                ],
              ),
            )
          : Container(
              child: Row(
                children: [
                  Container(width: 300, color: Colors.red),
                  Container(width: 300, color: Colors.purple),
                ],
              ),
            ),
    );
  }
}
