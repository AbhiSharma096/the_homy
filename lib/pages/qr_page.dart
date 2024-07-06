import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';
import 'package:the_homy/provider/auth_provider.dart';

class QrPage extends StatefulWidget {
  final String UID;
  const QrPage({super.key, required this.UID});

  @override
  State<QrPage> createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final TextEditingController _controller = TextEditingController();
  String _inputString = '';

  @override
  void initState() {
    super.initState();
    _controller.text = widget.UID; // Set the initial text to UID
    _inputString = widget.UID;
  }

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
        title: Text(
          'Your QR Code',
          style: TextStyle(color: Colors.red.shade400, fontFamily: 'Poppins'),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: PrettyQr(
                  data: _inputString,
                  size: 250,
                  roundEdges: true,
                  elementColor: Colors.red.shade400,
                  errorCorrectLevel: QrErrorCorrectLevel.M,
                  typeNumber: 4,
                  image: AssetImage(
                      'lib/assets/avatar${Provider.of<AuthProvider>(context, listen: false).avatar}.png'), // Ensure you have this image in your assets
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
