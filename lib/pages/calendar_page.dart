import 'package:flutter/material.dart';
import 'package:football_app/model/api.dart';
import 'package:football_app/widgets/bottom_bar.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widgets/match_item_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key, required this.callBack});
  final Function() callBack;

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<dynamic> matches = [];
  final ApiRepository apiRepository = ApiRepository();
  bool _isLoading = true;
  DateTime filterDate = DateTime.now();

  @override
  void initState() {
    super.initState();
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
      var fetchedMatches = await apiRepository.fetchCalendarMatches(
          DateFormat('yyyy-MM-dd').format(filterDate),
          DateFormat('yyyy-MM-dd').format(
              DateTime(filterDate.year, filterDate.month, filterDate.day + 1)));

      if (!mounted) return;

      setState(() {
        matches = fetchedMatches;
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _isLoading ? _buildLoadingIndicator() : _buildMatchList(size),
    );
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
            widget.callBack();
          },
        )
      ],
    );
  }

  Widget _buildMatchList(Size size) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 65, bottom: 30),
            child: Text(
              'Calendar',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(8)),
              child: TableCalendar(
                selectedDayPredicate: (day) => isSameDay(day, DateTime.now()),
                onDaySelected: (date, datetime) {
                  filterDate = date;
                  fetchMatches();
                  setState(() {});
                },
                headerStyle: HeaderStyle(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.black.withOpacity(0.1)))),
                    formatButtonVisible: false,
                    titleTextStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                calendarStyle: const CalendarStyle(
                  selectedTextStyle: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  selectedDecoration: BoxDecoration(
                      color: Color(0xFFF87112), shape: BoxShape.circle),
                  todayTextStyle: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  defaultTextStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  todayDecoration: BoxDecoration(
                      color: Color(0xFFF87112), shape: BoxShape.circle),
                ),
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                locale: 'en_US',
              ),
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
              widget.callBack();
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
