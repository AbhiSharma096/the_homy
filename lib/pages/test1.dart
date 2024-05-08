import 'package:flutter/material.dart';


class Test1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Dialog Example'),
      ),
      body: Center(
        child: ImageDialogButton(
          imagePath: 'assets/your_image.jpg',
          dialogContent: Text('Your dialog content here'), key: null,
        ),
      ),
    );
  }
}

class ImageDialogButton extends StatefulWidget {
  final String imagePath;
  final Widget dialogContent;

  const ImageDialogButton({
    required Key? key,
    required this.imagePath,
    required this.dialogContent,
  }) : super(key: key);

  @override
  _ImageDialogButtonState createState() => _ImageDialogButtonState();
}

class _ImageDialogButtonState extends State<ImageDialogButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _showImageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(widget.imagePath),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.dialogContent,
                ),
              ],
            ),
          ),
        ),
      ),
    );

    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageDialog(context),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - _scaleAnimation.value,
            child: child,
          );
        },
        child: Image.asset(
          widget.imagePath,
          width: 150, // Adjust size as needed
          height: 150, // Adjust size as needed
        ),
      ),
    );
  }
}