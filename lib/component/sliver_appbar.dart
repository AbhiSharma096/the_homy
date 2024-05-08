import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final String Name;
  final Widget child;
  final Widget title;
  const MySliverAppBar({super.key, required this.child, required this.title, required this.Name});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.red.shade400,
        ),
      ),
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [],
      backgroundColor: Theme.of(context).colorScheme.background,
      centerTitle: true,
      title: Padding(
        padding: EdgeInsets.only(right: 50),
        child: Column(

          children: [Row(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 25,
                  height: 25,
                  child: Image.asset(
                    'lib/assets/kitchen_king.png',
                  )),
              const SizedBox(
                width: 10,
              ),
              Text(
                Name,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.red.shade400,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
          SizedBox(height: 8,),
          Container(height: 3,width: 160,color: Colors.red,)
          ]
        ),
      ),
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background:
            Padding(padding: const EdgeInsets.only(bottom: 50), child: child),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
