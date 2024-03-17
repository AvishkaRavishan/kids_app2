import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jema_app/classroomview.dart';
import 'package:jema_app/addclassroom.dart';
import 'package:jema_app/teacherchat.dart';

import 'ChatScreen.dart';
import 'TeacherProfile.dart';
import 'childrenProfile.dart';

class ParentHomePage extends StatelessWidget {
  late User? user;
  late final Stream<QuerySnapshot> _usersStream;
  late String phoneNo;
  late String role;
  ParentHomePage(param0, role) {
    this.role = role;
    this.phoneNo = param0;
    user = FirebaseAuth.instance.currentUser;
    initializeStreams();
  }

  void initializeStreams() {
    _usersStream = FirebaseFirestore.instance
        .collection('students')
        .where('Parentphone', isEqualTo: phoneNo)
        .snapshots();
  }

  // Define a TextStyle with the Poppins font
  final TextStyle poppinsTextStyle = TextStyle(
    fontFamily: 'Poppins',
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the back button press
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          // leading: Flexible(
          //   child: Image.asset(
          //     'lib/assets/logo.png',
          //     fit: BoxFit.contain,
          //     height: 150, // Adjust the height to make the logo bigger
          //   ),
          // ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification icon press
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Explore, learn, and play in our magical world of wonder!',
                style: poppinsTextStyle.copyWith(
                  // fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Image.asset(
                  'lib/assets/teacherhome.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Navigate to the AddClassroomPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddClassroomPage()),
                      );
                    },
                    child: Row(
                      children: [],
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 10),
              Text(
                'All Kids',
                style: poppinsTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _usersStream,
                  builder: (context, snapshot) {
                    print("--------------------------------------");
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
                        var className = document['className'];
                        var name = document['Firstname'];
                        print(document);

                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0), // Adjust the spacing as needed
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 27.0,
                              backgroundImage:
                                  AssetImage('lib/assets/classlogo.png'),
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
                                    ),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChildrenProfilePage(document, "P"),
                                    ),
                                  );
                                },
                                child: Text(
                                  'View',
                                  style: poppinsTextStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
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
            // Handle bottom navigation item tap
            switch (index) {
              case 0:
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
