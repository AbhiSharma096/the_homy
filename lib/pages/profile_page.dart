import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:the_homy/pages/help_center.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                height: MediaQuery.of(context).size.width * 0.7,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    //color: Color.fromARGB(255, 214, 64, 76)),
                    color: const Color(0xFFE23744)),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                  fontFamily: 'Caladea',
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.edit_note_outlined,
                              color: Colors.white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 2,
                          color: Colors.white,
                          width: 110,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ClipOval(
                          child: Image.asset(
                            'lib/assets/user_pic.png',
                            width: 70,
                            height: 70,
                            fit: BoxFit
                                .cover, // Adjust this to control how the image fills the circular shape
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Text(
                          'AbhiShek Sharma',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w200,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        Text('+91 123*****90',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w200,
                                fontSize: 14.75,
                                color: Colors.white)),
                        Text('Noida',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height *
                      0.4, // Adjust the height as needed
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        OptionRow(icon: Icons.calendar_today, text: 'Calendar'),
                        GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HelpCenterPage()),
                                  )
                                },
                            child: OptionRow(icon: Icons.account_circle, text: 'Help Center')),
                        const OptionRow(
                            icon: Icons.star, text: 'Rate and Review'),
                        GestureDetector(
                            onTap: () {},
                            child: OptionRow(
                                icon: Icons.share,
                                text: 'Share')),
                        const OptionRow(icon: Icons.lock, text: 'Logout'),
                        const OptionRow(
                            icon: Icons.delete, text: 'Delete Account'),
                        const OptionRow(icon: Icons.info, text: 'About Us'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const OptionRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.red, // Set icon color to red
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(
                fontSize: 16, // Set text font size to 16
                color: Colors.black, // Set text color to white
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
