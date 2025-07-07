import 'dart:math';
import 'dart:ui';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartby/dotby.dart';
import 'package:dartby/mobile%20apps/mobile.dart';
import 'package:dartby/web%20apps/web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
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
//  bool isDarkMode = false;
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

  final Uri linkUrl = Uri.parse(
      'https://www.linkedin.com/in/isaac-olowofela-b77767223?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=ios_app');

  Future<void> _launchlink() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(linkUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $linkUrl';
    }
  }

  final Uri weatherUrl = Uri.parse('https://weather-30f59.web.app/');

  Future<void> _launchweather() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(weatherUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $weatherUrl';
    }
  }

  final String email = 'entrydirect@gmail.com';

  // Function to open email app
  void _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: Uri.encodeFull(
          'subject=Hello&body=I would like to reach you regarding...'), // optional pre-filled subject and body
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not open email app';
    }
  }

  @override
  Widget build(BuildContext context) {
   // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor:
           Color.fromARGB(255, 22, 22, 22) ,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: _launchlink,
                                        child: Image.asset(
                                          'assets/images/linkedin.png',
                                          height: 30,
                                        )),
                                    TextButton(
                                        onPressed: _launchgithub,
                                        child: Image.asset(
                                          'assets/images/github.png',
                                          height: 30,
                                        )),
                                    TextButton(
                                        onPressed: _launchEmail,
                                        child: Image.asset(
                                          'assets/images/gmail.png',
                                          height: 25,
                                        )),
                                    TextButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                          'assets/images/whatsapp.png',
                                          height: 30,
                                        )),
                                  ],
                                ),
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
          backgroundColor:
               Color.fromARGB(255, 22, 22, 22),
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Bounceable(
                onTap: () {},
                child: Container(
                    height: 550,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color:  Color.fromARGB(255, 27, 27, 27)
                          ,
                        border: Border.all(
                            color: Color.fromARGB(255, 38, 38, 38), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'App/Web Developer',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 192, 192, 192)),
                            ),
                            SizedBox(
                              width: 200,
                            ),
                            Container(
                              height: 30,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Color.fromARGB(255, 22, 22, 22),
                                  border: Border.all(
                                      width: 2,
                                      color: Color.fromARGB(255, 38, 38, 38))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.circle,
                                    color: Color.fromARGB(255, 230, 62, 33),
                                    size: 15,
                                  ),
                                  Text(
                                    'AVAILABLE FOR JOB',
                                    style: TextStyle(
                                        fontSize: 10,
                                        color:
                                            Color.fromARGB(255, 192, 192, 192)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Hi i\'m Isaac',
                              style: TextStyle(
                                  fontSize: 40,
                                  color:
                                   Colors.white ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 600,
                              child: Text(
                                  'I’m a cross-platform mobile and web developer with a strong focus on Flutter. I create efficient, user-friendly applications with a mix of great UI/UX and clean code.I enjoy building products that solve real problems, and I’m constantly learning to improve both my frontend and backend skills. From prototyping in Figma to deploying functional apps, I love bringing ideas to life — one widget at a time.',
                                  style: GoogleFonts.inter(
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                  textAlign: TextAlign.start,
                                  softWrap: true),
                            ),
                            Container(
                              width: 150.0,
                              height: 150.0,
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
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  height: 30,
                                  width: 67,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 230, 62, 33),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    boxShadow: [
                                      BoxShadow(
                                        color:  Colors.white.withOpacity(0.2)
                                      ,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0,
                                            3), // horizontal, vertical shadow offset
                                      ),
                                    ],
                                  ),
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Hire Me',
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      ))),
                            ])
                      ],
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Bounceable(
                    onTap: () {},
                    child: Container(
                        height: 220,
                        width: 400,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color:  Color.fromARGB(255, 27, 27, 27)
                                ,
                            border: Border.all(
                                color: Color.fromARGB(255, 38, 38, 38),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.circle,
                                  color: Color.fromARGB(255, 192, 192, 192),
                                  size: 12,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Recent Work',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                )
                              ],
                            ),

//RECENT WORK

                            SizedBox(
                              height: 20,
                            ),

                            //1

                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Moon Weather',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 230, 62, 33),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Flutter Web',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 192, 192, 192)))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //2

                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Dotby Productions',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 230, 62, 33),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Flutter Web',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 192, 192, 192)))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //3

                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Dotby Productions',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 230, 62, 33),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Flutter Mobile',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 192, 192, 192)))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            //4

                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Experience Site',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 230, 62, 33),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Flutter Web',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 192, 192, 192)))
                              ],
                            ),
                          ],
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mobile()));
                    },
                    child: Container(
                        height: 430,
                        width: 400,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color:  Color.fromARGB(255, 27, 27, 27)
                          ,
                            border: Border.all(
                                color: Color.fromARGB(255, 38, 38, 38),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: Color.fromARGB(255, 230, 62, 33),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Mobile App',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Image.asset('assets/images/Mockup.png')
                          ],
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Web()));
                    },
                    child: Container(
                        height: 350,
                        width: 400,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color:  Color.fromARGB(255, 27, 27, 27)
                                ,
                            border: Border.all(
                                color: Color.fromARGB(255, 38, 38, 38),
                                width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: Color.fromARGB(255, 230, 62, 33),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Web App',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color:
                                          Color.fromARGB(255, 192, 192, 192)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Image.asset('assets/images/groupweb.png',
                                height: 200)
                          ],
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Bounceable(
                onTap: () {},
                child: Container(
                    height: 150,
                    width: 400,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color:  Color.fromARGB(255, 27, 27, 27)
                          ,
                        border: Border.all(
                            color: Color.fromARGB(255, 38, 38, 38), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Color.fromARGB(255, 22, 22, 22),
                              border: Border.all(
                                  width: 2,
                                  color: Color.fromARGB(255, 38, 38, 38))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.circle,
                                color: Color.fromARGB(255, 230, 62, 33),
                                size: 15,
                              ),
                              Text(
                                'AVAILABLE FOR JOB',
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Color.fromARGB(255, 192, 192, 192)),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                                onPressed: _launchgithub,
                                child: Text(
                                  'GitHub',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 230, 62, 33),
                                      fontWeight: FontWeight.bold),
                                )),
                            TextButton(
                                onPressed: _launchEmail,
                                child: Text(
                                  'Mail',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'GitHub',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 50,
              ),
              Center(
                child: Text('Thank You!!',
                    style: GoogleFonts.alfaSlabOne(
                      fontSize: 30,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )));
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
