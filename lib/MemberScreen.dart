import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:MindIt/AgeSelectionPage.dart';
import 'package:MindIt/variable.dart';
import 'SignUpPage.dart';

class MemberScreen extends StatefulWidget {
  // The login number
  const MemberScreen({super.key, required String phoneNumber});
  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  late List<String> existingMembers =
      []; // Replace with ["Member 1", "Member 2"] to show members.
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    checkUserAndLoadMembers();
  }

  void nameequals(String member) {
    String loginName = caretaker.toLowerCase().replaceAll(" ", "");
    String memberName = member.toLowerCase().replaceAll(" ", "");

    // Check if the existing name contains the login name or vice versa
    if (loginName.contains(memberName) || memberName.contains(loginName)) {
      others = false;
    } else {
      others = true;
    }
  }

  Future<void> checkUserAndLoadMembers() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(patientid)
          .get();

      if (userDoc.exists) {
        final subCollection = await FirebaseFirestore.instance
            .collection('users')
            .doc(patientid)
            .collection('members')
            .get();

        setState(() {
          existingMembers = subCollection.docs.map((doc) => doc.id).toList();
          isLoading = false;
        });
      } else {
        // No user exists
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
     // print('Error loading members: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(selectedLanguage == 'English'
            ? "Welcome $caretaker"
            : "வணக்கம் $caretaker"),
        centerTitle: true,
        backgroundColor: const Color(0xFF9BB168), // Light green color
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            height: 125, // Adjusted height to fit the Lottie animation
            color: const Color(0xFF9BB168), // Green background
            child: Center(
              child: Lottie.asset(
                'assets/animations/Welcome.json', // Path to your Lottie file
                width: 280, // Adjust the size to fit the design
                height: 280,
                repeat: true, // Loop the animation
                // reverse: true,      // Reverse the animation
                animate: true, // Automatically play animation
                frameRate: FrameRate.max,
                // fit: BoxFit.contain,
                // /home/user/myapp/assets/animations/Welcome.json
              ),
            ),
          ),
          ClipPath(
            clipper: RoundedClipper(),
            child: Container(
              height: 30,
              color: const Color(0xFF9BB168),
            ),
          ),

          const SizedBox(height: 20),

          // Show "Select whom you are entering" if there are existing members
          if (existingMembers.isNotEmpty) ...[
            Text(
              selectedLanguage == 'English'
                  ? 'Select for whom you are entering..'
                  : 'யாருக்காக விவரங்களை உள்ளிடுகிறீர்கள் என்பதைத் தேர்ந்தெடுக்கவும்..',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: existingMembers.map((member) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20.0), // Adds space between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        answersfor = member;
                        nameequals(member);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AgeSelectionPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color(0xFF9BB168), // Light green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        minimumSize:
                            const Size(200, 50), // Fixed width & height
                        maximumSize: const Size(200, 50), // Prevent expansion
                      ),
                      child: Text(
                        member,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center, // Center aligns text
                        maxLines: 2, // Wraps text to two lines if too long
                        overflow: TextOverflow
                            .ellipsis, // Adds ellipsis if text overflows
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],

          if (existingMembers.isEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9BB168), // Light green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Center(
                  child: Text(
                    selectedLanguage == 'English'
                        ? 'Add a New Member'
                        : 'புதிய உறுப்பினரைச் சேர்க்க',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],

          if (existingMembers.isNotEmpty) ...[
            const SizedBox(height: 10),
            Center(
              child: Text(
                selectedLanguage == 'English' ? 'Or' : 'அல்லது',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF9BB168), // Light green color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Center(
                  child: Text(
                    selectedLanguage == 'English'
                        ? 'Add a New Member'
                        : 'புதிய உறுப்பினரைச் சேர்க்க',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// Rounded clipper for the bar below AppBar
class RoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 20);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 20,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
