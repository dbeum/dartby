import 'package:dartby/aria.dart';
import 'package:dartby/dotby.dart';
import 'package:dartby/finova.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dartby/weather.dart';

class MobileApps extends StatefulWidget {
  const MobileApps({super.key});

  @override
  State<MobileApps> createState() => _MobileAppsState();
}

class _MobileAppsState extends State<MobileApps> {
  int _hoveredIndex = -1;

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'entrydirect@gmail.com',
      query: Uri.encodeFull(
          'subject=Hello&body=I would like to reach you regarding...'),
    );
    await launchUrl(uri);
  }

  void _push(Widget page) =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => page));

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 720;
    final hPad = isWide ? 40.0 : 20.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              scrolledUnderElevation: 0,
              flexibleSpace: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => _launch(
                            'https://www.linkedin.com/in/isaac-olowofela-b77767223'),
                        child: Text(
                          'LinkedIn',
                          style: GoogleFonts.dmMono(
                            color: const Color(0xFF6E6E82),
                            fontSize: 12,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      GestureDetector(
                        onTap: _launchEmail,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color(0xFFE63E21), width: 1.5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Contact',
                            style: GoogleFonts.dmMono(
                              color: const Color(0xFFE63E21),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: hPad),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 64),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'FLUTTER DEVELOPER',
                              style: GoogleFonts.dmMono(
                                color: const Color(0xFFE63E21),
                                fontSize: 11,
                                letterSpacing: 2.5,
                              ),
                            ),
                            const SizedBox(height: 14),
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.playfairDisplay(
                                  color: const Color(0xFFF0EEE8),
                                  fontSize: isWide ? 64 : 40,
                                  fontWeight: FontWeight.w700,
                                  height: 1.0,
                                  letterSpacing: -1,
                                ),
                                children: [
                                  const TextSpan(text: 'Crafting apps\nthat '),
                                  TextSpan(
                                    text: 'feel',
                                    style: GoogleFonts.playfairDisplay(
                                      color: const Color(0xFFE63E21),
                                      fontSize: isWide ? 64 : 40,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  const TextSpan(text: '\nright.'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Production-grade mobile experiences\nfor Android & iOS — built with Flutter,\ndesigned with intent.',
                              style: GoogleFonts.dmMono(
                                color: const Color(0xFF6E6E82),
                                fontSize: 13,
                                height: 1.7,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isWide) ...[
                        const SizedBox(width: 32),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: GoogleFonts.playfairDisplay(
                                  color: const Color(0xFFF0EEE8),
                                  fontSize: 56,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: -2,
                                ),
                                children: [
                                  const TextSpan(text: '0'),
                                  TextSpan(
                                    text: '6',
                                    style: GoogleFonts.playfairDisplay(
                                      color: const Color(0xFFE63E21),
                                      fontSize: 56,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'SELECTED PROJECTS',
                              style: GoogleFonts.dmMono(
                                color: const Color(0xFF6E6E82),
                                fontSize: 10,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Text(
                        'SELECTED WORK',
                        style: GoogleFonts.dmMono(
                          color: const Color(0xFF6E6E82),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 3,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Container(
                              height: 1, color: const Color(0xFF1E1E2E))),
                    ],
                  ),
                  const SizedBox(height: 24),
                  if (isWide)
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.05,
                      children: [
                        _buildProjectCard(
                          index: 0,
                          title: 'Dotby',
                          subtitle: 'Production',
                          tag: 'Android & iOS',
                          tagColor: const Color(0xFF4CAF50),
                          imagePath: 'assets/images/dotby2.png',
                          description:
                              'A sleek production-grade Android application with a refined user experience.',
                          onTap: () => _push(Dotby()),
                        ),
                        _buildProjectCard(
                          index: 1,
                          title: 'Aria Luxury',
                          subtitle: 'Car Rental App',
                          tag: 'Android & iOS',
                          tagColor: const Color(0xFF4A90D9),
                          imagePath: 'assets/images/aria1.png',
                          description:
                              'A premium car rental experience with a sleek and intuitive interface.',
                          onTap: () => _push(Aria()),
                        ),
                        _buildProjectCard(
                          index: 2,
                          title: 'Finova Africa',
                          subtitle: 'Fintech Core Banking',
                          tag: 'Android',
                          tagColor: const Color(0xFF4A90D9),
                          imagePath: 'assets/images/fin2.png',
                          description:
                              'A core banking solution built for the African fintech ecosystem.',
                          onTap: () => _push(Finova()),
                        ),
                        _buildProjectCard(
                          index: 3,
                          title: 'Moon Weather',
                          subtitle: 'Forecast App',
                          tag: 'Android',
                          tagColor: const Color(0xFF7B68EE),
                          imagePath: 'assets/images/wm.png',
                          description:
                              'Real-time weather forecasting with a beautiful lunar-inspired interface.',
                          onTap: () => _push(moonWeather()),
                        ),
                        _buildProjectCard(
                          index: 4,
                          title: 'Spotify Clone',
                          subtitle: 'Music Streaming',
                          tag: 'Android',
                          tagColor: const Color(0xFF1DB954),
                          imagePath: 'assets/images/spotify.png',
                          description:
                              'Full-featured music streaming UI clone with playback controls.',
                          onTap: () => _launch(
                              'https://drive.google.com/file/d/1KqZFygRNSjah-sCUN64dPKc9TS86IKTp/view?usp=drive_link'),
                        ),
                        _buildProjectCard(
                          index: 5,
                          title: 'StreamNest',
                          subtitle: 'Video Platform',
                          tag: 'Android & Web',
                          tagColor: const Color(0xFFE53935),
                          imagePath: 'assets/images/sn.jpeg',
                          description:
                              'A modern video streaming platform with adaptive playback.',
                          onTap: () =>
                              _launch('https://stream-nest-alpha.vercel.app/'),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        _buildProjectCard(
                          index: 0,
                          title: 'Dotby',
                          subtitle: 'Production',
                          tag: 'Android & iOS',
                          tagColor: const Color(0xFF4CAF50),
                          imagePath: 'assets/images/dotby2.png',
                          description:
                              'A sleek production-grade Android application with a refined user experience.',
                          onTap: () => _push(Dotby()),
                          mobileHeight: 400,
                        ),
                        const SizedBox(height: 16),
                        _buildProjectCard(
                          index: 1,
                          title: 'Aria Luxury',
                          subtitle: 'Car Rental App',
                          tag: 'Android & iOS',
                          tagColor: const Color(0xFF4A90D9),
                          imagePath: 'assets/images/aria1.png',
                          description:
                              'A premium car rental experience with a sleek and intuitive interface.',
                          onTap: () => _push(Aria()),
                          mobileHeight: 400,
                        ),
                        const SizedBox(height: 16),
                        _buildProjectCard(
                          index: 2,
                          title: 'Finova Africa',
                          subtitle: 'Fintech Core Banking',
                          tag: 'Android',
                          tagColor: const Color(0xFF4A90D9),
                          imagePath: 'assets/images/fin2.png',
                          description:
                              'A core banking solution built for the African fintech ecosystem.',
                          onTap: () => _push(Finova()),
                          mobileHeight: 400,
                        ),
                        const SizedBox(height: 16),
                        _buildProjectCard(
                          index: 3,
                          title: 'Moon Weather',
                          subtitle: 'Forecast App',
                          tag: 'Android',
                          tagColor: const Color(0xFF7B68EE),
                          imagePath: 'assets/images/wm.png',
                          description:
                              'Real-time weather forecasting with a beautiful lunar-inspired interface.',
                          onTap: () => _push(moonWeather()),
                          mobileHeight: 400,
                        ),
                        const SizedBox(height: 16),
                        _buildProjectCard(
                          index: 4,
                          title: 'Spotify Clone',
                          subtitle: 'Music Streaming',
                          tag: 'Android',
                          tagColor: const Color(0xFF1DB954),
                          imagePath: 'assets/images/spotify.png',
                          description:
                              'Full-featured music streaming UI clone with playback controls.',
                          onTap: () => _launch(
                              'https://drive.google.com/file/d/1KqZFygRNSjah-sCUN64dPKc9TS86IKTp/view?usp=drive_link'),
                          mobileHeight: 400,
                        ),
                        const SizedBox(height: 16),
                        _buildProjectCard(
                          index: 5,
                          title: 'StreamNest',
                          subtitle: 'Video Platform',
                          tag: 'Android & Web',
                          tagColor: const Color(0xFFE53935),
                          imagePath: 'assets/images/sn.jpeg',
                          description:
                              'A modern video streaming platform with adaptive playback.',
                          onTap: () =>
                              _launch('https://stream-nest-alpha.vercel.app/'),
                          mobileHeight: 400,
                        ),
                      ],
                    ),
                  const SizedBox(height: 72),
                  Container(
                    padding: const EdgeInsets.all(48),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFF1E1E2E), width: 1.5),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: isWide
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              _buildCtaText(),
                              const SizedBox(width: 32),
                              _buildEmailButton(),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildCtaText(),
                              const SizedBox(height: 32),
                              _buildEmailButton(),
                            ],
                          ),
                  ),
                  const SizedBox(height: 64),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCtaText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'OPEN TO WORK',
          style: GoogleFonts.dmMono(
            color: const Color(0xFFE63E21),
            fontSize: 10,
            letterSpacing: 2.5,
          ),
        ),
        const SizedBox(height: 12),
        RichText(
          text: TextSpan(
            style: GoogleFonts.playfairDisplay(
              color: const Color(0xFFF0EEE8),
              fontSize: 32,
              fontWeight: FontWeight.w700,
              height: 1.1,
              letterSpacing: -0.5,
            ),
            children: const [
              TextSpan(text: "Let's build\n"),
              TextSpan(
                text: 'something great.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Have a project in mind? I'd love to hear about it.",
          style: GoogleFonts.dmMono(
            color: const Color(0xFF6E6E82),
            fontSize: 12,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildEmailButton() {
    return GestureDetector(
      onTap: _launchEmail,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFE63E21).withOpacity(0.45),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFE63E21),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              'entrydirect@gmail.com',
              style: GoogleFonts.dmMono(
                color: const Color(0xFFF0EEE8),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required int index,
    required String title,
    required String subtitle,
    required String tag,
    required Color tagColor,
    required String imagePath,
    required String description,
    required VoidCallback onTap,
    double? mobileHeight,
  }) {
    final isHovered = _hoveredIndex == index;

    final card = MouseRegion(
      onEnter: (_) => setState(() => _hoveredIndex = index),
      onExit: (_) => setState(() => _hoveredIndex = -1),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isHovered
                  ? const Color(0xFFE63E21).withOpacity(0.45)
                  : const Color(0xFF6E6E82),
              width: 1.5,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(14)),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          color: const Color(0xFF13131C),
                          child: const Center(
                            child: Icon(Icons.image_outlined,
                                color: Color(0xFF1E1E2E), size: 48),
                          ),
                        ),
                      ),
                      const DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Color(0x9912121A)],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 14,
                        left: 14,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: tagColor.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: tagColor.withOpacity(0.4), width: 1),
                          ),
                          child: Text(
                            tag,
                            style: GoogleFonts.dmMono(
                              color: tagColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                      if (isHovered)
                        Positioned(
                          top: 14,
                          right: 14,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE63E21),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.arrow_outward,
                                color: Colors.white, size: 16),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      subtitle.toUpperCase(),
                      style: GoogleFonts.dmMono(
                        color: const Color(0xFF6E6E82),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      title,
                      style: GoogleFonts.playfairDisplay(
                        color: isHovered
                            ? const Color(0xFFE63E21)
                            : const Color(0xFFF0EEE8),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      description,
                      style: GoogleFonts.dmMono(
                        color: const Color(0xFF6E6E82),
                        fontSize: 12,
                        height: 1.65,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return mobileHeight != null
        ? SizedBox(height: mobileHeight, child: card)
        : card;
  }
}
