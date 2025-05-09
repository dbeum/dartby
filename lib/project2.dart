import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartby/dotby.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class Project2 extends StatefulWidget {
  const Project2({super.key});

  @override
  State<Project2> createState() => _Project2State();
}

class _Project2State extends State<Project2> {

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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.white,
      appBar: AppBar(
actions: [
   
TextButton(
  onPressed: () {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Menu",
      barrierColor: Colors.black.withOpacity(0.5),
      pageBuilder: (context, anim1, anim2) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Center(
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
              
                      Container(
                  width: 200.0,
                  height: 200.0,
                  margin: const EdgeInsets.only(
                    top: 24.0,
                    bottom: 64.0,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
TextButton(onPressed:  _launchlink, child: Image.asset( 'assets/images/linkedin.png' ,height: 30,)),
TextButton(onPressed:  _launchgithub, child: Image.asset( 'assets/images/github.png' ,height: 30,)),
TextButton(onPressed:  _launchEmail, child: Image.asset( 'assets/images/gmail.png' ,height: 25,)),
TextButton(onPressed:  (){}, child: Image.asset( 'assets/images/whatsapp.png' ,height: 30,)),
                    ],),
                //    ListTile(
                //   onTap: _launchlink,
                //   leading:  Image.asset( 'assets/images/linkedin.png' ,height: 30,),
                //   title: Text('LinkedIn'),
                // ),
                // ListTile(
                //   onTap: _launchgithub,
                //   leading: Image.asset( 'assets/images/github.png' ,height: 30,),
                //   title: Text('Github'),
                // ),
                // ListTile(
                //   onTap: _launchEmail,
                //   leading: Image.asset( 'assets/images/gmail.png' ,height: 25,),
                //   title: Text('Mail'),
                // ),
                // ListTile(
                //   onTap: () {},
                //   leading:  Image.asset( 'assets/images/whatsapp.png' ,height: 30,),
                //   title: Text('Whatsapp'),
                // ),
                  
                  ],
                ),
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
      transitionDuration: const Duration(milliseconds: 200),
    );
  },
  child: Icon(Icons.menu, color: Colors.black, size: 30),
),
],
     backgroundColor: Colors.white,
     elevation: 0,
      scrolledUnderElevation: 0,
      ),
