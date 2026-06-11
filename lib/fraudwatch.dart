import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Fraudwatch extends StatefulWidget {
  const Fraudwatch({super.key});

  @override
  State<Fraudwatch> createState() => _FraudwatchState();
}

class _FraudwatchState extends State<Fraudwatch> {
  static const List<String> _images = [
    'assets/images/fw1.png',
    'assets/images/fw2.png',
    'assets/images/fw3.png',
    'assets/images/fw4.png',
    'assets/images/fw5.png',
    'assets/images/fw6.png',
  ];
  final Uri playstoreUrl =
      Uri.parse('https://play.google.com/store/apps/details?id=com.fw360.uk');

  Future<void> _launchplaystore() async {
    if (!await launchUrl(playstoreUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $playstoreUrl';
    }
  }

  final Uri appstoreUrl =
      Uri.parse('https://apps.apple.com/ng/app/fraud-watch-360/id6759293776');

  Future<void> _launchappstore() async {
    if (!await launchUrl(appstoreUrl, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $appstoreUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width > 720 ? 64 : 24,
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 230, 62, 33),
                            shape: BoxShape.circle),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Android & IOS',
                        style: GoogleFonts.spaceGrotesk(
                          color: Color.fromARGB(255, 230, 62, 33),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "FraudWatch360",
                    style: GoogleFonts.playfairDisplay(
                      color: Colors.white,
                      fontSize: 51,
                      fontWeight: FontWeight.w800,
                      height: 1.05,
                      letterSpacing: -1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'AI-powered scam detection & real-time fraud alerts to keep you safe.',
                    style: GoogleFonts.spaceGrotesk(
                      color: Color(0xFF8A8A9A),
                      fontSize: 15,
                      height: 1.7,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: _launchplaystore,
                    child: Text(
                      'View on Playstore',
                      style: TextStyle(
                          color: Color.fromARGB(255, 230, 62, 33),
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 230, 62, 33)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: _launchappstore,
                    child: Text(
                      'View on Appstore',
                      style: TextStyle(
                          color: Color.fromARGB(255, 230, 62, 33),
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 230, 62, 33)),
                    ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      Text(
                        'SCREENSHOTS',
                        style: GoogleFonts.spaceGrotesk(
                          color: Color(0xFF8A8A9A),
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 3,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          child:
                              Container(height: 1, color: Color(0xFF2A2A3A))),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 480,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _images.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 14),
                      itemBuilder: (context, i) => GestureDetector(
                        onTap: () => _openFullscreen(context, _images, i),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            _images[i],
                            width: 220,
                            height: 480,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 220,
                              height: 480,
                              decoration: BoxDecoration(
                                color: Color(0xFF1A1A26),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Color(0xFF2A2A3A)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.phone_android_rounded,
                                      color: Color(0xFF2A2A3A), size: 36),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Screen ${i + 1}',
                                    style: GoogleFonts.spaceGrotesk(
                                      color: Color(0xFF8A8A9A),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.swipe_rounded,
                          color: Color(0xFF8A8A9A), size: 13),
                      const SizedBox(width: 6),
                      Text(
                        'Swipe to see more  ·  tap to expand',
                        style: GoogleFonts.spaceGrotesk(
                          color: Color(0xFF8A8A9A),
                          fontSize: 11,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
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

  void _openFullscreen(
      BuildContext context, List<String> images, int startIndex) {
    Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        pageBuilder: (_, __, ___) =>
            _FullscreenGallery(images: images, initialIndex: startIndex),
        transitionsBuilder: (_, anim, __, child) =>
            FadeTransition(opacity: anim, child: child),
      ),
    );
  }
}

class _FullscreenGallery extends StatefulWidget {
  final List<String> images;
  final int initialIndex;

  const _FullscreenGallery({required this.images, required this.initialIndex});

  @override
  State<_FullscreenGallery> createState() => _FullscreenGalleryState();
}

class _FullscreenGalleryState extends State<_FullscreenGallery> {
  late PageController _pageController;
  late int _current;

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (i) => setState(() => _current = i),
            itemBuilder: (_, i) => Center(
              child: InteractiveViewer(
                child: Image.asset(
                  widget.images[i],
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => Container(
                    width: 220,
                    height: 440,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A26),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.image_not_supported_outlined,
                        color: Color(0xFF2A2A3A), size: 48),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 16,
            right: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF12121A),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xFF2A2A3A)),
                ),
                child: const Icon(Icons.close_rounded,
                    color: Color(0xFF8A8A9A), size: 20),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 32,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.images.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _current == i ? 20 : 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: _current == i
                        ? Color.fromARGB(255, 230, 62, 33)
                        : Color(0xFF8A8A9A).withOpacity(0.4),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
