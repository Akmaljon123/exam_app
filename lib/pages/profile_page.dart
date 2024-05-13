import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
                "Profile",
              textAlign: TextAlign.center,
              style: GoogleFonts.signika(
                fontSize: 42,
                color: Colors.black,
                fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 40),

            const CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/akmaljon.jpg")
            ),

            const SizedBox(height: 10),

            Text(
              "Akmaljon Ahmadjonov",
              textAlign: TextAlign.center,
              style: GoogleFonts.signika(
                  fontSize: 25,
                  color: const Color(0xFF272727),
                  fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Flutter developer",
              textAlign: TextAlign.center,
              style: GoogleFonts.signika(
                  fontSize: 16,
                  color: const Color(0xFFA1A1A1),
                  fontWeight: FontWeight.w600
              ),
            ),

            const SizedBox(height: 15),


            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFFF8EE)
                  ),
                  child: Image.asset("assets/images/profile.png"),
                ),

                const SizedBox(width: 15),

                Text(
                  "Edit Profile",
                  style: GoogleFonts.signika(
                      fontSize: 17,
                      color: const Color(0xFF707070),
                      fontWeight: FontWeight.w400
                  ),
                ),

                const SizedBox(width: 180),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Color(0xFF707070),
                )
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFF8EE)
                  ),
                  child: Image.asset("assets/images/star.png"),
                ),

                const SizedBox(width: 15),

                Text(
                  "Renew Plans",
                  style: GoogleFonts.signika(
                      fontSize: 17,
                      color: const Color(0xFF707070),
                      fontWeight: FontWeight.w400
                  ),
                ),

                const SizedBox(width: 170),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Color(0xFF707070),
                )
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFF8EE)
                  ),
                  child: Image.asset("assets/images/setting.png"),
                ),

                const SizedBox(width: 15),

                Text(
                  "Settings",
                  style: GoogleFonts.signika(
                      fontSize: 17,
                      color: const Color(0xFF707070),
                      fontWeight: FontWeight.w400
                  ),
                ),

                const SizedBox(width: 210),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Color(0xFF707070),
                )
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFF8EE)
                  ),
                  child: Image.asset("assets/images/star.png"),
                ),

                const SizedBox(width: 15),

                Text(
                  "Terms & Privacy Policy",
                  style: GoogleFonts.signika(
                      fontSize: 17,
                      color: const Color(0xFF707070),
                      fontWeight: FontWeight.w400
                  ),
                ),

                const SizedBox(width: 100),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Color(0xFF707070),
                )
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const SizedBox(width: 20),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFF8EE)
                  ),
                  child: Image.asset("assets/images/logout.png"),
                ),

                const SizedBox(width: 15),

                Text(
                  "Log out",
                  style: GoogleFonts.signika(
                      fontSize: 17,
                      color: const Color(0xFF707070),
                      fontWeight: FontWeight.w400
                  ),
                ),

                const SizedBox(width: 220),

                const Icon(
                  Icons.arrow_forward_ios,
                  size: 24,
                  color: Color(0xFF707070),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
