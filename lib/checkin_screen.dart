import 'package:flutter/material.dart';
import 'db_helper.dart';

class CheckInScreen extends StatefulWidget {
  @override
  _CheckInScreenState createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  final _formKey = GlobalKey<FormState>();
  String prevTopic = "";
  String expectedTopic = "";
  int mood = 3;

  void _saveCheckIn() async {
    await DBHelper.insert({
      'prevTopic': prevTopic,
      'expectedTopic': expectedTopic,
      'mood': mood,
      'timestamp': DateTime.now().toString(),
      'gps': "Mock GPS", // later integrate geolocator
      'qrCode': "Mock QR" // later integrate qr_code_scanner
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Check-in saved!"))
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Check-in")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Previous Topic"),
                onChanged: (val) => prevTopic = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Expected Topic"),
                onChanged: (val) => expectedTopic = val,
              ),
              DropdownButtonFormField<int>(
                value: mood,
                items: [
                  DropdownMenuItem(value: 1, child: Text("😡 Very Negative")),
                  DropdownMenuItem(value: 2, child: Text("🙁 Negative")),
                  DropdownMenuItem(value: 3, child: Text("😐 Neutral")),
                  DropdownMenuItem(value: 4, child: Text("🙂 Positive")),
                  DropdownMenuItem(value: 5, child: Text("😄 Very Positive")),
                ],
                onChanged: (val) => setState(() => mood = val!),
                decoration: InputDecoration(labelText: "Mood"),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Save Check-in"),
                onPressed: _saveCheckIn,
              )
            ],
          ),
        ),
      ),
    );
  }
}
