import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;
  const Gratitude({super.key, required this.radioGroupValue});

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  final List<String> _gratitudeList = [];
  String? _selectedGratitude;
  int? _radioGroupValue;

  void _radioOnChanged(int? index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index!];
    });
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList..add('Family')..add('Friends')..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Radio<int>(value: 0, groupValue: _radioGroupValue, onChanged: _radioOnChanged),
              Text('Family'),
              Radio<int>(value: 1, groupValue: _radioGroupValue, onChanged: _radioOnChanged),
              Text('Friends'),
              Radio<int>(value: 2, groupValue: _radioGroupValue, onChanged: _radioOnChanged),
              Text('Coffee'),
            ],
          ),
        ),
      ),
    );
  }
}