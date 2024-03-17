import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_kids/login.dart';
import 'package:mobile_application_kids/teacherchat.dart';
import 'package:mobile_application_kids/teacherhome.dart';

import 'ChatScreen.dart';

class TeacherProfilePage extends StatefulWidget {
  final String? uid; // Make uid nullable

  TeacherProfilePage({required this.uid, Key? key});

  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState(uid);
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  late User? user;
  late final Stream<QuerySnapshot> _usersStream;
  late String fullName = "";
  late String email = "";
  late String state = "";
  late String capacity = "";
  late String school = "";
  late Map<String, dynamic> targetDoc;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String uid;

  _TeacherProfilePageState(uid) {
    this.uid = uid;
  }

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;
    initializeStreams();

    getUserData();
  }

  void initializeStreams() {
    print("Document does not exist " + uid);
    FirebaseFirestore.instance
        .collection('users')
        .doc(
            uid) // Assuming you want to get a specific document based on the user's UID
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // Access the data of the document
        targetDoc = documentSnapshot.data() as Map<String, dynamic>? ?? {};
        print("doc" + targetDoc.toString());
        // Check if the document ID matches a specific value
        setState(() {
          // Process the document data
          fullName = targetDoc['fullName'];
          email = targetDoc['email'];
          state = targetDoc['state'];
          capacity = targetDoc['enrolmentCapacity'];
          school = targetDoc['school'];
        });
        print(
            "Full Name: $fullName, Email: $email, State: $state, Capacity: $capacity, School: $school");
      } else {
        print("Document does not exist");
      }
    }).catchError((error) {
      print("Error getting document: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the back button press
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            Text(
              'Profile  ',
              style: TextStyle(
                color: Color(0xFF554994),
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                height: 0.04,
                letterSpacing: -0.96,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bright Sparkle ',
                style: TextStyle(
                  color: Color(0xFF11324D),
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.04,
                  letterSpacing: -0.96,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 30, 0, 0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Container(
                      width: 363,
                      height: 77,
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 77,
                            height: 77,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage("lib/assets/Ellipse 8.png"),
                                fit: BoxFit.cover,
                              ),
                              shape: OvalBorder(),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 12.32,
                                  offset: Offset(0, 3.08),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 120),
                          SizedBox(
                            width: 148,
                            child: Text(
                              'Bright Spark',
                              style: TextStyle(
                                color: Color(0xFF473D7F),
                                fontSize: 23,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 139,
                        height: 42,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Text(
                                'Full Name',
                                style: TextStyle(
                                  color: Color(0xFF797C7B),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0.07,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 4,
                              top: 24,
                              child: Text(
                                fullName,
                                style: TextStyle(
                                  color: Color(0xFF000D07),
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0.06,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 265,
                          height: 42,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Email Address',
                                  style: TextStyle(
                                    color: Color(0xFF797C7B),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 4,
                                top: 24,
                                child: Text(
                                  email,
                                  style: TextStyle(
                                    color: Color(0xFF000D07),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 291,
                          height: 42,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                    color: Color(0xFF797C7B),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 4,
                                top: 24,
                                child: Text(
                                  state,
                                  style: TextStyle(
                                    color: Color(0xFF000D07),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 291,
                          height: 42,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'Capacity',
                                  style: TextStyle(
                                    color: Color(0xFF797C7B),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 4,
                                top: 24,
                                child: Text(
                                  capacity,
                                  style: TextStyle(
                                    color: Color(0xFF000D07),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(height: 10),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 291,
                          height: 42,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Text(
                                  'School',
                                  style: TextStyle(
                                    color: Color(0xFF797C7B),
                                    fontSize: 14,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.07,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 4,
                                top: 24,
                                child: Text(
                                  school,
                                  style: TextStyle(
                                    color: Color(0xFF000D07),
                                    fontSize: 18,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0.06,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          width: 80,
                          height: 24,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.help,
                                color: const Color.fromARGB(255, 185, 184, 179),
                                size: 30.0,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Help',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => {},
                          child: Container(
                            width: 92,
                            height: 24,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.info,
                                  color:
                                      const Color.fromARGB(255, 166, 165, 160),
                                  size: 30.0,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'About',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            _signOut(context);
                          },
                          child: Container(
                            width: 110,
                            height: 24,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.home,
                                  color:
                                      const Color.fromARGB(255, 212, 212, 207),
                                  size: 30.0,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                )),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Colors.blue,
          onTap: (index) {
            // Handle bottom navigation item tap
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherHomePage()),
              );
            }
            if (index == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            }
            if (index == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TeacherProfilePage(uid: user?.uid)),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> _signOut(context) async {
    try {
      await _auth.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginPage(backgroundColor: Color.fromARGB(255, 255, 255, 255))),
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  // Define a function to fetch user data from Firestore
  Future<void> getUserData() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user
            ?.uid) // Assuming you want to get a specific document based on the user's UID
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        // Access the data of the document
        targetDoc = documentSnapshot.data() as Map<String, dynamic>? ?? {};

        // Check if the document ID matches a specific value
        setState(() {
          // Process the document data
          fullName = targetDoc['fullName'];
          String email = targetDoc['email'];
          String state = targetDoc['state'];
          String capacity = targetDoc['enrolmentCapacity'];
          String school = targetDoc['school'];
        });
        print(
            "Full Name: $fullName, Email: $email, State: $state, Capacity: $capacity, School: $school");
      } else {
        print("Document does not exist");
      }
    }).catchError((error) {
      print("Error getting document: $error");
    });
  }
}
