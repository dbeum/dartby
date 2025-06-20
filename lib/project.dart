import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartby/dotby.dart';
import 'package:dartby/mobile.dart';
import 'package:dartby/web.dart';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool isDarkMode = false;
   final _advancedDrawerController = AdvancedDrawerController();

   final Uri githubUrl = Uri.parse('https://github.com/dbeum');

 
  Future<void> _launchgithub() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(githubUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $githubUrl';
    }
  }
   final Uri dotbyUrl = Uri.parse('https://dotby-37e3f.web.app/');

 
  Future<void> _launchdotby() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(dotbyUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $dotbyUrl';
    }
  }
 final Uri styleUrl = Uri.parse('https://styleby-14f06.web.app/');

 
  Future<void> _launchstyle() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(styleUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $styleUrl';
    }
  }

 final Uri linkUrl = Uri.parse('https://www.linkedin.com/in/isaac-olowofela-b77767223?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app');

 
  Future<void> _launchlink() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(linkUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $linkUrl';
    }
  }
  final String email = 'entrydirect@gmail.com';

  // Function to open email app
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull('subject=Hello&body=I would like to reach you regarding...'), // optional pre-filled subject and body
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not open email app';
    }
  }
 final Uri weatherUrl = Uri.parse('https://weather-30f59.web.app/');

 
  Future<void> _launchweather() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(weatherUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $weatherUrl';
    }
  }
  @override
  Widget build(BuildContext context) {
  bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return  AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Color.fromARGB(255,29, 31, 35)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        // NOTICE: Uncomment if you want to add shadow behind the page.
        // Keep in mind that it may cause animation jerks.
        // boxShadow: <BoxShadow>[
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: 0.0,
        //   ),
        // ],
        borderRadius:  BorderRadius.all(Radius.circular(16)),
      ),
    
   child:  Scaffold (
    
      extendBodyBehindAppBar: false,
      backgroundColor:  isDarkMode ?   Color.fromARGB(255, 22, 22, 22): Colors.white,
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation:0,
       scrolledUnderElevation: 0,
       leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
      body: SingleChildScrollView(child: Column(
        
        children: [
TextButton(onPressed: (){}, child:Container(
  height: 560,
  width: 400,
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(color: isDarkMode ?   Color.fromARGB(255, 27, 27, 27): Colors.white,
  border: Border.all(color: Color.fromARGB(255, 38, 38, 38),width: 1),
  borderRadius: BorderRadius.all(Radius.circular(10))),
  child: Column(
   
    children: [


 Row(
  mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 10,),
 Container(height: 30,
width: 150,
decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
color:Color.fromARGB(255, 22, 22, 22),
border: Border.all(width: 2,color: Color.fromARGB(255, 38, 38, 38))
),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  Icon(Icons.circle,color: Color.fromARGB(255, 230, 62, 33),size: 15,),

  Text('AVAILABLE FOR JOB',style: TextStyle(fontSize: 10,color: Color.fromARGB(255, 192, 192, 192)),)
],),
)
 ],),
 SizedBox(height: 20,),
  Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    SizedBox(width: 10,),
    Text('App/Web Developer',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 192, 192, 192)),)
  ],),
  Row(mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 10,),
    Container(
                  width: 128.0,
                  height: 128.0,
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/IMG_2598.jpg',
                  ),
                ),
  ],),


   Row(mainAxisAlignment: MainAxisAlignment.start,
  children: [
    SizedBox(width: 10,),

       Text('I\'m Isaac',style: TextStyle(fontSize: 25,color:isDarkMode? Colors.white: Colors.black),),


  ],),
   SizedBox(height: 10,),
  Container(
  width: 400,

  child: Text('I’m a cross-platform mobile and web developer with a strong focus on Flutter. I create efficient, user-friendly applications with a mix of great UI/UX and clean code.I enjoy building products that solve real problems, and I’m constantly learning to improve both my frontend and backend skills. From prototyping in Figma to deploying functional apps, I love bringing ideas to life — one widget at a time.',
  style: GoogleFonts.inter(color: Color.fromARGB(255, 192, 192, 192)),
textAlign: TextAlign.start,softWrap: true),
),
  SizedBox(height: 20,),
