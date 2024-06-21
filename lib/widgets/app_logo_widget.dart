import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogoWidget extends StatelessWidget {
  final double size;
  final Color color;
  const AppLogoWidget({
    super.key,
    this.size = 26,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enterprise',
            style: GoogleFonts.gabarito(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: size,
              color: color,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            'ON',
            style: GoogleFonts.gabarito(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: size,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'e',
            style: GoogleFonts.gabarito(
              textStyle: Theme.of(context).textTheme.displayLarge,
              fontSize: size,
              color: color,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
