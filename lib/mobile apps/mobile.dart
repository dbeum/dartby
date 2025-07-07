import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartby/dotby.dart';
import 'package:dartby/weather.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  bool isDarkMode = false;

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
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor:
            isDarkMode ? Color.fromARGB(255, 22, 22, 22) : Colors.white,
        appBar: AppBar(
          backgroundColor:
              isDarkMode ? Color.fromARGB(255, 22, 22, 22) : Colors.white,
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
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Dotby()));
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
                                  'assets/images/dotby2.png',
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
                              Text('Flutter Mobile'),
                            ],
                          ),
                          Container(
                            width: 170,
                            child: Text(
                              'A sleek, cross-platform app that mirrors the company’s full services: users can book event coverage, rent media equipment, sign up as vendors, and explore offerings — all from their phones, with a smooth and intuitive interface.',
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

              //ITEM 2

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
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Dotby()));
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
                                  'assets/images/dotby2.png',
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
                              Text('Flutter Mobile'),
                            ],
                          ),
                          Container(
                            width: 170,
                            child: Text(
                              'A sleek, cross-platform app that mirrors the company’s full services: users can book event coverage, rent media equipment, sign up as vendors, and explore offerings — all from their phones, with a smooth and intuitive interface.',
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
            ],
          ),
        ));
  }

  Widget DeskTopNavBar() {
    // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Dotby()));
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
                                  'assets/images/dotby2.png',
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
                              Text('Flutter Mobile'),
                            ],
                          ),
                          Container(
                            width: 400,
                            child: Text(
                              'A sleek, cross-platform app that mirrors the company’s full services: users can book event coverage, rent media equipment, sign up as vendors, and explore offerings — all from their phones, with a smooth and intuitive interface.',
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
                        'assets/images/app.png',
                        height: 90,
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/android.png',
                        height: 90,
                      )),
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
            ],
          ),
        ));
  }
}
