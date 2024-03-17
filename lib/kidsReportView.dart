import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_kids/teacherhome.dart';

import 'ChatScreen.dart';
import 'TeacherProfile.dart';
import 'kidsReport.dart'; // Import the AddClassroomPage file

class ReportKidsViewPage extends StatelessWidget {
  late User? user;
  late final Stream<QuerySnapshot> _usersStream;
  late String sid;
  ReportKidsViewPage({sid}) {
    this.sid = sid;
    print(sid);
    user = FirebaseAuth.instance.currentUser;
    initializeStreams();
  }

  void initializeStreams() {
    _usersStream = FirebaseFirestore.instance
        .collection('reports')
        .where('sId', isEqualTo: sid)
        .snapshots();
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
              'Report  ',
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
                'Report View',
                style: TextStyle(
                  color: Color(0xFF21205B),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  height: 0.06,
                ),
              ),
              SizedBox(height: 30),
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
                    var itemCount = snapshot.data!.docs.length;

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                            1, // Adjust this value to control the number of items per row
                        crossAxisSpacing:
                            8.0, // Adjust spacing between items horizontally
                        mainAxisSpacing:
                            8.0, // Adjust spacing between items vertically
                      ),
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        var document = snapshot.data!.docs[index];
                        index++;
                        var _valu = document['q' + index.toString()];

                        return Container(
                          color: Color(0xFFE5E5E5),
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.black,
                                  //       offset: const Offset(
                                  //         3.0,
                                  //         3.0,
                                  //       ), //Offset
                                  //       blurRadius: 10.0,
                                  //       spreadRadius: 2.0,
                                  //     ), //BoxShadow
                                  //     BoxShadow(
                                  //       color: Colors.white,
                                  //       offset: const Offset(0.0, 0.0),
                                  //       blurRadius: 0.0,
                                  //       spreadRadius: 0.0,
                                  //     ), //BoxShadow
                                  //   ],
                                  // ), //BoxDecoration

                                  /** CheckboxListTile Widget **/
                                  child: CheckboxListTile(
                                    title: const Text('Understanding'),
                                    subtitle: const Text(
                                        'Understanding commands, Answer questions, Keeping eye contact, Following rules.'),
                                    // secondary: CircleAvatar(
                                    //   backgroundImage: NetworkImage(
                                    //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                                    //   radius: 20,
                                    // ),
                                    autofocus: false,
                                    isThreeLine: true,
                                    activeColor: Colors.green,
                                    checkColor: Colors.white,
                                    selected: document["q1"],
                                    value: document["q1"],
                                    onChanged: (bool? value) {
                                      // setState(() {
                                      //   _valu1 = value ?? false;
                                      // });
                                    },
                                  ), //CheckboxListTile
                                ),
                                SizedBox(height: 20),
                                Container(
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.black,
                                  //       offset: const Offset(
                                  //         3.0,
                                  //         3.0,
                                  //       ), //Offset
                                  //       blurRadius: 10.0,
                                  //       spreadRadius: 2.0,
                                  //     ), //BoxShadow
                                  //     BoxShadow(
                                  //       color: Colors.white,
                                  //       offset: const Offset(0.0, 0.0),
                                  //       blurRadius: 0.0,
                                  //       spreadRadius: 0.0,
                                  //     ), //BoxShadow
                                  //   ],
                                  // ), //BoxDecoration

                                  /** CheckboxListTile Widget **/
                                  child: CheckboxListTile(
                                    title: const Text('Movements'),
                                    subtitle: const Text(
                                        'Motor activities, Correct posture.'),
                                    // secondary: CircleAvatar(
                                    //   backgroundImage: NetworkImage(
                                    //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                                    //   radius: 20,
                                    // ),
                                    autofocus: false,
                                    isThreeLine: true,
                                    activeColor: Colors.green,
                                    checkColor: Colors.white,
                                    selected: document["q2"],
                                    value: document["q2"],
                                    onChanged: (bool? value) {
                                      // setState(() {
                                      //   _valu2 = value ?? false;
                                      // });
                                    },
                                  ), //CheckboxListTile
                                ),
                                SizedBox(height: 20),
                                Container(
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.black,
                                  //       offset: const Offset(
                                  //         3.0,
                                  //         3.0,
                                  //       ), //Offset
                                  //       blurRadius: 10.0,
                                  //       spreadRadius: 2.0,
                                  //     ), //BoxShadow
                                  //     BoxShadow(
                                  //       color: Colors.white,
                                  //       offset: const Offset(0.0, 0.0),
                                  //       blurRadius: 0.0,
                                  //       spreadRadius: 0.0,
                                  //     ), //BoxShadow
                                  //   ],
                                  // ), //BoxDecoration

                                  /** CheckboxListTile Widget **/
                                  child: CheckboxListTile(
                                    title: const Text('Manipulating'),
                                    subtitle: const Text(
                                        'Can build/create new things, Knows how to handle accessories'),
                                    // secondary: CircleAvatar(
                                    //   backgroundImage: NetworkImage(
                                    //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                                    //   radius: 20,
                                    // ),
                                    autofocus: false,
                                    isThreeLine: true,
                                    activeColor: Colors.green,
                                    checkColor: Colors.white,
                                    selected: document["q3"],
                                    value: document["q3"],
                                    onChanged: (bool? value) {
                                      // setState(() {
                                      //   _valu3 = value ?? false;
                                      // });
                                    },
                                  ), //CheckboxListTile
                                ),
                                SizedBox(height: 20),
                                Container(
                                  // decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(20),
                                  //   boxShadow: [
                                  //     BoxShadow(
                                  //       color: Colors.black,
                                  //       offset: const Offset(
                                  //         3.0,
                                  //         3.0,
                                  //       ), //Offset
                                  //       blurRadius: 10.0,
                                  //       spreadRadius: 2.0,
                                  //     ), //BoxShadow
                                  //     BoxShadow(
                                  //       color: Colors.white,
                                  //       offset: const Offset(0.0, 0.0),
                                  //       blurRadius: 0.0,
                                  //       spreadRadius: 0.0,
                                  //     ), //BoxShadow
                                  //   ],
                                  // ), //BoxDecoration

                                  /** CheckboxListTile Widget **/
                                  child: CheckboxListTile(
                                    title: const Text('Socializing'),
                                    subtitle: const Text(
                                        'Play with groups, Help each other, Friendly towards peers.'),
                                    // secondary: CircleAvatar(
                                    //   backgroundImage: NetworkImage(
                                    //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                                    //   radius: 20,
                                    // ),
                                    autofocus: false,
                                    isThreeLine: true,
                                    activeColor: Colors.green,
                                    checkColor: Colors.white,
                                    selected: document["q4"],
                                    value: document["q4"],
                                    onChanged: (bool? value) {
                                      // setState(() {
                                      //   _valu4 = value ?? false;
                                      // });
                                    },
                                  ), //CheckboxListTile
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
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
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeacherHomePage()),
                );
                break;
              case 1:
                // Navigate to Chat
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
                break;
              case 2:
                // Navigate to Profile
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TeacherProfilePage(
                            uid: user?.uid,
                          )),
                );
                break;
            }
          },
        ),
      ),
    );
  }
}
