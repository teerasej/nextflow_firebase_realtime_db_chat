import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  @override
  Widget build(BuildContext context) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("dev/auction_sequence");
    var stream = ref.onValue;
    stream.listen((DatabaseEvent event) {
      print('Event Type: ${event.type}');
      print('Snapshot: ${event.snapshot}');
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Auction'),
      ),
      body: Container(),
    );
  }
}
