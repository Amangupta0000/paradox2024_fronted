import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget DataLoader() {
  return Center(
    child: SpinKitCubeGrid(
      color: Colors.red[800], // Customize the color of the loading indicator
      size: 50.0, // Customize the size of the loading indicator
    ),
  );
}
