import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;
  List<WorldTime> locations = [
    WorldTime(continent: 'Europe', majorCity: 'London', country: 'uk'),
    WorldTime(continent: 'Europe', majorCity: 'Berlin', country: 'greece'),
    WorldTime(continent: 'Africa', majorCity: 'Cairo', country: 'egypt'),
    WorldTime(continent: 'Africa', majorCity: 'Nairobi', country: 'kenya'),
    WorldTime(continent: 'America', majorCity: 'Chicago', country: 'usa'),
    WorldTime(continent: 'America', majorCity: 'New York', country: 'usa'),
    WorldTime(continent: 'Asia', majorCity: 'Seoul', country: 'south_korea'),
    WorldTime(continent: 'Asia', majorCity: 'Jakarta', country: 'indonesia'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.country,
      'time': instance.time,
      'isDay': instance.isDay,
      'continent': instance.continent,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locations[index].majorCity),
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/${locations[index].country}.png',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
