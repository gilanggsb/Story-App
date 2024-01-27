import 'dart:async';
import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:provider/provider.dart';
import '../../common/common.dart';
import 'controllers/controllers.dart';

class MapsScreen extends StatefulWidget {
  final LatLong latLong;
  const MapsScreen({super.key, required this.latLong});

  @override
  State<MapsScreen> createState() => MapsScreenState();
}

class MapsScreenState extends State<MapsScreen> {
  final MapsProvider mapsProvider = MapsProvider.instance;

  @override
  void initState() {
    super.initState();
    mapsProvider.getCurrentLocation(widget.latLong);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: const DefaultAppBar(
        title: 'Maps',
      ),
      body: OpenStreetMapSearchAndPick(
        buttonTextStyle:
            const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
        buttonColor: Colors.blue,
        buttonText: 'Set Current Location',
        onPicked: (pickedData) {
          print(pickedData.latLong.latitude);
          print(pickedData.latLong.longitude);
          print(pickedData.address);
          print(pickedData.addressName);
        },
      ),
    );
  }
}
