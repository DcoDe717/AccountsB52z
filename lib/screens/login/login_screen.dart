import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width1 = MediaQuery.of(context).size.width / 1.25;
    final width2 = width1 / 1.25;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.purpleAccent,
                Color.fromARGB(255, 39, 37, 182),
                Colors.blue,
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              SizedBox(
                height: 200,
                width: 300,
                child: LottieBuilder.asset("assets/lottie/login2.json"),
              ),
              const SizedBox(height: 10),
              Container(
                width: width1,
                height: 400,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Hello",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Please Login to Your Account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: width2,
                      height: 60,
                      child: const TextField(
                        decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.user,
                              color: Colors.red,
                            ),
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: width2,
                      height: 60,
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            suffix: Icon(
                              FontAwesomeIcons.eyeSlash,
                              color: Colors.red,
                            ),
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(color: Colors.deepOrange),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 250,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFF8A2387),
                                Color(0xFFE94057),
                                Color(0xFFF27121),
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: TextButton(
                            onPressed: () {
                              // Navigator.of(context).pushNamed('/home');
                              // newFunc();
                              // readFunc2();
                              // dummyFunc();
                              dummyFunc1();
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> newFunc() async {
  const int idx = 2;
  final dbcall2 = FirebaseFirestore.instance.collection('monthlyInstallment');
  final document1 = <String, dynamic>{
    "comments": {'$idx': 'paid=3000 | added=jasim | comment=phonpe23'},
    "ispaid": {'$idx': false},
    "month": {'$idx': 'nov2023'},
    "date": {'$idx': Timestamp.now()}
  };

  final document2 = <String, dynamic>{
    "comments.$idx": 'paid=3000 | added=jasim | comment=phonpe23',
    "ispaid.$idx": false,
    "month.$idx": 'nov2023',
    "date.$idx": Timestamp.now()
  };

  await dbcall2.doc('name3').set(document2, SetOptions(merge: true));
  await dbcall2.doc('name2').update(document2);
}

Future<void> readFunc2() async {
  final dbcall2 = FirebaseFirestore.instance.collection('monthlyInstallment');
  final docSnapshot = await dbcall2.doc('name2').get();

  var comments = {};
  var isPaid = {};
  var month = {};
  var date = {};

  if (docSnapshot.exists) {
    final data = docSnapshot.data();
    // Access the fields using the keys
    comments = data?['comments'] ?? {};
    isPaid = data?['ispaid'] ?? {};
    month = data?['month'] ?? {};
    date = data?['date'] ?? {};
    // Do something with the data
  }

  print(comments);
  print(isPaid);
  print(month);
  print(date);
}

Future<void> readFunc() async {
  Map<String, dynamic>? dataRead;
  final dbcall3 =
      FirebaseFirestore.instance.collection("monthlyInstallment").doc("name2");
  await dbcall3.get().then(
    (DocumentSnapshot doc) {
      dataRead = doc.data() as Map<String, dynamic>;
    },
    onError: (e) => print("Error getting document: $e"),
  );
  print(dataRead);
}

Future<void> dummyFunc() async {
  final dbcall4 = FirebaseFirestore.instance.collection("monthlyInstallment");

  // final data1 = <String, dynamic>{
  //   "name": "San Francisco",
  //   "state": "CA",
  //   "country": "USA",
  //   "capital": false,
  //   "population": 860000,
  //   "regions": ["west_coast", "norcal"]
  // };
  // dbcall4.doc("name3").set(data1);
  await dbcall4.where("capital", isEqualTo: true).get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

Future<void> dummyFunc1() async {
  final dbcall5 = FirebaseFirestore.instance.collection("newdoc2");

  final data1 = <String, dynamic>{
    "name": "San Francisco",
    "state": "CA",
    "country": "USA",
    "capital": false,
    "population": 860000,
    "regions": ["west_coast", "norcal"]
  };
  await dbcall5.doc("SF").set(data1);

  final data2 = <String, dynamic>{
    "name": "Los Angeles",
    "state": "CA",
    "country": "USA",
    "capital": false,
    "population": 3900000,
    "regions": ["west_coast", "socal"],
  };
  await dbcall5.doc("LA").set(data2);

  final data3 = <String, dynamic>{
    "name": "Washington D.C.",
    "state": null,
    "country": "USA",
    "capital": true,
    "population": 680000,
    "regions": ["east_coast"]
  };
  await dbcall5.doc("DC").set(data3);

  final data4 = <String, dynamic>{
    "name": "Tokyo",
    "state": null,
    "country": "Japan",
    "capital": true,
    "population": 9000000,
    "regions": ["kanto", "honshu"]
  };
  await dbcall5.doc("TOK").set(data4);

  final data5 = <String, dynamic>{
    "name": "Beijing",
    "state": null,
    "country": "China",
    "capital": true,
    "population": 21500000,
    "regions": ["jingjinji", "hebei"],
  };
  await dbcall5.doc("BJ").set(data5);
}
