import 'package:flutter/material.dart';

enum EPageOnSelect {
  mathcesPage,
  calendarPage,
  notesPage,
  newsPage,
  profilePage,
}

EPageOnSelect page = EPageOnSelect.mathcesPage;

class BottomBar extends StatefulWidget {
  const BottomBar(
      {super.key, required this.callBack, this.fromCocktailPage = false});
  final VoidCallback callBack;
  final bool fromCocktailPage;

  @override
  State<BottomBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          blurRadius: 15.0,
          spreadRadius: 10.0,
          offset: const Offset(
            5.0,
            5.0,
          ),
        )
      ]),
      padding: const EdgeInsets.fromLTRB(16, 22, 16, 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              page = EPageOnSelect.mathcesPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.mathcesPage
                        ? Image.asset(
                            'assets/Ball.png',
                            color: const Color(0xFFF87112),
                          )
                        : Image.asset(
                            'assets/Ball.png',
                            color: const Color(0xFF626262),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Matches',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: page == EPageOnSelect.mathcesPage
                                  ? const Color(0xFFF87112)
                                  : const Color(0xFF626262),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.newsPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.newsPage
                        ? Image.asset('assets/News.png',
                            color: const Color(0xFFF87112))
                        : Image.asset(
                            'assets/News.png',
                            color: const Color(0xFF626262),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('News',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: page == EPageOnSelect.newsPage
                                  ? const Color(0xFFF87112)
                                  : const Color(0xFF626262),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.notesPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.notesPage
                        ? Image.asset('assets/Notes.png',
                            color: const Color(0xFFF87112))
                        : Image.asset(
                            'assets/Notes.png',
                            color: const Color(0xFF626262),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Notes',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: page == EPageOnSelect.notesPage
                                  ? const Color(0xFFF87112)
                                  : const Color(0xFF626262),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.calendarPage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.calendarPage
                        ? Image.asset('assets/calendar.png',
                            color: const Color(0xFFF87112))
                        : Image.asset(
                            'assets/calendar.png',
                            color: const Color(0xFF626262),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Calendar',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: page == EPageOnSelect.calendarPage
                                  ? const Color(0xFFF87112)
                                  : const Color(0xFF626262),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
          InkWell(
            onTap: () {
              page = EPageOnSelect.profilePage;

              widget.callBack();
              setState(() {});
            },
            child: SizedBox(
                height: 50,
                width: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    page == EPageOnSelect.profilePage
                        ? Image.asset('assets/Profile.png',
                            color: const Color(0xFFF87112))
                        : Image.asset(
                            'assets/Profile.png',
                            color: const Color(0xFF626262),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text('Profile',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              color: page == EPageOnSelect.profilePage
                                  ? const Color(0xFFF87112)
                                  : const Color(0xFF626262),
                              fontSize: 10)),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
