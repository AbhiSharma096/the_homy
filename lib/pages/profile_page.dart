import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:the_homy/pages/edit_profile_page.dart';
import 'package:the_homy/pages/help_center.dart';
import 'package:the_homy/provider/auth_provider.dart';
import 'package:the_homy/provider/services_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _logout(BuildContext context) async {
    context.read<AuthProvider>().setSignout(context);
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop(); // Close the dialog
                await _logout(context);
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  void _shareApp() {
    final appLink =
        'https://play.google.com/store/apps/details?id=com.yourapp'; // Replace with your app link
    Share.share('Check out this cool app: $appLink');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, authProvider, child) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  height: MediaQuery.of(context).size.width * 0.7,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      //color: Color.fromARGB(255, 214, 64, 76)),
                      color: const Color(0xFFE23744)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Profile',
                                style: TextStyle(
                                    fontFamily: 'Caladea',
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProfilePage()));
                                },
                                child: const Icon(
                                  Icons.edit_note_outlined,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            height: 2,
                            color: Colors.white,
                            width: 110,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ClipOval(
                            child: Image.asset(
                              'lib/assets/avatar${authProvider.avatar}.png',
                              width: 90,
                              height: 90,
                              fit: BoxFit
                                  .cover, // Adjust this to control how the image fills the circular shape
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            authProvider.myUser?.userName ?? 'Guest',
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w200,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          Text(
                              authProvider.myUser?.userPhoneNumber ??
                                  'Guest Phone Number',
                              style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14.75,
                                  color: Colors.white)),
                          Text(authProvider.myUser?.address['city'] ?? 'Guest',
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
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.4, // Adjust the height as needed
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          const OptionRow(
                              icon: Icons.calendar_today, text: 'Calendar'),
                          GestureDetector(
                              onTap: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HelpCenterPage()),
                                    )
                                  },
                              child: const OptionRow(
                                  icon: Icons.account_circle,
                                  text: 'Help Center')),
                          const OptionRow(
                              icon: Icons.star, text: 'Rate and Review'),
                          GestureDetector(
                              onTap: () {
                                _shareApp();
                              },
                              child: const OptionRow(
                                  icon: Icons.share, text: 'Share')),
                          GestureDetector(
                              onTap: () {
                                _showLogoutDialog(context);
                              },
                              child: const OptionRow(
                                  icon: Icons.lock, text: 'Logout')),
                          // const OptionRow(
                          //     icon: Icons.delete, text: 'Delete Account'),
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
    });
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