body: SingleChildScrollView(child: Column(children: [
 Container(
  height: 500,

  child:  Stack(children: [
    Particles(
    height:500,
    width: MediaQuery.of(context).size.width,
    awayRadius: 150,
    particles: createParticles(),
    onTapAnimation: true,
    awayAnimationDuration: const Duration(milliseconds: 100),
    awayAnimationCurve: Curves.linear,
    enableHover: true,
    hoverRadius: 90,
    connectDots: false,
  ),
    Positioned.fill(child: Align(alignment: Alignment.center,
  child:Container(
        alignment: Alignment.center,
        height: 100,
        child:  TextAnimatorSequence(
          
  children: [
      TextAnimator('Welcome',
        incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
        atRestEffect: WidgetRestingEffects.bounce(),
        outgoingEffect: WidgetTransitionEffects.outgoingScaleUp(),
       style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900, color: Colors.black, letterSpacing: -2, fontSize: 45))
     ),
      TextAnimator('Hi, I\'m Isaac',
        incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(),
        atRestEffect: WidgetRestingEffects.fidget(),
        outgoingEffect: WidgetTransitionEffects.outgoingSlideOutToBottom(),
       style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 40, 53, 147), letterSpacing: -2, fontSize: 45))
      ),
      TextAnimator('A Software Developer',
        incomingEffect: WidgetTransitionEffects(blur: const Offset(2, 2), duration: const Duration(milliseconds: 600)),
        atRestEffect: WidgetRestingEffects.wave(),
        outgoingEffect: WidgetTransitionEffects(blur: const Offset(2, 2), duration: const Duration(milliseconds: 600)),
       style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255,176, 190, 197), letterSpacing: -2, fontSize: 30))
    ),
  ],
tapToProceed: true,
loop: true,
transitionTime: const Duration(seconds: 4),
),),
  ))
],),),
SizedBox(height: 50,),
Center(child: Container(
  padding: EdgeInsets.all(20),
  child: Text('I’m Isaac, a cross-platform mobile and web developer with a strong focus on Flutter. I create efficient, user-friendly applications with a mix of great UI/UX and clean code.I enjoy building products that solve real problems, and I’m constantly learning to improve both my frontend and backend skills. From prototyping in Figma to deploying functional apps, I love bringing ideas to life — one widget at a time.',
  style: GoogleFonts.luckiestGuy(color: Colors.black),
textAlign: TextAlign.center,softWrap: true),
)
),
SizedBox(height: 50,),
Center(child: Text('My Work',style: GoogleFonts.alfaSlabOne(fontSize: 30,color: Colors.black)),),
SizedBox(height: 20,),
        CarouselSlider(
                    options: CarouselOptions(
                      height: 650.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
            items:[


              //ITEM 1


      Column(
          children:[
                Align(alignment: Alignment.topCenter,
            child: Image.asset( 'assets/images/logo1.png' ,height: 100,)
            ),
            Row(children: [
               TextButton(onPressed:_launchdotby, child:   Container(
      
            padding: EdgeInsets.all(2.0), 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.black, 
                width: 2.0, 
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child:Image.asset( 'images/dotby1.jpg' ,height: 250,) 
              )),),
             
              Column(
                children: [
                  Text('Dotby Production', style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900,color: Colors.black ))),
                  Row(children: [
                    
                  const    Text('Platform:',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
               SizedBox(width: 2,),
                  Text('Flutter Web'),
               
                    
                  ],),
                
Container(width: 500,
child:   Text('A full-featured platform built for a creative media agency. It allows users to rent equipment, book event coverage, apply as vendors, and explore services — all in one seamless, responsive experience.',
style: TextStyle(fontSize: 15,color: Colors.black),
textAlign: TextAlign.center,softWrap: true,),)
 
               
                ],
              )
            ],),
             Align(alignment: Alignment.centerRight,
            child: Image.asset( 'assets/images/web.png' ,height: 100,)
            ),
            // Align(alignment: Alignment.bottomCenter,
            // child: Image.asset( 'assets/images/android.png' ,height: 100,)
            // ),

          ] ,
        ),


        //ITEM 2


          Column(
          children:[
                Align(alignment: Alignment.topCenter,
            child: Image.asset( 'assets/images/logo1.png' ,height: 100,)
            ),
            Row(children: [
               TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Dotby()));}, child:   Container(
      
            padding: EdgeInsets.all(2.0), 
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), 
              border: Border.all(
                color: Colors.black, 
                width: 2.0, 
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child:Image.asset( 'assets/images/dotby2.png' ,height: 250,) 
              )),),
            
              Column(
                children: [
                  Text('Dotby Production', style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900,color: Colors.black ))),
                  Row(children: [
                    
                  const    Text('Platform:',style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
               SizedBox(width: 2,),
                  Text('Flutter Mobile'),
               
                    
                  ],),
                
Container(width: 600,
child:   Text('A sleek, cross-platform app that mirrors the company’s full services: users can book event coverage, rent media equipment, sign up as vendors, and explore offerings — all from their phones, with a smooth and intuitive interface.',
style: TextStyle(fontSize: 15,color: Colors.black,),
textAlign: TextAlign.center,softWrap: true,),)
 
                ],
              )
            ],),
             Align(alignment: Alignment.centerRight,
            child: Image.asset( 'assets/images/app.png' ,height: 100,)
            ),
           Align(alignment: Alignment.bottomCenter,
            child: Image.asset( 'assets/images/android.png' ,height: 100,)
            ),

          ] ,
        ),

        //ITEM 3

  //         Column(
  //         children:[
  //               Align(alignment: Alignment.topCenter,
  //           child: Image.asset( 'images/logo.png' ,height: 100,)
  //           ),
  //           Row(children: [
  //              TextButton(onPressed: () {
                 
  //              }, child:   Container(
      
  //           padding: EdgeInsets.all(2.0), // Adjust the border width here
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(15.0), // Adjust the radius here
  //             border: Border.all(
  //               color: Colors.black, // Change the border color here
  //               width: 2.0, // Adjust the border thickness here
  //             ),
  //           ),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(15.0),
  //             child:Image.asset( 'images/IMG_3285.jpg' ,height: 250,) 
  //             )),),
  //             SizedBox(width: 2,),
  //             Column(
  //               children: [
  //                 Text('Cinema Booking App', style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900, ))),
  //                 Row(children: [
                    
  //                 const    Text('Platform',style:TextStyle(color: Color.fromARGB(164, 0, 0, 0),fontWeight: FontWeight.bold)),
  //              SizedBox(width: 2,),
  //                 Text('Flutter'),
               
                    
  //                 ],),
                
  // Text('An intuitive cinema booking app ',style: TextStyle(fontSize: 12),),
  //   Text('that lets users browse movies,',style: TextStyle(fontSize: 12),),
  //   Text('select showtimes, and reserve seats',style: TextStyle(fontSize: 12),),
  //     Text('all in a few taps.',style: TextStyle(fontSize: 12),),
               
  //               ],
  //             )
  //           ],),
  //            Align(alignment: Alignment.centerRight,
  //           child: Image.asset( 'images/app.jpg' ,height: 100,)
  //           ),
  //           Align(alignment: Alignment.bottomCenter,
  //           child: Image.asset( 'images/android.png' ,height: 100,)
  //           ),

  //         ] ,
  //       ),
       ],
        ),
],),)
    );
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
