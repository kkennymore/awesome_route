import 'package:flutter/material.dart';
import 'package:routex/routex.dart';

class RoutexDetails extends StatelessWidget {
  const RoutexDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: Routex.pop(context),//call the routex pop to go back
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
              )
              
            ],
          ),
        ),
      ),
    );
  }
}