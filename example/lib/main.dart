import 'package:awesome_route/animate_awesome_route.dart';
import 'package:awesome_route/awesome_route.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AwesomeRoute Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AwesomeRoute Navigation Demo'),
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
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const HomePage(),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class AwesomeRouteDetail extends StatelessWidget {
  const AwesomeRouteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: AwesomeRoute.pop(context),//call the routex pop to go back
        title: const Text("Routex Navigation Demo"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                child: const Text("Welcome"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                child: const Text("Welcome"),
              ),
              AwesomeRoute.push(
                context: context, 
                page: const AwesomeRouteDetail(), 
                child: const Text("Push me and still come back",
                style: TextStyle(
                  color: Colors.white,
                ),),
                animationType: AnimateAwesomeRoute.fade,//optional
                duration: const Duration(seconds: 1),//optional
                backgroundColor: Colors.black12,//optional
                borderRadius: 10.0,//optional
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),//optional
              ),
              const SizedBox(height: 20.0),
              AwesomeRoute.pushAndClear(
                context: context, 
                page: const AwesomeRouteDetail(), 
                child: const Text("Push me and this page history will be removed",
                style: TextStyle(
                  color: Colors.white,
                ),),
                animationType: AnimateAwesomeRoute.translateRightToLeft,//optional
                duration: const Duration(seconds: 1),//optional
                backgroundColor:const Color.fromARGB(255, 23, 55, 25),//optional
                borderRadius: 10.0,//optional
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),//optional
              ),
            const SizedBox(height: 20.0),
              AwesomeRoute.pushAndClearAll(
                context: context, 
                page: const AwesomeRouteDetail(), 
                child: const Text("Push me and all page history will be removed",
                style: TextStyle(
                  color: Colors.white,
                ),),
                animationType: AnimateAwesomeRoute.opacityAndSlideFromDown,//optional
                duration: const Duration(seconds: 1),//optional
                backgroundColor:const Color.fromARGB(66, 65, 27, 27),//optional
                borderRadius: 10.0,//optional
                padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),//optional
              ),

              ///check the documentation to implement the rest
            ],
          ),
        ),
      ),
    );
  }
}
