import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _RecentPageState();
}

class _RecentPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.red.shade400,
            ),
          ),
          title: Column(children: [
            Text(
              'Notifiactions',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Caladea',
                  fontSize: 30,
                  color: Colors.red.shade400),
            ),
            const SizedBox(
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
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.error_outline,
              color: Colors.red.shade300,
              size: 120,
            ),
            Text(
              'Currently Empty',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 28,
                  color: Colors.red.shade200),
            )
          ]),
        )
        // ListView.builder(
        //   itemCount: 4,
        //   itemBuilder: (context, index) {
        //     return const RecentTile();
        //   },
        // ),
        );
  }
}
