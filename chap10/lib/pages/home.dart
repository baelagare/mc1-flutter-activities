import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Import your newly created modular widgets
import '../widgets/header_image.dart';
import '../widgets/entry.dart';
import '../widgets/weather.dart';
import '../widgets/tags.dart';
import '../widgets/footer_images.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black54),
        leading: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.cloud_queue), onPressed: () {})
        ], systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const JournalHeaderImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  JournalEntry(),
                  Divider(),
                  JournalWeather(),
                  Divider(),
                  JournalTags(),
                  Divider(),
                  JournalFooterImages(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}