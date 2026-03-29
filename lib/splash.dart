import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:porichoy/login.dart';


class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}
bool zoomDone=false;

class _splashState extends State<splash> with TickerProviderStateMixin{

  late AnimationController _zoomController;

  late Animation<double> _zoomAnimation;

  final Color bg = Color(0xFFF5F5F5);
  final Color textColor = Color(0xFF1A1A1A);
  @override

  void initState(){
    super.initState();
    animation();
    Future.delayed(
        Duration(seconds: 4) ,(){
      if(mounted){
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const login())
        );

      }
    }
    );
  }
  void animation() async {
    _zoomController=AnimationController(
      duration: Duration(milliseconds: 1400),
      vsync: this,
    );

    _zoomAnimation = Tween<double>(begin: 4.0, end: 1.5).animate(CurvedAnimation(parent: _zoomController, curve: Curves.easeInBack),
    );

    await _zoomController.forward();
    if(mounted){
      setState(() {
        zoomDone = true;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: AnimatedBuilder(
        animation: _zoomController,
        builder: (context,child){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: _zoomAnimation.value,
                  child: Image.asset('assets/pictures/porichoy.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 05),
                if(zoomDone)
                  DefaultTextStyle(style: GoogleFonts.hindSiliguri(
                    fontSize: 20,
                    color: textColor,
                  ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'পরিচয় আপনার, দায়িত্ব আমাদের',
                            speed: const Duration(milliseconds: 110),
                            cursor: '',
                          ),
                        ],
                        isRepeatingAnimation: false,
                        displayFullTextOnTap: true,
                      )
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
