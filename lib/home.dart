import 'package:dartby/about.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
 

  

  @override
  Widget build(BuildContext context) { 
      
       return Theme(
      data: Theme.of(context).copyWith(
      
      ),
       child:  ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileNavBar(),
      desktop: (BuildContext context) => DeskTopNavBar(),
       ));
  }


  Widget MobileNavBar() {
  return Scaffold(
    body:Stack(children:[
      Container(
      decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/back.jpg'),fit: BoxFit.cover)
          ),
        
        child:   Container(
            color: Colors.black.withOpacity(0.3),
        )          
    ),
    home1(),
  
    ],
     ),
     
  );
  }
     

  Widget DeskTopNavBar() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      )
    );
  
}












  }
