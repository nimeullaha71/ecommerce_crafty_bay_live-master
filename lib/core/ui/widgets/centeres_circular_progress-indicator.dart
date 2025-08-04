import 'package:flutter/material.dart';
class CenteredCirclarProgressIndicator extends StatelessWidget {
  const CenteredCirclarProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}