Row(mainAxisAlignment: MainAxisAlignment.start,
children: [
  SizedBox(width: 10,),
  Container(height: 30,
  width: 67,
  decoration: BoxDecoration(color: Color.fromARGB(255, 230, 62, 33),
  borderRadius: BorderRadius.all(Radius.circular(5)),
  boxShadow: [
      BoxShadow(
        color:  isDarkMode ?   Colors.white.withOpacity(0.2):Colors.black.withOpacity(0.2),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 3), // horizontal, vertical shadow offset
      ),
    ], ),
  child: TextButton(onPressed: _handleMenuButtonPressed, child: Text('Hire Me',style: TextStyle(fontSize: 12,color: Colors.white),)
  )
  ),
]
  )

],)), ),
SizedBox(height: 20,),
TextButton(onPressed: (){}, child: Container(
  height: 220,
  width: 400,
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(color:isDarkMode ?   Color.fromARGB(255, 27, 27, 27): Colors.white,
  border: Border.all(color: Color.fromARGB(255, 38, 38, 38),width: 1),
  borderRadius: BorderRadius.all(Radius.circular(10))),
  child: Column(
   
    children: [



 Row(
  mainAxisAlignment: MainAxisAlignment.start ,
  children: [
  Icon(Icons.circle,color: Color.fromARGB(255, 192, 192, 192),size: 12,),
SizedBox(width: 10,),
  Text('Recent Work',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 192, 192, 192)),)
],),

//RECENT WORK

//1
 SizedBox(height: 20,),
  Row(
   // mainAxisAlignment: MainAxisAlignment.start,
    children: [
    SizedBox(width: 10,),
    Text('Moon Weather',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 230, 62, 33),fontWeight: FontWeight.bold),),
    SizedBox(width: 10,),
    Text('Flutter Web',style: TextStyle(fontSize: 15,color:  Color.fromARGB(255, 192, 192, 192)))
  ],),
  SizedBox(height: 10,),

  //2
  Row(
 
    children: [
    SizedBox(width: 10,),
    Text('Dotby Productions',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 230, 62, 33),fontWeight: FontWeight.bold),),
    SizedBox(width: 10,),
    Text('Flutter Web',style: TextStyle(fontSize: 15,color:  Color.fromARGB(255, 192, 192, 192)))
  ],),

  //3
   SizedBox(height: 10,),
  Row(

    children: [
    SizedBox(width: 10,),
    Text('Dotby Productions',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 230, 62, 33),fontWeight: FontWeight.bold),),
    SizedBox(width: 10,),
    Text('Flutter Mobile',style: TextStyle(fontSize: 15,color:  Color.fromARGB(255, 192, 192, 192)))
  ],),
 SizedBox(height: 10,),
  //4
  Row(

    children: [
    SizedBox(width: 10,),
    Text('Experience Site',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 230, 62, 33),fontWeight: FontWeight.bold),),
    SizedBox(width: 10,),
    Text('Flutter Web',style: TextStyle(fontSize: 15,color:  Color.fromARGB(255, 192, 192, 192)))
  ],),
],)),),
SizedBox(height: 20,),
TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Mobile()));
}, child: Container(
  height: 430,
  width: 400,
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(color:isDarkMode ?   Color.fromARGB(255, 27, 27, 27): Colors.white,
  border: Border.all(color: Color.fromARGB(255, 38, 38, 38),width: 1),
  borderRadius: BorderRadius.all(Radius.circular(10))),
  child: Column(
   
    children: [



 Row(
  mainAxisAlignment: MainAxisAlignment.start ,
  children: [
  Icon(Icons.arrow_circle_up_rounded,color:  Color.fromARGB(255, 230, 62, 33),size: 20,),
SizedBox(width: 10,),
  Text('Mobile App',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 192, 192, 192)),)
],),


 SizedBox(height: 20,),
 Image.asset('assets/images/Mockup.png')
],)),),
SizedBox(height: 20,),
TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Web()));}, child: Container(
  height: 350,
  width: 400,
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(color: isDarkMode ?   Color.fromARGB(255, 27, 27, 27): Colors.white,
  border: Border.all(color: Color.fromARGB(255, 38, 38, 38),width: 1),
  borderRadius: BorderRadius.all(Radius.circular(10))),
  child: Column(
   
    children: [



 Row(
  mainAxisAlignment: MainAxisAlignment.start ,
  children: [
  Icon(Icons.arrow_circle_up_rounded,color:  Color.fromARGB(255, 230, 62, 33),size: 20,),
SizedBox(width: 10,),
  Text('Web App',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 192, 192, 192)),)
],),


 SizedBox(height: 50,),
 Image.asset('assets/images/groupweb.png',height:200)
],)),),
SizedBox(height: 20,),
TextButton(onPressed: (){}, child: Container(
  height: 150,
  width: 400,
  padding: EdgeInsets.all(15),
  decoration: BoxDecoration(color: isDarkMode ?   Color.fromARGB(255, 27, 27, 27): Colors.white,
  border: Border.all(color: Color.fromARGB(255, 38, 38, 38),width: 1),
  borderRadius: BorderRadius.all(Radius.circular(10))),
  child: Column(
   
    children: [



 Container(height: 30,
width: 150,
decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),
color:Color.fromARGB(255, 22, 22, 22),
border: Border.all(width: 2,color: Color.fromARGB(255, 38, 38, 38))
),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
  Icon(Icons.circle,color: Color.fromARGB(255, 230, 62, 33),size: 15,),

  Text('AVAILABLE FOR JOB',style: TextStyle(fontSize: 10,color: Color.fromARGB(255, 192, 192, 192) ),)
],),
),


 SizedBox(height: 20,),
  Row(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [

    TextButton(onPressed: _launchgithub, child: Text('GitHub',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 230, 62, 33),fontWeight: FontWeight.bold),)),
     TextButton(onPressed: _launchEmail, child: Text('Mail',style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 192, 192, 192),fontWeight: FontWeight.bold),)),
    TextButton(onPressed: (){}, child: Text('GitHub',style: TextStyle(fontSize: 17,color:  Color.fromARGB(255, 192, 192, 192),fontWeight: FontWeight.bold),)),
  ],),
  SizedBox(height: 10,),
 
],)),),
SizedBox(height: 50,),
Center(child: Text('Thank You!!',style: GoogleFonts.alfaSlabOne(fontSize: 30,)),),
SizedBox(height: 20,),
     
      ],),)
      ),
       drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // Container(
                //   width: 128.0,
                //   height: 128.0,
                //   margin: const EdgeInsets.only(
                //     top: 24.0,
                //     bottom: 64.0,
                //   ),
                //   clipBehavior: Clip.antiAlias,
                //   decoration: BoxDecoration(
                //     color: Colors.black26,
                //     shape: BoxShape.circle,
                //   ),
                //   child: Image.asset(
                //     'assets/images/IMG_2598.jpg',
                //   ),
                // ),
                SizedBox(height: 150,),
                ListTile(
                  onTap: _launchlink,
                  leading:  Image.asset( 'assets/images/linkedin.png' ,height: 30,),
                  title: Text('LinkedIn'),
                ),
                ListTile(
                  onTap: _launchgithub,
                  leading: Image.asset( 'assets/images/github.png' ,height: 30,),
                  title: Text('Github'),
                ),
                ListTile(
                  onTap: _launchEmail,
                  leading: Image.asset( 'assets/images/gmail.png' ,height: 25,),
                  title: Text('Mail'),
                ),
                ListTile(
                  onTap: () {},
                  leading:  Image.asset( 'assets/images/whatsapp.png' ,height: 30,),
                  title: Text('Whatsapp'),
                ),
                Spacer(),
                // DefaultTextStyle(
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: Colors.white54,
                //   ),
                //   child: Container(
                //     margin: const EdgeInsets.symmetric(
                //       vertical: 16.0,
                //     ),
                //     child: Text('Terms of Service | Privacy Policy'),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
    


    List<Particle> createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 140; i++) {
      particles.add(Particle(
        color: Colors.black.withOpacity(0.6),
        size: rng.nextDouble() * 10,
        velocity: Offset(rng.nextDouble() * 200 * randomSign(),
            rng.nextDouble() * 200 * randomSign()),
      ));
    }
    return particles;
  }

  double randomSign() {
    var rng = Random();
    return rng.nextBool() ? 1 : -1;
  }
