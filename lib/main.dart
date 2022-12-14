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
        // primarySwatch: Colors.green,
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
      home: const MyHomePage(title: 'sample'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView.builder(
          itemCount: listItems.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(listItems[index]),
            );
          },
        ),
      ),
      appBar: AppBar(
        toolbarHeight: 60,
        title: Column(children: const <Widget>[
          Text('カフェラテ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text('Cafe Latte',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ]),
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
        ],
        backgroundColor: const Color.fromARGB(255, 35, 103, 1),
      ),
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: double.infinity,
                  //   height: 100,
                  //   margin: const EdgeInsets.only(top: 10),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(150, 150, 150, 1),
                  //   ),
                  //   child: const Text(
                  //     'full x 100',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: double.infinity,
                  //   height: 200,
                  //   margin: const EdgeInsets.only(top: 10),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(150, 150, 150, 1),
                  //   ),
                  //   child: const Text(
                  //     'full x 200',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: double.infinity,
                  //   height: 300,
                  //   margin: const EdgeInsets.only(top: 10),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(150, 150, 150, 1),
                  //   ),
                  //   child: const Text(
                  //     'full x 300',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: double.infinity,
                  //   height: 400,
                  //   margin: const EdgeInsets.only(top: 10),
                  //   decoration: const BoxDecoration(
                  //     color: Color.fromRGBO(150, 150, 150, 1),
                  //   ),
                  //   child: const Text(
                  //     'full x 400',
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
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
                            // child: Padding(
                            //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*(0.01)),
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
                                    const SizedBox(
                                      width: double.infinity,
                                      child: Card(
                                        child: ListTile(
                                          title: Text(
                                            '抹茶ホワイトラテ',
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromARGB(255, 12, 88, 45),
                                            ),
                                          ),
                                          subtitle: Text(
                                            'matcha white latte',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          trailing: Icon(Icons.more_vert),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5, top: 20),
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
                      // ),
                    ],
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

final listItems = [
  '1. Dummy text',
  '2. Dummy text',
  '3. Dummy text',
  '4. Dummy text',
  '5. Dummy text',
];
