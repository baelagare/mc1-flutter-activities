import 'package:flutter/material.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBarWidget(), // Parallax Header [cite: 947, 954]
        const SliverListWidget(),   // List Section [cite: 955]
        const SliverGridWidget(),   // Grid Section [cite: 956]
      ],
    );
  }
}

// --- WIDGETS ---

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.brown,
      forceElevated: true, // Shows a shadow at the bottom of the bar [cite: 963]
      expandedHeight: 250.0, // Creates parallax effect while scrolling [cite: 964]
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Parallax Effect'),
        background: Image(
          image: NetworkImage('https://images.unsplash.com/photo-1505330622279-bf7d7fc918f4?w=800'), // Desk image [cite: 966]
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SliverListWidget extends StatelessWidget {
  const SliverListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate( // Builds an explicit list [cite: 860, 989]
        List.generate(3, (int index) { // Generate 3 items 
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.lightGreen,
              foregroundColor: Colors.white,
              child: Text("${index + 1}"), // String interpolation set with index + 1 [cite: 992]
            ),
            title: Text('Row ${index + 1}'),
            subtitle: Text('Subtitle Row ${index + 1}'),
            trailing: const Icon(Icons.star_border),
          );
        }),
      ),
    );
  }
}

class SliverGridWidget extends StatelessWidget {
  const SliverGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverSafeArea( // Wraps the SliverGrid to account for device notch [cite: 920, 1017]
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.child_friendly, size: 48.0, color: Colors.amber),
                  const Divider(),
                  Text('Grid ${index + 1}'),
                ],
              ),
            );
          },
          childCount: 12, // Builder creates 12 items [cite: 1021]
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), // Shows three tiles across [cite: 1022]
      ),
    );
  }
}