import 'package:flutter/material.dart';


class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({super.key, required this.child, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      
      elevation: 0.0,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon:  Icon(Icons.arrow_back_ios,color: Colors.red.shade400,),
        ),
        
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions:  [
        
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      centerTitle: true,
      title: Image.asset('lib/assets/kitchen_king_name.png'),
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(padding:const EdgeInsets.only(bottom: 50),child:  child),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
