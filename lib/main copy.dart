import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
        fontFamily: 'KleeOne',
      ),
      home: const MyHomePage(title: 'ToDo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            child: SizedBox(
              height: 200,
              width: 200,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                  children: <Widget>[
                      const Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(bottom: 100),
                        child: Text(
                          'Hello World',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo
                            ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                            width: 200,
                            height: 400,
                            padding: const EdgeInsets.only(top: 30),
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.topCenter,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: const Color.fromARGB(255, 4, 95, 58),
                              ),
                              borderRadius: BorderRadius.circular(10),
                              image: const DecorationImage(
                                image: AssetImage('images/maccha.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: BorderedText(
                              strokeWidth: 2,
                              strokeColor: Colors.white,
                              child: const Text(
                                // textAlign: TextAlign.center,
                                '抹茶',
                                style: TextStyle(
                                color: Color.fromARGB(255, 4, 95, 58),
                                  fontSize: 24,
                                  letterSpacing: 4,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 70),
                            Column(
                              children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    width: 100,
                                    height: 100,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(150, 150, 150, 1),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                      )
                                    ),
                                    child: const Text(
                                      'first row',
                                      style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1)
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    color: const Color.fromRGBO(100, 100, 100, 1),
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'second row',
                                      style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1)
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 100,
                                    height: 100,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(50, 50, 50, 1),
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )
                                    ),
                                    child: const Text(
                                      'third row',
                                      style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: OutlinedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(200, 60),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                    backgroundColor: const Color.fromRGBO(100, 100, 100, 1), //background
                                    foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
                                  ),
                                  onPressed: (){},
                                  child: const Text(
                                    'click',
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              )
                            ],
                            ),
                          // ),
                        ],
                      ),
                      // const SizedBox(
                      //   height: 80,
                      //   width: 500,
                      //   child: Card(
                      //     child: ListTile(
                      //       leading: Image(image: AssetImage('images/icon.jpg')),
                      //       title: Text('Card and ListTile'),
                      //       subtitle: Text('subtitle'),
                      //       trailing: Icon(Icons.more_vert),
                      //     ),
                      //   ),
                      // ),
                      // Flexible(
                      //     child: ListView.builder(
                      //       itemCount: listItems.length,
                      //       itemBuilder: (context, index){
                      //         return Center(
                      //           child: Text(listItems[index]),
                      //         );
                      //       },
                      //     ),
                      //   ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

final listItems = [
  '1. Dummy text',
  '2. Dummy text',
  '3. Dummy text',
  '4. Dummy text',
  '5. Dummy text',
];
