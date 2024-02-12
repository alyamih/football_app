import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MatchItemWidget extends StatelessWidget {
  final dynamic match;

  const MatchItemWidget({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(match['utcDate']).toLocal();
    final formattedTime = DateFormat('dd MMMM yyyy').format(dateTime);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
          color: const Color(0xFFE8E8E8),
          borderRadius: BorderRadius.circular(8)),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('DATE',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    color: Colors.black.withOpacity(0.7))),
            Text(
              formattedTime,
              style: const TextStyle(fontFamily: 'Inter', fontSize: 11),
            )
          ],
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Image.asset('assets/team_image.png'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            '${match['homeTeam']['name']}',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontFamily: 'Inter', fontSize: 11),
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
        const SizedBox(
          width: 17,
        ),
        const Text(
          'VS',
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(
          width: 17,
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Image.asset('assets/team_image.png'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      '${match['awayTeam']['name']}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontFamily: 'Inter', fontSize: 11),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }

  String _getDisplayStatus(String matchStatus) {
    switch (matchStatus) {
      case 'SCHEDULED':
        return 'Not Started';
      case 'LIVE':
        return 'Live';
      case 'IN_PLAY':
        return 'In Play';
      case 'PAUSED':
        return 'Paused';
      case 'FINISHED':
        return 'Finished';
      case 'POSTPONED':
        return 'Postponed';
      case 'SUSPENDED':
        return 'Suspended';
      case 'CANCELED':
        return 'Canceled';
      default:
        return 'Unknown';
    }
  }
}
