import 'package:awesome_route/awesome_route.dart';
import 'package:flutter/material.dart';

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