import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        height: 36,
        width: 36,
        margin: EdgeInsets.only(top: 8, bottom: 8),
        color: Colors.transparent,
      ),
    );
  }
}