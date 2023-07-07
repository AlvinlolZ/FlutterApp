import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:sense2quit/widgets/line_chart.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  int numberSmoked = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: signOut,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 40,
              child: Row(
                children: [
                  Icon(Icons.smoking_rooms_sharp, size: 60,),
                  Text(numberSmoked.toString(), style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ],
              )),
          Container(height: 20, child: SizedBox(height: 12.0)),
          Container(
            margin: EdgeInsets.all(2),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              color: Color.fromARGB(255, 14, 5, 40),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: AspectRatio(
                  aspectRatio: 1.70,
                  child: line_chart(),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(
            () {
              numberSmoked += 1;
            },
          );
        },
        child: Icon(Icons.smoking_rooms_rounded),
      ),
    );
  }
}
