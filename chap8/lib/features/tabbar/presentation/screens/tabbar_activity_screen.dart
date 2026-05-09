import 'package:flutter/material.dart';

class TabBarActivityScreen extends StatefulWidget {
  const TabBarActivityScreen({super.key});

  @override
  State<TabBarActivityScreen> createState() => _TabBarActivityScreenState();
}

class _TabBarActivityScreenState extends State<TabBarActivityScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade200, title: const Text('TabBar and TabBarView')),
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: const [
            _IconPage(icon: Icons.cake, color: Colors.orange),
            _IconPage(icon: Icons.sentiment_satisfied, color: Colors.lightGreen),
            _IconPage(icon: Icons.access_alarm, color: Colors.purple),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
          tabs: const [
            Tab(icon: Icon(Icons.cake), text: 'Birthdays'),
            Tab(icon: Icon(Icons.sentiment_satisfied), text: 'Gratitude'),
            Tab(icon: Icon(Icons.access_alarm), text: 'Reminders'),
          ],
        ),
      ),
    );
  }
}

class _IconPage extends StatelessWidget {
  const _IconPage({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(child: Icon(icon, size: 120, color: color));
  }
}
