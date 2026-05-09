import 'package:flutter/material.dart';

class GesturesDragDropPage extends StatefulWidget {
  const GesturesDragDropPage({super.key});

  @override
  _GesturesDragDropPageState createState() => _GesturesDragDropPageState();
}

class _GesturesDragDropPageState extends State<GesturesDragDropPage> {
  String _gestureDetected = '';
  Color _paintedColor = Colors.grey;

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  GestureDetector _buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        _displayGestureDetected('onPanUpdate:\n$details');
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.access_alarm, size: 98.0),
            Text(_gestureDetected),
          ],
        ),
      ),
    );
  }

  Draggable<int> _buildDraggable() {
    return Draggable(
      childWhenDragging: Icon(Icons.palette, color: Colors.grey, size: 48.0),
      feedback: Icon(Icons.brush, color: Colors.deepOrange, size: 80.0),
      data: Colors.deepOrange.value,
      child: Column(
        children: <Widget>[
          Icon(Icons.palette, color: Colors.deepOrange, size: 48.0),
          Text('Drag Me below to change color'),
        ],
      ),
    );
  }

  DragTarget<int> _buildDragTarget() {
    return DragTarget<int>(
      onAcceptWithDetails: (DragTargetDetails<int> details) {
        setState(() {
          _paintedColor = Color(details.data);
        });
      },
      builder: (BuildContext context, List<int?> acceptedData, List<dynamic> rejectedData) {
        return acceptedData.isEmpty
            ? Text(
                'Drag To and see color change',
                style: TextStyle(color: _paintedColor),
              )
            : Text(
                'Painting Color: ${acceptedData[0]}',
                style: TextStyle(
                  color: Color(acceptedData[0]!),
                  fontWeight: FontWeight.bold,
                ),
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('gestures & drag/drop'), backgroundColor: Colors.lightGreen),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildGestureDetector(),
              Divider(color: Colors.black, height: 44.0),
              _buildDraggable(),
              Divider(color: Colors.black, height: 44.0),
              _buildDragTarget(),
              Divider(color: Colors.black, height: 44.0),
            ],
          ),
        ),
      ),
    );
  }
}