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

  final Uri snlinkUrl = Uri.parse('https://stream-nest-alpha.vercel.app/');

  Future<void> _launchsnlink() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(snlinkUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $snlinkUrl';
    }
  }

  final Uri spotifyUrl = Uri.parse(
      'https://drive.google.com/file/d/1KqZFygRNSjah-sCUN64dPKc9TS86IKTp/view?usp=drive_link');

  Future<void> _launchspotify() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(spotifyUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $spotifyUrl';
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
    // bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
        backgroundColor: Colors.white,
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
                  Column(
                    children: [
                      Text('Dotby Production',
                          style: GoogleFonts.sanchez(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black))),
                      SizedBox(
                        height: 10,
                      ),
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

              //ITEM 3

              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logospotify.png',
                        height: 100,
                      )),
                  Column(
                    children: [
                      Text('Spotify',
                          style: GoogleFonts.sanchez(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black))),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          _launchspotify();
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
                                  'assets/images/spotify.png',
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
              //ITEM 4

              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/snl.png',
                        height: 100,
                      )),
                  Column(
                    children: [
                      Text('StreamNest',
                          style: GoogleFonts.sanchez(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black))),
                      SizedBox(
                        height: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          _launchsnlink();
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
                                  'assets/images/sn.jpeg',
                                  height: 250,
                                ))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Click this text to Download App',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
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
              height: MediaQuery.of(context).size.height * 1,
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
                              height: MediaQuery.of(context).size.height * .42,
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
                        height: MediaQuery.of(context).size.height * .15,
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
              //ITEM 3

              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/logospotify.png',
                        height: 100,
                      )),
                  Text('Spotify',
                      style: GoogleFonts.sanchez(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black))),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      _launchspotify();
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
                              'assets/images/spotify.png',
                              height: MediaQuery.of(context).size.height * .4,
                            ))),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/android.png',
                        height: 100,
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/app.png',
                        height: MediaQuery.of(context).size.height * .13,
                      )),
                ],
              ),
              //ITEM 4

              Column(
                children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Image.asset(
                        'assets/images/snl.png',
                        height: 60,
                      )),
                  Text('StreamNest',
                      style: GoogleFonts.sanchez(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Colors.black))),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      _launchsnlink();
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
                              'assets/images/sn.jpeg',
                              height: MediaQuery.of(context).size.height * .4,
                            ))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Click this text to Download App',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/android.png',
                        height: 100,
                      )),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        'assets/images/app.png',
                        height: 100,
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
