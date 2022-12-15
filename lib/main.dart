import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:universal_platform/universal_platform.dart';
// import 'package:bordered_text/bordered_text.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: const Color.fromARGB(100, 35, 103, 1),
        useMaterial3: true,
        fontFamily: 'KleeOne',
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.red),
        backgroundColor: const Color.fromARGB(255, 35, 103, 1),
        toolbarHeight: 60,
        title: Column(
          children: const <Widget>[
          // Text('カフェラテ',
          //   style: TextStyle(
          //     fontSize: 20,
          //   ),
          // ),
          // Text('Cafe Latte',
          //   style: TextStyle(
          //     fontSize: 10,
          //   ),
          // ),
          Text(
            'ToDo',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ]
        ),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
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
                children: const <Widget>[
                  // _Header(),
                  // _Body(),
                  // _Bottom(),
                  _Latte(),
                  _Todo(),
                ],
              ),
            ),
        ),
      ),
    );
  }
}

final menuList = [
  '1. Dummy text',
  '2. Dummy text',
  '3. Dummy text',
  '4. Dummy text',
  '5. Dummy text',
];

class _Latte extends StatelessWidget {
  const _Latte({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool selected = false;
    return Column(
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
                              icon: const Icon(Icons.settings_outlined),
                              iconSize: 22,
                              onPressed: () {
                                setState(() {
                                  selected = !selected;
                                });
                              },
                              // isSelected: selected,
                              // selectedIcon: const Icon(Icons.settings),
                              // color: selected
                              //   // ignore: dead_code
                              //   ? Colors.white
                              //   : Colors.grey,
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
      ],
    );
  }
  void setState(Null Function() selected) {}
}

class _Todo extends StatelessWidget {
  const _Todo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}

// class _Header extends StatelessWidget {
//   const _Header({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class _Body extends StatelessWidget {
//   const _Body({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class _Bottom extends StatelessWidget {
//   const _Bottom({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
