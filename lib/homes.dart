import 'package:dartby/Mobile%20view/project.dart';
import 'package:dartby/Desktop%20View/project2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
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
    return Project();
  }

  Widget DeskTopNavBar() {
    return Project2();
  }
}
