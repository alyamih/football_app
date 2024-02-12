import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/model/news_item.dart';
import 'package:football_app/widgets/bottom_bar.dart';

class DescriptionNewsPage extends StatefulWidget {
  const DescriptionNewsPage(
      {super.key,
      required this.callBack,
      required this.news,
      required this.newsList});
  final Function callBack;
  final List<NewsItem> newsList;
  final NewsItem news;

  @override
  State<DescriptionNewsPage> createState() => _DescriptionNewsPageState();
}

class _DescriptionNewsPageState extends State<DescriptionNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 60, 18, 25),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Container(
                          height: 178,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                      widget.news.image!))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              widget.news.date!,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 11,
                                  color: Color(0xFF626262)),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Text(
                          widget.news.title!,
                          style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Text(
                        widget.news.text!,
                        style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ],
                ),
              ),
            ),
          ),
          BottomBar(callBack: () {
            Navigator.pop(context);
            widget.callBack();
          }),
        ],
      ),
    );
  }
}
