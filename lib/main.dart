// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:universal_platform/universal_platform.dart';
// import 'package:bordered_text/bordered_text.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/ToDo':(BuildContext context) => _Todo(),
        '/Latte':(BuildContext context) => const Latte(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // primaryColor: const Color.fromARGB(255, 35, 103, 1),
        colorSchemeSeed: const Color.fromARGB(255, 35, 103, 1),
        useMaterial3: true,
        fontFamily: 'KleeOne',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 35, 103, 1),
          foregroundColor: Colors.white,
        )
      ),
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1920,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(2460, name: '4K'),
        ],
      ),
      home: const TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

// global変数
final menuList = [
  'JavaScript',
  'Java',
  'Python',
  'PHP',
  'C++',
];
final  List<String> todoList = [];

class _TestPageState extends State<TestPage> {
  final GlobalKey<ScaffoldState>
  scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {scaffoldKey.currentState!.openDrawer();},
          icon: const Icon(Icons.menu_outlined),
          color: Colors.white,
        ),
        toolbarHeight: 60,
        centerTitle: true,
        title: const Text(
          'ToDo',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.search), color: Colors.white,),
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert), color: Colors.white,),
        ],
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: menuList.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(menuList[index]),
            );
          },
        ),
      ),
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // _Header(),
                  // _Body(),
                  // _Bottom(),
                  // _Latte(),
                  _Todo(),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 35, 103, 1),
                      ),
                      onPressed: () => Navigator.of(context).pushNamed("/Latte"),
                      child: const Text(
                        'Latte',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context){
          //     return const TodoAddPage();
          //     }
          //   ),
          // );
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return const TodoAddPage();
            }),
          );
          if (newListText != null){
            setState(() {
              todoList.add(newListText);
            });
          }
        },
        backgroundColor:const Color.fromARGB(255, 35, 103, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

// [setState]を使う場合はcreateStateで宣言しないとエラーが出て使えない
class Latte extends StatefulWidget {
  const Latte({super.key});

  // 使用するStateを指定
  @override
  _LatteState createState() => _LatteState();
}
class _LatteState extends State<Latte> {
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Scaffold(
    body: Center(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
            children: <Widget>[
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                width: double.infinity,
                child: ResponsiveRowColumn(
                  rowMainAxisAlignment: MainAxisAlignment.center,
                  columnCrossAxisAlignment: CrossAxisAlignment.center,
                  columnPadding: const EdgeInsets.only(right: 15, left: 15),
                  rowPadding: const EdgeInsets.only(right: 20, left: 20),
                  layout: ResponsiveWrapper.of(context).isSmallerThan(TABLET)
                    ? ResponsiveRowColumnType.COLUMN
                    : ResponsiveRowColumnType.ROW,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Container(
                        width: ResponsiveValue(
                          context,
                          defaultValue: 350.0,
                          valueWhen: const[
                            Condition.smallerThan(name: TABLET, value: 500.0),
                            Condition.largerThan(name: DESKTOP, value: 600.0),
                          ],
                        ).value,
                        height: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.5,
                            color: const Color.fromARGB(100, 12, 88, 45),
                          ),
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/sample.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const ResponsiveRowColumnItem(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                        width: ResponsiveValue(
                          context,
                          defaultValue: 350.0,
                          valueWhen: const [
                            Condition.smallerThan(name: TABLET, value: 500.0),
                            Condition.largerThan(name: DESKTOP, value: 600.0),
                          ],
                        ).value,
                        height: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.only(bottom: 7, left: 5),
                              child: Text(
                                'TEAVANA™',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 12, 88, 45),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: Card(
                                child: ListTile(
                                  title: const Text(
                                    '抹茶ホワイトラテ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 12, 88, 45),
                                    ),
                                  ),
                                  subtitle: const Text(
                                    'matcha white latte',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  // toggleボタンを実装予定
                                  trailing: IconButton(
                                    icon: const Icon(Icons.free_breakfast),
                                    iconSize: 22,
                                    onPressed: () {
                                      setState(() {
                                        selected = !selected;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 5, top: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    'ほろ苦い抹茶をラテに仕上げ深い味わいに',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'こだわり抜いた抹茶とミルクを合わせた人気のラテ。ほろ苦い抹茶にほどよく甘みをプラスすることで、より深い味わいが楽しめます。',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text('戻る'),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}

// ToDoリスト用のClass
class _Todo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              'やることリスト',
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 35, 103, 1),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    todoList[index],
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ]
    );
  }
}

// リスト追加画面用Widget
class TodoAddPage extends StatefulWidget {
  const TodoAddPage({super.key});

  // 使用するStateを指定
  @override
  _TodoAddPageState createState() => _TodoAddPageState();
}
class _TodoAddPageState extends State<TodoAddPage> {
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 100),
                Text(_text, style: const TextStyle(color: Color.fromARGB(255, 35, 103, 1))),
                SizedBox(
                  width: 400,
                  child: TextField(
                    onChanged: (String value) {
                      setState(() {
                        _text = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 35, 103, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                       // "pop"の引数から前の画面にデータを渡す
                      Navigator.of(context).pop(_text);
                    },
                    icon: const Icon(Icons.touch_app, color: Colors.white,),
                    label: const Text(
                      'リストを追加',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'キャンセルする',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
