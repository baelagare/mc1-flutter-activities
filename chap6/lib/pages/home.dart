import 'package:flutter/material.dart';

import '../widgets/container.dart';
import '../widgets/colrow.dart';
import '../widgets/imgicons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // GlobalKey for the Form widget to handle validation
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  String _orderItem = '';
  int _orderQuantity = 0;

  void _submitOrder() {
    if (_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('na-save na ang order: $_orderQuantity $_orderItem(s)')),
      );
    }
  }

  void _playButton() {
    //if (_formStateKey.currentState!.validate()) {
    //  _formStateKey.currentState!.save();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('pressed play')),
      );
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        leading: PopupMenuButton<String>(
          icon: const Icon(Icons.menu),
          onSelected: (_) {}, 
          itemBuilder: (BuildContext context) => const [
            PopupMenuItem<String>(
              value: 'profile',
              child: Text('Profile'),
            ),
            PopupMenuItem<String>(
              value: 'settings',
              child: Text('Settings'),
            ),
            PopupMenuItem<String>(
              value: 'help',
              child: Text('Help'),
            ),
            PopupMenuItem<String>(
              value: 'logout',
              child: Text('Logout'),
            ),
          ],
        ),
        title: const Text('Chapter 6 Activity'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  '1. mao ni ang container nga naay box decorations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const ContainerWithBoxDecorationWidget(),
                const Divider(height: 40),

                const Text(
                  '2. mao ni and column nga naay row nested sa sulod',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const ColumnAndRowNestingWidget(),
                const Divider(height: 40),

                const Text(
                  '3. kuhag image url from the internet ug icons',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const ImagesAndIconWidget(),
                const Divider(height: 40),

                const Text(
                  '4. forms ni siya nga naay validation',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildForm(),
                const Divider(height: 40),

                const Text(
                  '5. detect sa orientation sa device',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  color: orientation == Orientation.portrait
                      ? Colors.yellow
                      : Colors.lightBlue,
                  height: 100.0,
                  width: orientation == Orientation.portrait ? 100.0 : 200.0,
                  child: Text(
                    orientation == Orientation.portrait
                        ? 'Portrait'
                        : 'Landscape',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _playButton,
        backgroundColor: Colors.lightGreen.shade300,
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  // Widget to build the Form
  Widget _buildForm() {
    return Form(
      key: _formStateKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'example, Notebook',
              labelText: 'ibutang ang item nga gusto nimo i-order',
              border: OutlineInputBorder(),
            ),
            validator: (value) => value!.isEmpty ? 'Item Required' : null,
            onSaved: (value) => _orderItem = value!,
          ),
          const SizedBox(height: 16),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: 'example, 3',
              labelText: 'ibutang kung pila kabuok',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              int? val = int.tryParse(value!);
              return (val == null || val <= 0)
                  ? 'kinahanglan ug at least 1 item'
                  : null;
            },
            onSaved: (value) => _orderQuantity = int.tryParse(value!)!,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitOrder,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
            child: const Text('i-save ang order'),
          ),
        ],
      ),
    );
  }
}