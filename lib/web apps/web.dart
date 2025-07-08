import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartby/dotby.dart';
import 'package:dartby/weather.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Web extends StatefulWidget {
  const Web({super.key});

  @override
  State<Web> createState() => _WebState();
}

class _WebState extends State<Web> {
  bool isDarkMode = false;
  final Uri dotbyUrl = Uri.parse('https://dotbyproductions.com/');

  Future<void> _launchdotby() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(dotbyUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $dotbyUrl';
    }
  }

  final Uri projectUrl = Uri.parse('https://project-p-48c57.web.app');

  Future<void> _launchproject() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(projectUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $projectUrl';
    }
  }

  final Uri experienceUrl = Uri.parse('https://fly3d-e0b37.web.app/');

  Future<void> _launchexperience() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(experienceUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $experienceUrl';
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

  final Uri weatherUrl = Uri.parse('https://weather-30f59.web.app/');

  Future<void> _launchweather() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(weatherUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $weatherUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(),
        child: ScreenTypeLayout.builder(
          mobile: (BuildContext context) => MobileNavBar(),
          desktop: (BuildContext context) => DeskTopNavBar(),
        ));
  }

  Widget MobileNavBar() {
    //bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: CarouselSlider(
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
            items: [
              //ITEM 1

              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo1.png',
                        height: 100,
                      )),
                  Row(
                    children: [
                      TextButton(
                        onPressed: _launchdotby,
                        child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color.fromARGB(255, 192, 192, 192),
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/images/dotby.png',
                                  height: 250,
                                ))),
                      ),
                      Column(
                        children: [
                          Text('Dotby Production',
                              style: GoogleFonts.sanchez(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ))),
                          Row(
                            children: [
                              const Text('Platform:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Flutter Web'),
                            ],
                          ),
                          Container(
                            width: 170,
                            child: Text(
                              'A full-featured platform built for a creative media agency. It allows users to rent equipment, book event coverage, apply as vendors, and explore services — all in one seamless, responsive experience.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/web.png',
                        height: 100,
                      )),
                  // Align(alignment: Alignment.bottomCenter,
                  // child: Image.asset( 'assets/images/android.png' ,height: 100,)
                  // ),
                ],
              ),

              //ITEM 2
              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/weatherl.png',
                        height: 100,
                      )),
                  Column(
                    children: [
                      Text('Moon Weather',
                          style: GoogleFonts.sanchez(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black))),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => moonWeather()));
                        },
                        child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color.fromARGB(255, 192, 192, 192),
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/images/wm.png',
                                  height: 250,
                                ))),
                      ),
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/app.png',
                        height: 100,
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/android.png',
                        height: 100,
                      )),
                ],
              ),

              //       ITEM 3
              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      )),
                  Row(
                    children: [
                      TextButton(
                        onPressed: _launchproject,
                        child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color.fromARGB(255, 192, 192, 192),
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/images/projectm.png',
                                  height: 250,
                                ))),
                      ),
                      Column(
                        children: [
                          Text('Moon Portfolio',
                              style: GoogleFonts.sanchez(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ))),
                          Row(
                            children: [
                              const Text('Platform:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Flutter Web'),
                            ],
                          ),
                          Container(
                            width: 170,
                            child: Text(
                              'Launch Your Personal Website in Minutes.Pick a design, add your info — we’ll handle the rest. Create a stunning personal website effortlessly with ready-made templates, customized to showcase your work, identity, or brand in just a few clicks.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/web.png',
                        height: 100,
                      )),
                ],
              ),

              //ITEM 4
              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      )),
                  Row(
                    children: [
                      Column(
                        children: [
                          TextButton(
                            onPressed: _launchexperience,
                            child: Container(
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: Color.fromARGB(255, 192, 192, 192),
                                    width: 2.0,
                                  ),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: Image.asset(
                                      'assets/images/3d.png',
                                      height: 150,
                                    ))),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Experience Site',
                              style: GoogleFonts.sanchez(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ))),
                          Row(
                            children: [
                              const Text('Platform:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Flutter Web'),
                            ],
                          ),
                          Container(
                            width: 200,
                            child: Text(
                              'Step into my world of motion and depth — a visual playground where animations, videos, and 3D effects bring creativity to life. This isn\'t just a site\'s an experience.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/web.png',
                        height: 100,
                      )),
                ],
              ),
              //
            ],
          ),
        ));
  }

  Widget DeskTopNavBar() {
    //   bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: CarouselSlider(
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
            items: [
              //ITEM 1

              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo1.png',
                        height: 100,
                      )),
                  Row(
                    children: [
                      TextButton(
                        onPressed: _launchdotby,
                        child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color.fromARGB(255, 192, 192, 192),
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/images/dotby1.jpg',
                                  height: 250,
                                ))),
                      ),
                      Column(
                        children: [
                          Text('Dotby Production',
                              style: GoogleFonts.sanchez(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ))),
                          Row(
                            children: [
                              const Text('Platform:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Flutter Web'),
                            ],
                          ),
                          Container(
                            width: 400,
                            child: Text(
                              'A full-featured platform built for a creative media agency. It allows users to rent equipment, book event coverage, apply as vendors, and explore services — all in one seamless, responsive experience.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/web.png',
                        height: 100,
                      )),
                  // Align(alignment: Alignment.bottomCenter,
                  // child: Image.asset( 'assets/images/android.png' ,height: 100,)
                  // ),
                ],
              ),

              //ITEM 2
              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/weatherlogo.jpg',
                        height: 100,
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => moonWeather()));
                    },
                    child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Color.fromARGB(255, 192, 192, 192),
                            width: 2.0,
                          ),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image.asset(
                              'assets/images/wd.jpg',
                              height: 250,
                            ))),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/web.png',
                        height: 100,
                      )),
                ],
              ),
              //       ITEM 3
              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      )),
                  Row(
                    children: [
                      TextButton(
                        onPressed: _launchproject,
                        child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color.fromARGB(255, 192, 192, 192),
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/images/project.png',
                                  height: 250,
                                ))),
                      ),
                      Column(
                        children: [
                          Text('Moon Portfolio',
                              style: GoogleFonts.sanchez(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ))),
                          Row(
                            children: [
                              const Text('Platform:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Flutter Web'),
                            ],
                          ),
                          Container(
                            width: 400,
                            child: Text(
                              'Launch Your Personal Website in Minutes.Pick a design, add your info — we’ll handle the rest. Create a stunning personal website effortlessly with ready-made templates, customized to showcase your work, identity, or brand in just a few clicks.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/web.png',
                        height: 100,
                      )),
                ],
              ),

              //ITEM 4
              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logo.png',
                        height: 100,
                      )),
                  Row(
                    children: [
                      TextButton(
                        onPressed: _launchexperience,
                        child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color.fromARGB(255, 192, 192, 192),
                                width: 2.0,
                              ),
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/images/3d.png',
                                  height: 250,
                                ))),
                      ),
                      Column(
                        children: [
                          Text('Experience Site',
                              style: GoogleFonts.sanchez(
                                  textStyle: const TextStyle(
                                fontWeight: FontWeight.w900,
                              ))),
                          Row(
                            children: [
                              const Text('Platform:',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 192, 192, 192),
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 2,
                              ),
                              Text('Flutter Web'),
                            ],
                          ),
                          Container(
                            width: 400,
                            child: Text(
                              'Step into my world of motion and depth — a visual playground where animations, videos, and 3D effects bring creativity to life. This isn\'t just a site — \'s an experience.',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/web.png',
                        height: 100,
                      )),
                ],
              ),
              //
            ],
          ),
        ));
  }
}
