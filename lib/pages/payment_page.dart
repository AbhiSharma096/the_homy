import 'package:flutter/material.dart';
import 'package:the_homy/model/cart_item.dart';

class PaymentPage extends StatelessWidget {
  final TransactionDetail details;
  const PaymentPage({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Service Name: ${details.serviceName}'),
              Text('Selected Plan: ${details.selectedPlan}'),
              Text('People Count: ${details.peopleCount}'),
              Text('Selected Date: ${details.selectedDate}'),
              Text('Selected Times: ${details.selectedTimes}'),
            ],
          ),
        ),
      ),
    );
  }
}
