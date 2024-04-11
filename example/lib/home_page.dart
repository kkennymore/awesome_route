
import 'package:awesome_route/animate_awesome_route.dart';
import 'package:awesome_route/awesome_route.dart';
import 'package:example/awesome_route_detail.dart';
import 'package:flutter/material.dart';

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