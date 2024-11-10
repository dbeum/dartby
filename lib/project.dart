import 'package:carousel_slider/carousel_slider.dart';
import 'package:dartby/about.dart';
import 'package:dartby/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
   final _advancedDrawerController = AdvancedDrawerController();

   final Uri githubUrl = Uri.parse('https://github.com/dbeum');

 
  Future<void> _launchgithub() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(githubUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $githubUrl';
    }
  }
   final Uri cinemaUrl = Uri.parse('https://cinema-9f577.web.app/');

 
  Future<void> _launchcinema() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(cinemaUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $cinemaUrl';
    }
  }
 final Uri styleUrl = Uri.parse('https://styleby-14f06.web.app/');

 
  Future<void> _launchstyle() async {
    // Use launchUrl for web compatibility
    if (!await launchUrl(styleUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $styleUrl';
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
    return  AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color.fromARGB(255, 75,88,78), Colors.blueGrey.withOpacity(0.2)],
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
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
    
   child: Scaffold (
      extendBodyBehindAppBar: false,
      appBar: AppBar(backgroundColor: Colors.transparent,
      elevation:0,
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
      body: CarouselSlider(
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
            child: Image.asset( 'assets/images/logo.png' ,height: 100,)
            ),
            Row(children: [
               TextButton(onPressed:_launchcinema, child:   Container(
      
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
              child:Image.asset( 'assets/images/IMG_3285.jpg' ,height: 250,) 
              )),),
             
              Column(
                children: [
                  Text('Cinema Booking App', style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900, ))),
                  Row(children: [
                    
                  const    Text('Platform',style:TextStyle(color: Color.fromARGB(164, 0, 0, 0),fontWeight: FontWeight.bold)),
               SizedBox(width: 2,),
                  Text('Flutter'),
               
                    
                  ],),
                
  Text('An intuitive cinema',style: TextStyle(fontSize: 12),),
    Text('booking app that ',style: TextStyle(fontSize: 12),),
    Text('lets users browse',style: TextStyle(fontSize: 12),),
    Text('movies,select showtimes,',style: TextStyle(fontSize: 12),),
    Text('and reserve seats',style: TextStyle(fontSize: 12),),
      Text('all in a few taps.',style: TextStyle(fontSize: 12),),
               
                ],
              )
            ],),
             Align(alignment: Alignment.centerRight,
            child: Image.asset( 'assets/images/app.jpg' ,height: 100,)
            ),
            Align(alignment: Alignment.bottomCenter,
            child: Image.asset( 'assets/images/android.png' ,height: 100,)
            ),

          ] ,
        ),


        //ITEM 2


          Column(
          children:[
                Align(alignment: Alignment.topCenter,
            child: Image.asset( 'assets/images/styleby2.png' ,height: 100,)
            ),
            Row(children: [
               TextButton(onPressed: _launchstyle, child:   Container(
      
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
              child:Image.asset( 'assets/images/IMG_3382.jpg' ,height: 250,) 
              )),),
            
              Column(
                children: [
                  Text('Landing Page', style: GoogleFonts.sanchez(textStyle: const TextStyle(fontWeight: FontWeight.w900, ))),
                  Row(children: [
                    
                  const    Text('Platform',style:TextStyle(color: Color.fromARGB(164, 0, 0, 0),fontWeight: FontWeight.bold)),
               SizedBox(width: 2,),
                  Text('Flutter'),
               
                    
                  ],),
                
  Text('A sleek, modern',style: TextStyle(fontSize: 12),),
  Text('landing page for a',style: TextStyle(fontSize: 12),),
    Text('clothing brand that',style: TextStyle(fontSize: 12),),
     Text('lets users browse',style: TextStyle(fontSize: 12),),
    Text('movies,showcasing',style: TextStyle(fontSize: 12),),
      Text('products with a ',style: TextStyle(fontSize: 12),),
      Text('clean design and',style: TextStyle(fontSize: 12),),
               Text('seamless user',style: TextStyle(fontSize: 12),),
                 Text('experience.',style: TextStyle(fontSize: 12),),
                ],
              )
            ],),
             Align(alignment: Alignment.centerRight,
            child: Image.asset( 'assets/images/web.png' ,height: 100,)
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
      ),
       drawer: SafeArea(
        child: Container(
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 128.0,
                  height: 128.0,
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
                ListTile(
                  onTap: () =>Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),)),
                  leading: Icon(Icons.home_work_rounded,color: Colors.black,),
                  title: Text('Home'),
                ),
                ListTile(
                  onTap: _launchgithub,
                  leading: Image.asset( 'assets/images/github.png' ,height: 30,),
                  title: Text('Github'),
                ),
                ListTile(
                  onTap: _launchEmail,
                  leading: Image.asset( 'assets/images/gmail.png' ,height: 30,),
                  title: Text('Mail'),
                ),
                ListTile(
                  onTap: () {},
                  leading:  Image.asset( 'assets/images/whatsapp.png' ,height: 30,),
                  title: Text('Whatsapp'),
                ),
                Spacer(),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text('Terms of Service | Privacy Policy'),
                  ),
                ),
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
    