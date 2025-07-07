import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class moonWeather extends StatefulWidget {
  const moonWeather({super.key});

  @override
  State<moonWeather> createState() => _moonWeatherState();
}

class _moonWeatherState extends State<moonWeather> {
  final GlobalKey section1Key = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  void scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
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
    return Scaffold(body: Text('data'));
  }

  Widget DeskTopNavBar() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset(
                    'assets/images/weatherlogo.png',
                    height: 150,
                  ),

                  //interfont
                  TextButton(
                      onPressed: () => scrollToSection(section1Key),
                      child: Text(
                        'Features',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 21, 68, 150),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Real-Time Local Weather at a Glance 🌤️',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 500,
                        child: Text(
                          'Get accurate, real-time weather updates based on your location. See current conditions including temperature, \'feels like,\' daily highs and lows, humidity, and more — all in a simple, easy-to-use interface.',
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Bounceable(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/appstoredark.png',
                              height: 50,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Bounceable(
                              onTap: () {},
                              child: Image.asset(
                                'assets/images/playstoredark.png',
                                height: 50,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextButton(
                          onPressed: _launchweather,
                          child: Text('Live Demo',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 21, 68, 150),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Image.asset(
                    'assets/images/midnight.png',
                    height: 300,
                  ),
                  Image.asset(
                    'assets/images/midnightpc.png',
                    height: 300,
                  ),
                ],
              ),
              SizedBox(
                height: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Why Choose Moon Weather?',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        width: 400,
                        key: section1Key,
                        child: Text(
                          'It’s more than just a weather app — it’s your pocket-sized forecast companion. Get the info you actually care about, without the clutter.',
                          textAlign: TextAlign.start,
                          softWrap: true,
                          style: TextStyle(color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 300,
                            child: Column(
                              children: [
                                Text(
                                  'Know what’s happening right now',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'See real-time weather updates tailored to your exact location.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 300,
                            child: Column(
                              children: [
                                Text(
                                  'No surprises outside',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Check current conditions like wind speed, humidity, pressure, and visibility before you step out.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 300,
                            child: Column(
                              children: [
                                Text(
                                  'Stay ahead of the skies',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Get a clear view of today’s max and min temperatures, and current weather — all in one place.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 300,
                            child: Column(
                              children: [
                                Text(
                                  'One world, one weather',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'See which country your weather data is coming from, powered by accurate geolocation.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 300,
                        child: Column(
                          children: [
                            Text(
                              'Simple, fast, no stress',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Everything you need in a clean, easy-to-use interface. No ads, no confusion.',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                height: 300,
                color: Color.fromARGB(255, 21, 68, 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Image.asset(
                          'assets/images/weatherlogo.png',
                          height: 150,
                        ),
                        Text(
                          '©️ 2025 Moon Weather',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 400,
                    ),
                    Row(
                      children: [
                        Bounceable(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/appstoredark.png',
                            height: 50,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Bounceable(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/playstoredark.png',
                              height: 50,
                            ))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
