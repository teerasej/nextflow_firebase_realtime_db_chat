import 'package:flutter/material.dart';
import 'package:nextflow_firebase_realtime_db_chat/auction_provider.dart';
import 'package:nextflow_firebase_realtime_db_chat/models/auction_sequence_car.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  AuctionProvider provider = new AuctionProvider();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      initialData: AuctionSequenceCar(),
      create: (context) {
        return widget.provider.stream();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Auction'),
        ),
        body: Consumer<AuctionSequenceCar>(
          builder: (context, value, child) {
            return ListView();
          },
        ),
      ),
    );
  }
}
