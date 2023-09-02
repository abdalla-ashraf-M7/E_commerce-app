import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Future getpolyline(lat, long, destLat, destLong) async {
  Set<Polyline> polylineset = {};
  List<LatLng> polylinecordinate = []; //list of positions when linked the polyline appears
  PolylinePoints polylinePoints = PolylinePoints();
  var response;

  String url = "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destLat,$destLong&key=AIzaSyCQ4gs7ycVyXstz127C4yLRaXFi-gwrpkI";
  try {
    response = await http.post(Uri.parse(url));
    var responsebody = jsonDecode(response.body);
    var point = responsebody['routes'][0]['overview_polyline']['points'];
    List<PointLatLng> result = polylinePoints.decodePolyline(point);

    if (result.isNotEmpty) {
      result.forEach((element) {
        polylinecordinate.add(LatLng(element.latitude, element.longitude));
      });
    }
    Polyline polyline = Polyline(polylineId: PolylineId("abdallaa"), color: Colors.blue, width: 5, points: polylinecordinate);
    polylineset.add(polyline);
    return polylineset;
  } catch (e) {
    print("**********errorconnectingtogoogletogetpolyline*********$e");
  }
}
