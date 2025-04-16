import 'package:flutter/material.dart';
import 'package:MindIt/LoginPage.dart';
import 'package:MindIt/variable.dart';

class LanguageSwitchPage extends StatefulWidget {
  const LanguageSwitchPage({super.key});

  @override
  _LanguageSwitchPageState createState() => _LanguageSwitchPageState();
}

class _LanguageSwitchPageState extends State<LanguageSwitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200.0),
        child: ClipPath(
          clipper: RoundedAppBarClipper(curveHeight: 30.0),
          child: Container(
            color: const Color.fromRGBO(155, 177, 104, 1.0),
            child: const Center(
              child: Text(
                ' Select Language/ மொழியைத் தேர்ந்தெடுக்கவும்',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose your preferred language/உங்களுக்கு விருப்பமான மொழியை தேர்வு செய்யவும்:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(30, 42, 74, 1.0),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                _languageContainer(
                  'English',
                  'assets/english.jpg',
                ),
                const SizedBox(height: 20),
                _languageContainer(
                  'தமிழ்',
                  'assets/tamil.jpg',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedLanguage == 'English') {
                    //Navigator.pushNamed(context, '/LoginPage.dart');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                        settings: const RouteSettings(name: 'login'),
                      ),
                    );
                  } else if (selectedLanguage == 'தமிழ்') {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                        settings: const RouteSettings(name: 'login'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text(
                  'Confirm/உறுதிப்படுத்தவும்',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _languageContainer(String language, String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: selectedLanguage == language
              ? const Color.fromRGBO(155, 177, 104, 1.0)
              : Colors.grey[200],
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 80,
            ),
            const SizedBox(width: 20),
            Text(
              language,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selectedLanguage == language
                    ? Colors.white
                    : const Color.fromRGBO(30, 42, 74, 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedAppBarClipper extends CustomClipper<Path> {
  final double curveHeight;

  RoundedAppBarClipper({required this.curveHeight});

  @override
  Path getClip(Size size) {
    final Path path = Path()
      ..lineTo(0.0, size.height - curveHeight)
      ..quadraticBezierTo(
          size.width / 2, size.height, size.width, size.height - curveHeight)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
// class MyCustomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     var path = Path();
//     path.lineTo(0.0, size.height - 50);

//     var firstControlPoint = Offset(size.width / 4, size.height);
//     var firstEndPoint = Offset(size.width / 2, size.height - 50.0);
//     path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//         firstEndPoint.dx, firstEndPoint.dy);

//     var secondControlPoint =
//         Offset(size.width - (size.width / 4), size.height - 100);
//     var secondEndPoint = Offset(size.width, size.height - 50);
//     path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//         secondEndPoint.dx, secondEndPoint.dy);

//     path.lineTo(size.width, 0.0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
