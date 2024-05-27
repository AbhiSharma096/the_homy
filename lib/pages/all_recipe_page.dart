import 'package:flutter/material.dart';
import 'package:the_homy/component/reciepe_tile.dart';

class AllRecipePage extends StatelessWidget {
  const AllRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(
        //   Icons.arrow_back_ios,
        //   color: Colors.red.shade400,
        // ),
        centerTitle: true,
        title: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Text(
            'Recipe',
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
            width: 120,
            color: Colors.red,
          )
        ]),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 12,),
            Container(
              
              width: MediaQuery.of(context).size.width * 0.86,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set the background color
                borderRadius: BorderRadius.circular(
                    12), // Set the border radius for rounded corners
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none, // Remove the default border
                  prefixIcon:
                      Icon(Icons.search), // Add a search icon as the prefix
                  hintText: 'Search...', // Add a hint text
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 15), // Add padding
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16,vertical: 15),
                    child: RecipeTile());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
