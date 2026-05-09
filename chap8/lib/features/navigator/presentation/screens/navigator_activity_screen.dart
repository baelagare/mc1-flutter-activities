import 'package:flutter/material.dart';

const _kNoSelection = -1;

class NavigatorActivityScreen extends StatefulWidget {
  const NavigatorActivityScreen({super.key});

  @override
  State<NavigatorActivityScreen> createState() => _NavigatorActivityScreenState();
}

class _NavigatorActivityScreenState extends State<NavigatorActivityScreen> {
  String _howAreYou = '...';

  void _openAbout() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const _AboutScreen()),
    );
  }

  Future<void> _openGratitude() async {
    final response = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => const _GratitudeScreen(radioGroupValue: _kNoSelection),
      ),
    );
    setState(() {
      _howAreYou = response ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade200,
        title: const Text('Navigator'),
        actions: [
          IconButton(icon: const Icon(Icons.info_outline), onPressed: _openAbout),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Grateful for: $_howAreYou',
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openGratitude,
        child: const Icon(Icons.sentiment_satisfied),
      ),
    );
  }
}

class _AboutScreen extends StatelessWidget {
  const _AboutScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Text('About Page'),
        ),
      ),
    );
  }
}

class _GratitudeScreen extends StatefulWidget {
  const _GratitudeScreen({required this.radioGroupValue});

  final int radioGroupValue;

  @override
  State<_GratitudeScreen> createState() => _GratitudeScreenState();
}

class _GratitudeScreenState extends State<_GratitudeScreen> {
  static const _gratitudeList = ['Family', 'Friends', 'Coffee'];
  late int _radioGroupValue;

  @override
  void initState() {
    super.initState();
    _radioGroupValue = widget.radioGroupValue;
  }

  void _saveSelection() {
    final selected = _radioGroupValue > _kNoSelection ? _gratitudeList[_radioGroupValue] : '';
    Navigator.pop(context, selected);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gratitude'),
        actions: [IconButton(icon: const Icon(Icons.check), onPressed: _saveSelection)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: List<Widget>.generate(_gratitudeList.length, (index) {
            return Expanded(
              child: RadioListTile<int>(
                title: Text(_gratitudeList[index]),
                value: index,
                groupValue: _radioGroupValue,
                onChanged: (value) {
                  setState(() {
                    _radioGroupValue = value ?? _kNoSelection;
                  });
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
