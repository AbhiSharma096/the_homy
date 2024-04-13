import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  List<String> tabs = [
    "Offers",
    "Plans",
  ];
  int current = 0;

  double changePositionedOfLine() {
    switch (current) {
      case 0:
        return 0;
      case 1:
        return 54;
      default:
        return 0;
    }
  }

  double changeContainerWidth() {
    switch (current) {
      case 0:
        return 50;
      case 1:
        return 40;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('lib/assets/kitchen_king.png'),
                    Image.asset('lib/assets/kitchen_king_name.png')
                  ],
                ),
                Image.asset('lib/assets/red_line.png')
              ],
            ),
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Padding(
                  padding: const EdgeInsets.all(16),
                  child: Material(
                      elevation: 12,
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('lib/assets/cheff_image.png'))),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    width: size.width,
                    height: size.height * 0.05,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            width: size.width,
                            height: size.height * 0.04,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: tabs.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 10 : 23, top: 7),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          current = index;
                                        });
                                      },
                                      child: Text(
                                        tabs[index],
                                        style: GoogleFonts.ubuntu(
                                          fontSize: current == index ? 16 : 14,
                                          fontWeight: current == index
                                              ? FontWeight.w400
                                              : FontWeight.w300,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        AnimatedPositioned(
                          curve: Curves.fastLinearToSlowEaseIn,
                          bottom: 0,
                          left: changePositionedOfLine(),
                          duration: const Duration(milliseconds: 500),
                          child: AnimatedContainer(
                            margin: const EdgeInsets.only(left: 10),
                            width: changeContainerWidth(),
                            height: size.height * 0.008,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.fastLinearToSlowEaseIn,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * 0.3),
                    child: Text(
                      "${tabs[current]} Tab Content",
                      style: GoogleFonts.ubuntu(fontSize: 30),
                    ),
                  )
                ],
              )
            ])));
  }
}
