import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KidsReportPage extends StatefulWidget {
  String id;
  KidsReportPage({required this.id});

  @override
  _kidsReportPageState createState() => _kidsReportPageState(id: id);
}

class _kidsReportPageState extends State<KidsReportPage> {
  // value set to false
  bool _valu1 = false;
  bool _valu2 = false;
  bool _valu3 = false;
  bool _valu4 = false;
  bool _valu5 = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String id;
  _kidsReportPageState({required this.id});

  // App widget tree
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Report '), //IconButton
      ), //AppBar
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
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
                    selected: _valu1,
                    value: _valu1,
                    onChanged: (bool? value) {
                      setState(() {
                        _valu1 = value ?? false;
                      });
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
                    subtitle: const Text('Motor activities, Correct posture.'),
                    // secondary: CircleAvatar(
                    //   backgroundImage: NetworkImage(
                    //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                    //   radius: 20,
                    // ),
                    autofocus: false,
                    isThreeLine: true,
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    selected: _valu2,
                    value: _valu2,
                    onChanged: (bool? value) {
                      setState(() {
                        _valu2 = value ?? false;
                      });
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
                    selected: _valu3,
                    value: _valu3,
                    onChanged: (bool? value) {
                      setState(() {
                        _valu3 = value ?? false;
                      });
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
                    selected: _valu4,
                    value: _valu4,
                    onChanged: (bool? value) {
                      setState(() {
                        _valu4 = value ?? false;
                      });
                    },
                  ), //CheckboxListTile
                ),
                // SizedBox(height: 20),
                // Container(
                //   // decoration: BoxDecoration(
                //   //   borderRadius: BorderRadius.circular(20),
                //   //   boxShadow: [
                //   //     BoxShadow(
                //   //       color: Colors.black,
                //   //       offset: const Offset(
                //   //         3.0,
                //   //         3.0,
                //   //       ), //Offset
                //   //       blurRadius: 10.0,
                //   //       spreadRadius: 2.0,
                //   //     ), //BoxShadow
                //   //     BoxShadow(
                //   //       color: Colors.white,
                //   //       offset: const Offset(0.0, 0.0),
                //   //       blurRadius: 0.0,
                //   //       spreadRadius: 0.0,
                //   //     ), //BoxShadow
                //   //   ],
                //   // ), //BoxDecoration

                //   /** CheckboxListTile Widget **/
                //   child: CheckboxListTile(
                //     title: const Text('GeeksforGeeks'),
                //     subtitle: const Text(
                //         'A computer science portal for geeks. Here you will find articles on all the technologies.'),
                //     // secondary: CircleAvatar(
                //     //   backgroundImage: NetworkImage(
                //     //       "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                //     //   radius: 20,
                //     // ),
                //     autofocus: false,
                //     isThreeLine: true,
                //     activeColor: Colors.green,
                //     checkColor: Colors.white,
                //     selected: _valu5,
                //     value: _valu5,
                //     onChanged: (bool? value) {
                //       setState(() {
                //         _valu5 = value ?? false;
                //       });
                //     },
                //   ), //CheckboxListTile
                // ),
                // SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () async {
                        postDetailsToFirestore(context);
                      },
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey.shade200),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 1,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ), //Container
          ), //Padding
        ), //Center
      ), //SizedBox
    );
  }

  postDetailsToFirestore(context) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;

    CollectionReference ref = FirebaseFirestore.instance.collection('reports');

    ref.doc(id).set({
      "q1": _valu1,
      'q2': _valu2,
      'q3': _valu3,
      "q4": _valu4,
      'q5': _valu5,
      'sId': id,
    });
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Successfully Created',
      btnOkOnPress: () {},
    )..show();
  }
}
