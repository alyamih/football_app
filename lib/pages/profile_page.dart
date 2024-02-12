import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/model/user.dart';
import 'package:football_app/pages/show_screen.dart';
import 'package:football_app/widgets/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserItem user = UserItem();

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.callBack});
  final Function() callBack;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textControllerUserName = TextEditingController();
  TextEditingController textControllerUserEmail = TextEditingController();
  bool isOn = false;
  @override
  void initState() {
    super.initState();
    getSP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 65, bottom: 42),
                child: Text(
                  'Profile',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Container(
                  height: 57,
                  width: 57,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border:
                          Border.all(color: const Color(0xFFF87112), width: 2)),
                  child: const Icon(
                    Icons.person,
                    color: Color(0xffff87112),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  user.name != null ? '${user.name}' : 'UserName',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  user.email != null ? '${user.email}' : 'username@gmail.com',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF626262)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 54),
                child: InkWell(
                  onTap: () {
                    if (user.name != null) {
                      textControllerUserName.text = user.name!;
                    }
                    showDialog(
                        context: context,
                        builder: (context) => CupertinoAlertDialog(
                              content: Card(
                                color: Colors.transparent,
                                elevation: 0.0,
                                child: Column(children: [
                                  const Text('Enter your nickname',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15)),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                      controller: textControllerUserName,
                                      decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              borderSide: BorderSide(width: 1)),
                                          label: Text('Nickname ',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextField(
                                      style: const TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15),
                                      controller: textControllerUserEmail,
                                      decoration: const InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black,
                                                width: 1.0),
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15)),
                                              borderSide: BorderSide(width: 1)),
                                          label: Text('Email ',
                                              style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Colors.black,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                    ),
                                  ),
                                ]),
                              ),
                              actions: [
                                Card(
                                  color: Colors.transparent,
                                  elevation: 0.0,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 14),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel',
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15))),
                                        InkWell(
                                            onTap: () {
                                              user.name =
                                                  textControllerUserName.text;
                                              user.email =
                                                  textControllerUserEmail.text;
                                              addToSP(user);
                                              setState(() {});
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Save',
                                                style: TextStyle(
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 15)))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ));
                  },
                  child: Container(
                      width: 178,
                      height: 34,
                      padding: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF87112),
                          borderRadius: BorderRadius.circular(140)),
                      child: const Text(
                        'Edit',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/Bell.png'),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          'Notification',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    CupertinoSwitch(
                      activeColor: const Color(0xFFF87112),
                      value: user.notificationOn ?? isOn,
                      onChanged: (value) {
                        user.notificationOn = value;
                        addToSP(user);
                        setState(() {});
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ReadTermsOrPrivacyScreenView(
                                link: 'google.com',
                              )),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/Privacy.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Privacy policy',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              const ReadTermsOrPrivacyScreenView(
                                link: 'google.com',
                              )),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset('assets/Paper.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Terms o use',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                child: Row(
                  children: [
                    Image.asset('assets/Rate.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Rate app',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        BottomBar(
          callBack: () {
            widget.callBack();
          },
        )
      ]),
    );
  }

  Future<void> addToSP(UserItem? user) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    if (user != null) {
      prefs.setString('user', jsonEncode(user));
    }
  }

  void getSP() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString('user') != null) {
      Map<String, dynamic> userMap = jsonDecode(prefs.getString('user')!);
      user = UserItem.fromJson(userMap);
    }
    setState(() {});
  }
}
