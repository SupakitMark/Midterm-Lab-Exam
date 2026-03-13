import 'package:flutter/material.dart';
import 'db_helper.dart';

class FinishClassScreen extends StatefulWidget {
  @override
  _FinishClassScreenState createState() => _FinishClassScreenState();
}

class _FinishClassScreenState extends State<FinishClassScreen> {
  final _formKey = GlobalKey<FormState>();
  String learnedToday = "";
  String feedback = "";

  void _saveFinishClass() async {
    await DBHelper.insert({
      'learnedToday': learnedToday,
      'feedback': feedback,
      'timestamp': DateTime.now().toString(),
      'gps': "Mock GPS",
      'qrCode': "Mock QR"
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Finish Class saved!"))
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Finish Class")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "What did you learn today?"),
                onChanged: (val) => learnedToday = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Feedback"),
                onChanged: (val) => feedback = val,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Save Finish Class"),
                onPressed: _saveFinishClass,
              )
            ],
          ),
        ),
      ),
    );
  }
}
