import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
      majorCity: 'Kampala',
      country: 'Uganda',
      continent: 'Africa',
    );
    await instance.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: {
        'time': instance.time,
        'location': instance.country,
        'continent': instance.continent,
        'isDay': instance.isDay,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitFadingCircle(color: Colors.blue[900], size: 80.0),
        ),
      ),
    );
  }
}
