import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'HomeScreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/images/image1.png')),
            const SizedBox(
              height: 36,
            ),
            Text(
              'Find Your Favouet Course',
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: Color(0xff232323),
              ),
            ),
            SizedBox(
              height: 9,
            ),
            Text(
              'Lorem ipsum dolor sit amet, consetetur\n sadipscing elitr, sed diam nonumy eirmod\n tempor invidunt ut labore et dolore',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Color(0xffBBBBBB),
              ),
            ),
            SizedBox(
              height: 129,
            ),
            GestureDetector(
              onTap: () {

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                      (route) {
                    return false;
                  },
                );
              },
              child: Container(
                width: 315,
                height: 56,
                alignment: Alignment.center,
                child: Text(
                  'Get Start',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Color(0xffFFFFFF),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(34.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
