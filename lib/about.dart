import 'package:dartby/project.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:animations/animations.dart';

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {

   final Uri githubUrl = Uri.parse('https://github.com/dbeum');

 
  Future<void> _launchgithub() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(githubUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $githubUrl';
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
  return  Center(
    
        child: Container(
        height: 450,
        decoration: BoxDecoration(color: Colors.white),
          child:

             Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        children: [
  Container(
        alignment: Alignment.center,
        height: 100,
        child:  TextAnimatorSequence(
          
  children: [
      TextAnimator('Welcome',
        incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
        atRestEffect: WidgetRestingEffects.bounce(),
        outgoingEffect: WidgetTransitionEffects.outgoingScaleUp(),
       style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900, color: Color.fromARGB(255,0, 121, 107), letterSpacing: -2, fontSize: 45))
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

  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 TextButton(onPressed:_launchgithub,
               //  _launchInstagram,
               child: Image.asset( 'assets/images/github.png' ,height: 30,)),
              TextButton(onPressed:_launchEmail,
               child: Image.asset( 'assets/images/gmail.png' ,height: 30,)),
               TextButton(onPressed:_launchEmail,
               //  _launchInstagram,
               child: Image.asset( 'assets/images/whatsapp.png' ,height: 30,))
             ]
              ),
SizedBox(height: 5,),
                          const Text(
                            'Hey there! I’m Isaac, a passionate Software Developer with a love for creating smooth, user-friendly mobile and web experiences. I thrive on turning ideas into apps that people enjoy using every day. My journey in tech started with a curiosity for how things work behind the scenes, and it’s led me to specialize in Flutter—a framework that lets me build beautiful, responsive apps across multiple platforms',
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(height: 10),
                          Text(
                              'Whether you’re looking for a dedicated developer or just want to chat about all things tech, feel free to connect. Let’s create something amazing together!',
                              style: TextStyle(fontSize: 12),
                            ),
                           OpenContainer(
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: Duration(milliseconds: 500),
                  closedElevation: 0,
                  openElevation: 0,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  closedColor: Colors.transparent,
                  closedBuilder: (context, action) => Container(
                    alignment: Alignment.bottomCenter,
                  //  margin: EdgeInsets.symmetric(horizontal: 5),
                 
                //  height: 20,
                    child: TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Project(),)), child: Text('Portfolio',style: TextStyle(fontWeight: FontWeight.bold ,color:  Color.fromARGB(255, 40, 53, 147)),),)
                  
                  
                    ),
                  openBuilder:(context, action) =>Project() ,
                ),
              
                        ],
                      ),
                    )
                  
          
        ),
      
    );
  }
}