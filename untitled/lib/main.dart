import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Id card ', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            ninjaLevel += 1;
          })
        },
        backgroundColor: Colors.grey[800],
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/img2.png'),
                radius: 40,
              ),
            ),
            Divider(height: 60, color: Colors.grey[800]),
            Text(
              'NAME',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(height: 10),
            Text(
              'Chun Li',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'CURRENT NINJA LEVEL',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            SizedBox(height: 10),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Icon(Icons.email, color: Colors.grey[400]),
                SizedBox(width: 10),
                Text(
                  'chun.li@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
