import 'package:flutter/material.dart';
import '../widgets/sliver_app_bar.dart';
import '../widgets/sliver_list.dart';
import '../widgets/sliver_grid.dart';

class SliversPage extends StatelessWidget {
  const SliversPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar is omitted because SliverAppBar takes its place
      body: CustomScrollView(
        slivers: const <Widget>[
          SliverAppBarWidget(),
          SliverListWidget(),
          SliverGridWidget(),
        ],
      ),
    );
  }
}