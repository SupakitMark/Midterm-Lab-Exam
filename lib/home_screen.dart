import 'package:flutter/material.dart';
import 'checkin_screen.dart';
import 'finishclass_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Smart Class")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Check-in"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CheckInScreen()));
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Finish Class"),
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (_) => FinishClassScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
