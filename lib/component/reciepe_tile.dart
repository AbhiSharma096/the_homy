import 'package:flutter/material.dart';
import 'package:the_homy/pages/reciepe_page.dart';

class RecipeTile extends StatelessWidget {
  const RecipeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> RecipePage()));},
      child: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 10),
            ),
          ],
          image: DecorationImage(
            image: AssetImage('lib/assets/banner.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 20, 
              top: 16, 
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.95),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: const Offset(0, 9),
                    ),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text('Recipe Name',style: TextStyle(color: Colors.deepOrange.shade900,fontSize: 16),),
                      SizedBox(height: 14,),
                      Text('Lore ispum jshdbih casbca sca a ciu asdc ae cahs  ic ais dc ed ca sd s '),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [Icon(Icons.arrow_circle_right,color: Colors.grey.shade500,)],)
                  
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
