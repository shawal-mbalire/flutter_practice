import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =
        data.isNotEmpty
            ? data
            : ModalRoute.of(context)!.settings.arguments as Map;
    String bgImage = data['isDay'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDay'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(
            child: Column(
              children: [
                TextButton.icon(
                  icon: Icon(Icons.edit_location, size: 20),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                      context,
                      '/location',
                    );
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDay': result['isDay'],
                        'continent': result['continent'],
                      };
                    });
                  },
                  label: Text('Edit Location', style: TextStyle(fontSize: 20)),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'].toString().toUpperCase(),
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      data['continent'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
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
