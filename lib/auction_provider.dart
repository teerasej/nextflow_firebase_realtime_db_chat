import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:nextflow_firebase_realtime_db_chat/models/auction_sequence_car.dart';

class AuctionProvider {
  FirebaseDatabase database = FirebaseDatabase.instance;
  late DatabaseReference ref;
  late StreamController<AuctionSequenceCar> streamAuctionSequenceCarController;

  AuctionProvider() {
    ref = FirebaseDatabase.instance.ref("dev/auction_sequence");
    streamAuctionSequenceCarController = StreamController();

    ref.onValue.listen((event) {
      print('Stream UPDATED: ${event.type}');

      var auctionSequenceCar = AuctionSequenceCar();

      streamAuctionSequenceCarController.add(auctionSequenceCar);
    });
  }

  Stream<AuctionSequenceCar> stream() {
    return streamAuctionSequenceCarController.stream;
  }
}
