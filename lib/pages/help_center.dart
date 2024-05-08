import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.red.shade400,
          ),
          centerTitle: true,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              'Help Center',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.red.shade400,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 3,
              width: 160,
              color: Colors.red,
            )
          ]),
        ),
        body: Column(
          children: [
            const TabBar(tabs: [
              Tab(
                icon: Text('F A Q'),
              ),
              Tab(
                icon: Text('Contact Us'),
              )
            ]),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'What if I need to cancel a booking?',
                                      expandedText:
                                          'Data updating soon dont panik, stay calm.')),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title: 'Is Safe to use App?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'How do I recieve Booking details?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'How can I edit my Profile Information?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title: 'How filter work?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'Is voice call or Chat Feaure there?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'Do I need to be Home during Service?',
                                      expandedText: "Yes Ofcourse"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'What if I need to cancel a booking?',
                                      expandedText:
                                          'Data updating soon dont panik, stay calm.')),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title: 'Is Safe to use App?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'How do I recieve Booking details?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'How can I edit my Profile Information?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title: 'How filter work?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'Is voice call or Chat Feaure there?',
                                      expandedText: "Yes Ofcourse")),
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 6),
                                  child: ExpandableCard(
                                      title:
                                          'Do I need to be Home during Service?',
                                      expandedText: "Yes Ofcourse"))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExpandableCard extends StatefulWidget {
  final String title;
  final String expandedText;

  ExpandableCard({required this.title, required this.expandedText});

  @override
  _ExpandableCardState createState() => _ExpandableCardState();
}

class _ExpandableCardState extends State<ExpandableCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _expanded = !_expanded;
        });
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 30,
                  ),
                ],
              ),
            ),
            AnimatedSize(
              curve: Curves.decelerate,
              duration: Duration(milliseconds: 300),
              child: Visibility(
                visible: _expanded,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        widget.expandedText,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
