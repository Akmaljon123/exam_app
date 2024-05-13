import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/savat.png")),

          const SizedBox(height: 10),

          Center(
            child: Text(
              "No Results Found",
              style: GoogleFonts.signika(
                  fontWeight: FontWeight.w400,
                  fontSize: 22,
                  color: const Color(0xFF696969)
              ),
            ),
          ),

          const SizedBox(height: 10),

          Center(
            child: Text(
              "Try searching for a different keywork\n          or tweek your search a little",
              style: GoogleFonts.signika(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xFFA9A9A9)
              ),
            ),
          ),
        ],
      ),
    );
  }
}
