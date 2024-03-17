import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jema_app/teacherchat.dart';
import 'package:jema_app/classroomview.dart';
import 'package:jema_app/addclassroom.dart';

import 'childrenProfile.dart';

class ChildrenHomePage extends StatelessWidget {
  late User? user;
  final TextEditingController _searchController = TextEditingController();
  late StreamController<String> _searchTermController;
  late final Stream<QuerySnapshot> _usersStream;
  String classroom;
  ChildrenHomePage({required this.classroom}) {
    user = FirebaseAuth.instance.currentUser;

    _searchTermController = StreamController<String>.broadcast();
    _usersStream = FirebaseFirestore.instance
        .collection('students')
        .where('user', isEqualTo: user?.uid)
        .where('className', isEqualTo: classroom)
        .snapshots();

    _searchTermController.stream.listen((searchTerm) {
      _usersStream = searchStudents(searchTerm);
    });
  }
  final TextStyle poppinsTextStyle = TextStyle(
    fontFamily: 'Poppins',
  );

  @override
  void dispose() {
    _searchController.dispose();
    _searchTermController.close();
  }

  void initializeStreams() {
    _usersStream = FirebaseFirestore.instance
        .collection('students')
        .where('user', isEqualTo: user?.uid)
        .where('className', isEqualTo: classroom)
        .snapshots();
  }

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
              'Children  ',
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
                padding: EdgeInsets.fromLTRB(width * 0.1, 40, width * 0.1, 40),
                child: Container(
                  width: 293,
                  height: 44,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 1),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) {
                      _searchTermController.add(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search),
                      ),
                      suffixIcon: Icon(Icons.mic),
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (context, snapshot) {
                    print("--------------------------------------");
                    print(snapshot.data!.docs.length);
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    var itemcount = snapshot.data!.docs.length;

                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var document = snapshot.data!.docs[index];
                        var name = document['Firstname'];
                        var className = document['className'];
                        var image = document['image'];

                        return ListTile(
                          leading: CircleAvatar(
                            radius: 27.0,
                            backgroundImage: NetworkImage(image),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '$name',
                                    style: poppinsTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '$className',
                                    style: poppinsTextStyle.copyWith(
                                        fontSize: 12.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                          trailing: Container(
                            height: 35.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(203, 164, 88, 177),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: TextButton(
                              onPressed: () {
                                print(document);
                                // Handle view class button press
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        ChildrenProfilePage(document, 'C'),
                                  ),
                                );
                              },
                              child: Text(
                                'View',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        );
                        ;
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<QuerySnapshot> searchStudents(String searchTerm) {
    return FirebaseFirestore.instance
        .collection('students')
        .where('user', isEqualTo: user?.uid)
        .where('FirstName', isGreaterThanOrEqualTo: searchTerm)
        .snapshots();
  }
}
