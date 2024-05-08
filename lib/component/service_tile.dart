import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:the_homy/model/services.dart';
import 'package:the_homy/pages/service_page2.dart';

class ServiceTile extends StatelessWidget {
  final MyService service;
  const ServiceTile({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServicesPage2(
              service: service,
            ),
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
                      service.name,
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(service.fun,
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
            margin: const EdgeInsets.only(left: 20,top: 30),
            height: 145,
            width: 120,
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset('lib/assets/${service.img}.svg',fit: BoxFit.contain
            ,),
          )
        ],
      ),
    );
  }
}
