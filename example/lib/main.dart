import 'package:awesome_route/animate_awesome_route.dart';
import 'package:awesome_route/awesome_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() async {
  await AwesomePagesRoute.routes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class AwesomeRouteDetail extends StatelessWidget {
  const AwesomeRouteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AwesomeRoute.pop(context), //call the routex pop to go back
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
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

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = AwesomeArguments.of(context)?.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("AwesomeRoute ${arguments?['pageName']} Page"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Text("Hello ${arguments?['name']}"),
                const SizedBox(height: 20),
                AwesomeRoute.pushRoute(
                  context: context,
                  route: () => AwesomeRoute.go(
                    context,
                    "/home",
                    animations: AnimateAwesomeRoute.scaleAndRotate,
                  ),
                  child: const Text("Go Back Home"),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// declare the page class
class AwesomePagesRoute {
  static Future<void> routes() async {
    AwesomeRoute(pages: {
      // about page
      "/about": (context, arguments) => AwesomeArguments(
            arguments: arguments ?? {},
            page: const About(),
          ),

      // home page
      "/home": (context, arguments) {
        return const AwesomeArguments(
          page: HomePage(),
        );
      },
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text("AwesomeRoute Navigation Demo"),
         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              AwesomeRoute.pushRoute(
                context: context,
                route: () => AwesomeRoute.go(context, 
                "/about",
                animations: AnimateAwesomeRoute.rotateY,
                arguments: {"name": "Jon Doe", "pageName":"About"},
                ),
                child: const Text("About Page"),
              ),
              const SizedBox(height: 20),
              AwesomeRoute.push(
                context: context,
                page: const AwesomeRouteDetail(),
                child: const Text(
                  "Push me and still come back",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                animationType: AnimateAwesomeRoute.fade, //optional
                duration: const Duration(seconds: 1), //optional
                backgroundColor: Colors.black12, //optional
                borderRadius: 10.0, //optional
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0), //optional
              ),
              const SizedBox(height: 20.0),
              AwesomeRoute.pushAndClear(
                context: context,
                page: const AwesomeRouteDetail(),
                child: const Text(
                  "Push me and this page history will be removed",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                animationType:
                    AnimateAwesomeRoute.translateRightToLeft, //optional
                duration: const Duration(seconds: 1), //optional
                backgroundColor:
                    const Color.fromARGB(255, 23, 55, 25), //optional
                borderRadius: 10.0, //optional
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0), //optional
              ),
              const SizedBox(height: 20.0),
              AwesomeRoute.pushAndClearAll(
                context: context,
                page: const AwesomeRouteDetail(),
                child: const Text(
                  "Push me and all page history will be removed",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                animationType:
                    AnimateAwesomeRoute.opacityAndSlideFromDown, //optional
                duration: const Duration(seconds: 1), //optional
                backgroundColor:
                    const Color.fromARGB(66, 65, 27, 27), //optional
                borderRadius: 10.0, //optional
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0), //optional
              ),

              ///check the documentation to implement the rest
            ],
          ),
        ),
      ),
    );
  }
}
