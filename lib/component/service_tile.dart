import 'package:flutter/material.dart';
import 'package:the_homy/pages/service_page2.dart';

class ServiceTile extends StatelessWidget {
  final String name;
  final dynamic image;
  final String function;
  const ServiceTile(
      {super.key,
      required this.name,
      required this.image,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var available = function;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServicesPage2(available: available),
          ),
        );
      },
      child: Stack(
        children: [
          Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 148,
              padding: const EdgeInsets.all(12),
              width: 136,
              child: Transform.rotate(
                angle: -1.5708,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(function,
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 10,
                            color: Colors.red.shade400))
                  ],
                ),
              ),
            ),
          ),
          Container(
              height: 180,
              width: 155,
              alignment: Alignment.bottomRight,
              child: Image.asset('lib/assets/$image.png'))
        ],
      ),
    );
  }
}
