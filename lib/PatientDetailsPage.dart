import 'package:flutter/material.dart';
import 'variable.dart';

class PatientDetailsPage extends StatelessWidget {
  final String patientId;
  final Map<String, dynamic> patientData;

  const PatientDetailsPage({
    super.key,
    required this.patientId,
    required this.patientData,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ClipPath(
                clipper: RoundedAppBarClipper(curveHeight: 30.0),
                child: Container(
                  color: const Color.fromRGBO(155, 177, 104, 1.0),
                  height: 180,
                  child: Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 0.0, left: 16.0, right: 16.0),
                      child: Text(
                        selectedLanguage == 'English'
                            ? 'Personal Details'
                            : 'தனிப்பட்ட விவரங்கள்',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedLanguage == 'English'
                        ? 'Patient ID: $patientId'
                        : 'நோயாளி அடையாள எண்: $patientId',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    selectedLanguage == 'English' ? '  Answers:' : '  பதில்கள்',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: patientData['answers'].length,
                    itemBuilder: (context, index) {
                      final entry =
                          patientData['answers'].entries.elementAt(index);
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Column(
                          // Use Column for question-answer to stack vertically
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              entry.key,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              entry.value.toString(),
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                              softWrap:
                                  true, // Ensure text wraps to the next line
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(
                          155, 177, 104, 1.0), // Button color
                    ),
                    child:
                        Text(selectedLanguage == 'English' ? 'Close' : 'மூடு'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedAppBarClipper extends CustomClipper<Path> {
  final double curveHeight;

  RoundedAppBarClipper({this.curveHeight = 30.0});

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - curveHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
