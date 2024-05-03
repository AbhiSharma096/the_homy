import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/provider/services_provider.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final ref = FirebaseDatabase.instance.ref('Data/Service/1/Plans');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ServiceProvider>(builder: (context, provider, child) {
        final dataList = provider.serviceList;
        final state = provider.state;
        if (state == ServiceState.loading) {
          return CircularProgressIndicator();
        } else if (state == ServiceState.loaded) {
          return Container(
            height: 300,
            width: 300,
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final data = dataList[index];
                return Column(
                  children: [
                    Text(dataList.length.toString()),
                    Text(
                      data.name,
                      style: TextStyle(fontSize: 24),
                    ),
                    Text(data.function, style: TextStyle(fontSize: 24)),
                  ],
                );
              },
            ),
          );
        } else {
          return Text("Error ", style: TextStyle(fontSize: 30));
        }
      }),
    );

    // Access the data from the provider
  }
}
