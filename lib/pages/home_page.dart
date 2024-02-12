import 'package:flutter/material.dart';
import 'package:football_app/model/api.dart';
import 'package:football_app/model/models.dart';
import 'package:football_app/pages/calendar_page.dart';
import 'package:football_app/pages/news_page.dart';
import 'package:football_app/pages/notes_page.dart';
import 'package:football_app/pages/profile_page.dart';
import 'package:football_app/widgets/bottom_bar.dart';
import 'package:football_app/widgets/match_item_widget.dart';

List<SoccerMatch> matchesList = [];

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> matches = [];
  final ApiRepository apiRepository = ApiRepository();
  bool _isLoading = true;
  dynamic liveMatch;
  DateTime filterDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    fetchTodayMatches();
  }

  void fetchTodayMatches() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      var todayMatches = await apiRepository.fetchTodayMatches();
      if (!mounted) return;

      if (todayMatches.isEmpty) {
        fetchMatches();
      } else {
        setState(() {
          matches = todayMatches;
          liveMatch = matches.firstWhere(
              (element) => element['status'] == 'LIVE',
              orElse: () => null);
          _isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  void fetchMatches() async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    try {
      var fetchedMatches = await apiRepository.fetchMatches();

      if (!mounted) return;

      setState(() {
        matches = fetchedMatches;
        liveMatch = matches.firstWhere((element) => element['status'] == 'LIVE',
            orElse: () => null);
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getContent());
  }

  Widget getContent() {
    if (page == EPageOnSelect.profilePage) {
      return ProfilePage(
        callBack: () {
          setState(() {});
        },
      );
    } else if (page == EPageOnSelect.notesPage) {
      return NotesPage(
        callBack: () {
          setState(() {});
        },
      );
    } else if (page == EPageOnSelect.newsPage) {
      return NewsPage(
        callBack: () {
          setState(() {});
        },
      );
    } else if (page == EPageOnSelect.calendarPage) {
      return CalendarScreen(callBack: () {
        setState(() {});
      });
    } else {
      return _isLoading ? _buildLoadingIndicator() : _buildMatchList();
    }
  }

  Widget _buildLoadingIndicator() {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(),
                child: const Center(
                    child: CircularProgressIndicator(
                  color: Colors.orange,
                )),
              ),
            ],
          ),
        ),
        BottomBar(
          callBack: () {
            setState(() {});
          },
        )
      ],
    );
  }

  Widget _buildMatchList() {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 65, bottom: 30),
            child: Text(
              'Matches',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          if (liveMatch != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color(0xFFF87112),
                    borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        '${liveMatch['competition']['name']}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize:
                                12), //'${liveMatch['competition']['name']}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        '${liveMatch['minute']}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 12),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: Image.asset(
                                        'assets/team_image2.png',
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            '${liveMatch['homeTeam']['name']}',
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Inter',
                                                fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 17,
                          child: Text(
                            '${liveMatch['score']['fullTime']['home']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 18),
                          ),
                        ),
                        const Text(
                          '-',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 12),
                        ),
                        SizedBox(
                          width: 17,
                          child: Text(
                            ' ${liveMatch['score']['fullTime']['away']}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 18),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Image.asset(
                                  'assets/team_image2.png',
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: Text(
                                      '${liveMatch['awayTeam']['name']}',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          const Padding(
            padding: EdgeInsets.only(top: 18, bottom: 14, left: 16),
            child: Row(
              children: [
                Text(
                  'Upcoming matches',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: getMatches(),
          ))),
          BottomBar(
            callBack: () {
              setState(() {});
            },
          )
        ],
      ),
    );
  }

  Widget getMatches() {
    List<Widget> list = [];

    for (var match in matches) {
      list.add(MatchItemWidget(
        match: match,
      ));
    }
    return Column(
      children: list,
    );
  }
}
