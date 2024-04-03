import 'package:flutter/material.dart';
import 'package:mausam_app/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void startApp() async {
    worker instance = worker(location: 'Mumbai');
    await instance.getData();
    print(instance.air_speed);
  }

  @override
  void initState() {
    startApp();
    super.initState();
    // instance.getData();
    // print(instance.temp);
    // print(instance.humidity);
    // print(instance.air_speed);
    // print(instance.description);
    // print(instance.main);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(Icons.add_to_home_screen), // Icon to go back home pag
          ),
        ],
      ),
    ));
  }
}
