import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
//import 'package:path_provider/path_provider.dart';
import 'dart:io';

class Admin_UserPage extends StatefulWidget {
  const Admin_UserPage({super.key});

  @override
  State<Admin_UserPage> createState() => _AdminUserpageState();
}

class _AdminUserpageState extends State<Admin_UserPage> {
  String searchQuery = "";
  List<QueryDocumentSnapshot> filteredPatients = [];
  List<QueryDocumentSnapshot> allPatients = [];

  // Fetch the list of patients
  Future<void> _fetchPatients() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    setState(() {
      allPatients = snapshot.docs;
      filteredPatients = allPatients.where((patient) {
        final patientId = patient.id.toLowerCase();
        return patientId.contains(searchQuery.toLowerCase());
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPatients();
  }

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
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 0.0, left: 16.0, right: 16.0),
                      child: Text(
                        'Personal Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search by Patient ID',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  _fetchPatients(); // Re-fetch the patients when search query changes
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPatients.length,
              itemBuilder: (context, index) {
                final patientId = filteredPatients[index].id;
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(155, 177, 104, 1.0),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 5.0,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text('Patient ID: $patientId'),
                    subtitle: const Text('Tap to view members'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MembersPage(patientId: patientId),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MembersPage extends StatelessWidget {
  final String patientId; // Pass the patientId to query specific user's data

  const MembersPage({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
        centerTitle: true,
        title: const Text('Members'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // Firestore query to fetch documents from the members collection
        stream: FirebaseFirestore.instance
            .collection('users') // Parent collection (users)
            .doc(patientId) // Specific user document (patientId)
            .collection('members') // Subcollection (members)
            .snapshots(), // Listen for updates to the data
        builder: (context, snapshot) {
          // Handling the connection state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show loading spinner
          }

          if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Handle error
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No members found.')); // Handle no data
          }
          // Extracting data from the snapshot
          final members = snapshot.data!.docs;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final memberData =
                        members[index].data() as Map<String, dynamic>;
                    final answers = memberData['answers'];
                    final details =
                        memberData['details'] as Map<String, dynamic>?;
                    final name = details?['Name'] ?? 'No Name';

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        color: const Color.fromRGBO(155, 177, 104, 1.0),
                        child: ListTile(
                          title: Text(
                            '$name',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: const Text(
                            'Tap to view details',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          onTap: () {
                            print(name);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MemberDetailsPage(
                                  memberId: '${index + 1}',
                                  answers: answers,
                                  details: details,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MemberDetailsPage extends StatelessWidget {
  final String memberId;
  final dynamic answers; // Keep answers as dynamic
  final Map<String, dynamic>? details;

  const MemberDetailsPage({super.key, 
    required this.memberId,
    this.answers,
    this.details,
  });

  Future<void> savePdfToPublicDirectory(
      pw.Document pdf, BuildContext context, String directoryType) async {
    try {
      Directory directory;
      if (directoryType == 'Downloads') {
        directory = Directory('/storage/emulated/0/Download');
      } else if (directoryType == 'Documents') {
        directory = Directory('/storage/emulated/0/Documents');
      } else {
        throw Exception('Unsupported directory type');
      }

      // Ensure the directory exists
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

    String name = details?['Name'] ?? 'Unknown';
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String fileName = '${name}_$timestamp.pdf';

    // Save the PDF file
    final file = File('${directory.path}/$fileName');
    await file.writeAsBytes(await pdf.save());
      // Save the PDF file
     // final file = File('${directory.path}/MemberDetails.pdf');
      // await file.writeAsBytes(await pdf.save());

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved to: ${file.path}')),
      );
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save PDF: $e')),
      );
    }
  }

  Future<void> generatePDF(BuildContext context, String directoryType) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text('Member ID: $memberId',
                  style: const pw.TextStyle(fontSize: 18)),
              pw.SizedBox(height: 10),
              pw.Text('Answers:',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              if (answers != null) ...[
                if (answers is List) ...[
                  for (var answer in answers!)
                    pw.Text('Answer: $answer',
                        style: const pw.TextStyle(fontSize: 14)),
                ] else if (answers is Map) ...[
                  for (var entry in (answers as Map).entries)
                    pw.Text('${entry.key}: ${entry.value}',
                        style: const pw.TextStyle(fontSize: 14)),
                ],
              ],
              pw.SizedBox(height: 20),
              pw.Text('Details:',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              if (details != null) ...[
                for (var entry in details!.entries)
                  pw.Text('${entry.key}: ${entry.value}',
                      style: const pw.TextStyle(fontSize: 14)),
              ],
            ],
          );
        },
      ),
    );

    await savePdfToPublicDirectory(pdf, context, directoryType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
        centerTitle: true,
        title: const Text('Member Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Member ID: $memberId', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            const Text('Answers:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (answers != null) ...[
              if (answers is List) ...[
                for (var answer in answers!)
                  Text('Answer: $answer', style: const TextStyle(fontSize: 14)),
              ] else if (answers is Map) ...[
                for (var entry in answers.entries)
                  Text('${entry.key}: ${entry.value}',
                      style: const TextStyle(fontSize: 14)),
              ],
            ],
            const SizedBox(height: 20),
            const Text('Details:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (details != null) ...[
              for (var entry in details!.entries)
                Text('${entry.key}: ${entry.value}',
                    style: const TextStyle(fontSize: 14)),
            ],
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.extended(
            heroTag: 'save_to_downloads', // Unique heroTag
            onPressed: () => generatePDF(context, 'Downloads'),
            label: const Text('Save to Downloads'),
            icon: const Icon(Icons.download),
            backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
          ),
          const SizedBox(height: 10),
          FloatingActionButton.extended(
            heroTag: 'save_to_documents', // Unique heroTag
            onPressed: () => generatePDF(context, 'Documents'),
            label: const Text('Save to Documents'),
            icon: const Icon(Icons.folder),
            backgroundColor: const Color.fromRGBO(155, 177, 104, 1.0),
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
    var width = size.width;
    path.quadraticBezierTo(
        width / 2, size.height, size.width, size.height - curveHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
