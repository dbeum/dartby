import 'dart:math';

import 'package:before_after/before_after.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:particles_flutter/component/particle/particle.dart';
import 'package:particles_flutter/particles_engine.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dotby extends StatefulWidget {
  const Dotby({super.key});

  @override
  State<Dotby> createState() => _DotbyState();
}

class _DotbyState extends State<Dotby> {
  double value = 0.5;
   bool _showOnboarding = false;
  int _currentStep = 0;

List<Container> cards = [
    Container(
      alignment: Alignment.center,
      child:Image.asset('assets/images/dotby2.png'),
      color: Colors.transparent,
    ),
    Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/dotby3.png'),
      color: Colors.transparent,
    ),
    Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/dotby4.png'),
      color: Colors.transparent,
    ),
      Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/dotby5.png'),
      color: Colors.transparent,
    ),
      Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/dotby6.png'),
      color: Colors.transparent,
    ),
      Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/dotby7.png'),
      color: Colors.transparent,
    ),
      Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/dotby8.png'),
      color: Colors.transparent,
    ),
      Container(
      alignment: Alignment.center,
      child: Image.asset('assets/images/dotby9.png'),
      color: Colors.transparent,
    )
  ];

   @override
  void initState() {
    super.initState();
    _checkIfOnboardingCompleted();
  }

   Future<void> _checkIfOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    bool completed = prefs.getBool('onboardingCompleted') ?? false;
    
    if (!completed) {
      setState(() {
        _showOnboarding = true;
      });
    }
  }

   void _markOnboardingAsComplete() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('onboardingCompleted', true);

    setState(() {
      _showOnboarding = false;
    });
  }
  

 @override
  Widget build(BuildContext context) { 
      
      return Scaffold(
      body: Stack(
        children: [ ScreenTypeLayout.builder(
      mobile: (BuildContext context) => MobileNavBar(),
      desktop: (BuildContext context) => DeskTopNavBar(),
       ),
  
  // Onboarding overlay
          if (_showOnboarding)
            Positioned.fill(
              child: GestureDetector(
                onTap: _markOnboardingAsComplete,
                child: OnboardingOverlay(
                  currentStep: _currentStep,
                  onNext: _nextStep,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _nextStep() {
    if (_currentStep < 2) {
      setState(() {
        _currentStep++;
      });
    } else {
      _markOnboardingAsComplete();
    }
  }


  Widget MobileNavBar() {
    return Scaffold(
      backgroundColor: Colors.black,
      
      body: Stack(children: [
         Particles(
    height: MediaQuery.of(context).size.height,
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
   Align(alignment: Alignment.center,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(height: 30,),
    Container(
      padding: EdgeInsets.all(20),
child:   Text('A sleek, cross-platform app that mirrors the company’s full services: users can book event coverage, rent media equipment, sign up as vendors, and explore offerings — all from their phones, with a smooth and intuitive interface.',
style: TextStyle(fontSize: 15,color: Colors.white),
textAlign: TextAlign.center,softWrap: true,),),
    Text('Gallery',style: GoogleFonts.aDLaMDisplay(color: Colors.white,fontSize: 30),),
      SizedBox(height: 10,),
       Flexible(
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
        ),
      ),
  ],),)
      ],),
    );

  }

  Widget DeskTopNavBar() {
     return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title:   Text('Gallery',style: GoogleFonts.aDLaMDisplay(color: Colors.white,fontSize: 30),),
      backgroundColor: Colors.black,
      ),
      body: Stack(children: [
         Particles(
    height: MediaQuery.of(context).size.height,
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
 
    Align(alignment: Alignment.center,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    SizedBox(height: 30,),
    Container(
      width: 400,
      padding: EdgeInsets.all(20),
child:   Text('A sleek, cross-platform app that mirrors the company’s full services: users can book event coverage, rent media equipment, sign up as vendors, and explore offerings — all from their phones, with a smooth and intuitive interface.',
style: TextStyle(fontSize: 15,color: Colors.white),
textAlign: TextAlign.center,softWrap: true,),),
  
   
       Flexible(
        child: CardSwiper(
          cardsCount: cards.length,
          cardBuilder: (context, index, percentThresholdX, percentThresholdY) => cards[index],
        ),
      ),
  ],),)
 
      ],),
      
    );
    
  }
}


  List<Particle> createParticles() {
    var rng = Random();
    List<Particle> particles = [];
    for (int i = 0; i < 140; i++) {
      particles.add(Particle(
        color: Colors.white.withOpacity(0.6),
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



class OnboardingOverlay extends StatelessWidget {
  final int currentStep;
  final VoidCallback onNext;

  OnboardingOverlay({required this.currentStep, required this.onNext});

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: onNext,
      child: Container(
        color: Colors.black.withOpacity(0.7),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
                 Icon(Icons.movie, color: Colors.white, size: 50),
              SizedBox(height: 20),
              Text(
                'Gallery Cards',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(height: 10),
              Text(
                 'Swipe them in any direction to reveal more images.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: onNext,
                child: Text('Next'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                foregroundColor: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






