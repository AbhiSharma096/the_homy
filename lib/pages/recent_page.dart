import 'package:flutter/material.dart';
import 'package:the_homy/component/recent_tiles.dart';

class RecentPage extends StatefulWidget {
  const RecentPage({super.key});

  @override
  State<RecentPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<RecentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: [
          Text(
            'Recent Plans',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Caladea',
                fontSize: 30,
                color: Colors.red.shade400),
          ),
          SizedBox(
            height: 6,
          ),
          Container(
            width: 150,
            height: 2,
            color: Colors.red,
          )
        ]),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return RecentTile();
        },
      ),
    );
  }
}
