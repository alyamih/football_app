import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:football_app/model/news_item.dart';
import 'package:football_app/pages/description_news_page.dart';
import 'package:football_app/widgets/bottom_bar.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key, required this.callBack});
  final Function() callBack;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<NewsItem> newsList = [
    NewsItem(
      title:
          'De Rossi’s dynamic Roma bring light and hope after storm Mourinho',
      text:
          'Don’t tell Daniele De Rossi that his team played well against Inter. “I’m a footballing son of Luciano Spalletti,” said the Roma manager at the end of Saturday’s 4-2 defeat. “He would never accept compliments after a loss because that’s how you fall into mediocrity.” Still, we can probably get away with saying it here. For 45 minutes on Saturday, Roma were excellent: standing toe-to-toe with the Serie A leaders like few have all season. The game had barely started when Stephan El Shaarawy forced Yann Sommer into a fingertip save. Inter subsequently took the lead through a Francesco Acerbi header, but goals from Gianluca Mancini and El Shaarawy put Roma in front at the break. As the last of those went in, ball splashing in via both posts under a torrential downpour, De Rossi grinned and roared on the sideline, soaked through in a suit jacket that never stood a chance. He looked like a man in his element, and why shouldn’t he? This is the job he has dreamed of from the moment he retired as a player.',
      date: '02/12/2024',
      image:
          'https://i.guim.co.uk/img/media/6a5b9698bc2e7967453e551b0b7003340de28921/0_440_6597_3958/master/6597.jpg?width=1900&dpr=1&s=none',
    ),
    NewsItem(
      title:
          'Qatar are Asia’s finest again but need strong World Cup to repair reputation',
      text:
          'he 2023 Asian Cup ended as it had begun almost a month earlier: with Akram Afif scoring for Qatar. The first got the ball rolling for the hosts against Lebanon and the last came in the 95th minute of the final to make it 3-1 against Jordan. It meant the celebrations could really start among the vast majority of the 86,000 fans at Lusail Stadium. All three of Qatar’s goals came from the penalty spot, converted by Afif, who ended the tournament as top scorer with eight. None were outrageous decisions by the Chinese referee, Ma Ning, despite the increasingly sarcastic applause by the Jordanian players. For those men in white, it was when the penalties came – especially the second – that was worse than how. Qatar pose with the trophy after beating Jordan at the Lusail Stadium in the Asian Cup final Akram Afif’s hat-trick of penalties secures Asian Cup glory for Qatar Afif opened the scoring in the first half after being bundled over in the box. Jordan, perhaps pinching themselves that they were here after defeating Iraq and South Korea, struggled to get going, sparking into life only in the minutes before the break. It was a different story after as Jordan got on top and the equaliser from Yazan al-Naimat midway through the second half had been coming even if the way he controlled, turned and shot home was a delight. At that point, Jordan looked the likelier but within moments there was another rash tackle in the area, another video review, another penalty and another goal. It was hard to come back from that, though Jordan did their utmost until Afif sealed the win after he was again brought down in the area, this time by the goalkeeper.',
      date: '02/12/2024',
      image:
          'https://i.guim.co.uk/img/media/d658f32d577f97eefacab94ac799fe78c73e0eeb/0_198_2969_1781/master/2969.jpg?width=1900&dpr=1&s=none',
    ),
    NewsItem(
      title: '‘You need courage’: Inside FC Copenhagen’s Champions League rise',
      text:
          'When we played Manchester United I told my teammates that we will get chances – we just have to be ruthless when we get them,” Mohamed Elyounoussi says on a cold January afternoon in Copenhagen. “That was the moment they realised: ‘OK, the level of football is high, but not as high as we thought it would be.’” The former Southampton winger is one of the leading players at FC Copenhagen, the Danish side who last autumn progressed from a Champions League group containing Manchester United, Bayern Munich and Galatasaray and will take on Manchester City in the first leg of the last 16 on Tuesday. Led by the 35-year-old head coach, Jacob Neestrup, Copenhagen beat United 4-3 at home and earned a draw at Bayern, the only points dropped by the German side in the group stage. Elyounoussi scored Copenhagen’s first goal in the comeback win against United, showing his teammates what was possible. But that game, and the 1-0 win against Galatasaray in December that secured their progression to the knockout stage, feels like a long time ago. Everyone at the club, including Elyounoussi and Neestrup, is looking forward, not back.',
      date: '02/12/2024',
      image:
          'https://i.guim.co.uk/img/media/d308c239acde1b3aba077ce53c003e8dc2b2a185/162_209_4682_2809/master/4682.jpg?width=1900&dpr=1&s=none',
    ),
    NewsItem(
      title:
          'Michael Mellon: Dundee raise \'serious concerns\' with Scottish FA after striker suffers serious head injury',
      text:
          'Dundee have contacted the Scottish FA with "serious concerns" about play not being stopped to allow treatment to Michael Mellon after he suffered a head injury against St Johnstone. The on-loan Burnley striker was stretchered off after a challenge from Liam Gordon in stoppage time at Dens Park on Sunday. Dundee manager Tony Docherty accused Saints captain Liam Gordon of being guilty of an "almost life-endangering" challenge on the substitute.Docherty also questioned why referee David Munro did not stop play immediately. "For me, that was almost life-endangering that challenge," he said after the 2-1 win. "And to not even get a booking for it... "Michael is a top boy in our team and I\'m concerned for him because he took a really bad blow to the back of the head.',
      date: '02/12/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-dundee-michael-mellon_6452990.jpg?20240212115002',
    ),
    NewsItem(
      title:
          'Nigeria 1-2 Ivory Coast: Sebastien Haller seals Africa Cup of Nations final comeback for host nation',
      text:
          'Hosts Ivory Coast completed one of Africa Cup of Nations\' most memorable comebacks to be crowned champions of Africa for a third time as Nigeria were beaten 2-1 in Abidjan. Nigeria captain and former Watford centre-back William Troost-Ekong headed the Super Eagles in front against the run of play at the Alassane Ouattara Stadium (38). Franck Kessie rose at the far post to meet Simon Adingra\'s corner to deservedly level matters (61). Ivory Coast looked set for an early exit when they lost their final group game 4-0 to Equatorial Guinea but scraped through to the knockout phase before beating Senegal, Mali and DR Congo.',
      date: '02/12/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-ivory-coast-nigeria_6452524.jpg?20240211223936',
    ),
    NewsItem(
      title:
          'West Ham 0-6 Arsenal: Gunners thrash abject hosts as Declan Rice\'s stunner caps demolition job',
      text:
          'Declan Rice\'s long-range goal capped a stunning demolition of his former side West Ham as Arsenal claimed a 6-0 win at the London Stadium to stay within two points of leaders Liverpool. The fixture was billed as a tough assignment for Mikel Arteta\'s side following two defeats to West Ham earlier in the season but the hosts completely capitulated as four goals in 15 first-half minutes sent many fans streaming towards the exits early. William Saliba\'s header from Rice\'s corner set the wheels in motion, with Bukayo Saka adding a second from the penalty spot before Gabriel Magalhaes headed home another Rice set-piece and Leandro Trossard added a brilliantly-taken fourth. Arsenal continued to tear through the abject hosts in the second half, adding two more goals in as many minutes as Saka capitalised on static defending to finish at the near post before Rice\'s brilliant curler from 25 yards out completed the rout.',
      date: '02/12/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-football-arsenal_6452128.jpg?20240211155639',
    ),
    NewsItem(
      title:
          'Erling Haaland looking ominous as Andy Robertson returns for Liverpool - Premier League hits and misses',
      text:
          'It is a measure of Erling Haaland\'s extraordinary productivity that his first goals in almost three months are enough to send him two clear at the top of the Premier League scoring charts. The striker had gone four games without scoring either side of his foot injury in December but his match-winning double against Everton on Saturday ended his mini-drought, taking him to 16 for the season and making it 10 wins on the bounce for City. Can anyone stop them? It seems increasingly unlikely now that the big Norwegian is hitting his stride again. "The finishing was amazing," said a smiling Pep Guardiola afterwards. His goals showed his capacity for both power and subtlety as he slammed in the first following a corner, then calmly stroked home the second having shrugged off Everton\'s Jarrad Branthwaite. It helps, of course, to have Kevin De Bruyne providing the ammunition again. The Belgian, another recent returnee, now has four assists in only 215 Premier League minutes since his comeback. The pass to release Haaland for the second goal was his 12th assist for the 23-year-old since the start of last season. The deadly duo are back. And that means City are in business.',
      date: '02/12/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-football-premier-league_6450763.jpg?20240210151139',
    ),
    NewsItem(
      title:
          'Real Madrid 4-0 Girona: Jude Bellingham suffers sprained ankle in LaLiga win',
      text:
          'Real Madrid have confirmed Jude Bellingham suffered a sprained ankle during Saturday\'s 4-0 win over Girona in LaLiga. However, Real, who moved five points clear of Girona at the top of the table with the win, have allayed fears the England midfielder sustained a serious injury after scoring twice at the Bernabeu. A brief statement issued on the club\'s official website on Sunday read: "Following tests carried out today on Jude Bellingham by the Real Madrid medical services, he has been diagnosed with a sprain in his left ankle. His recovery will be monitored."',
      date: '02/11/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-jude-bellingham_6451881.jpg?20240211123954',
    ),
    NewsItem(
      title:
          'Bayer Leverkusen 3-0 Bayern Munich: Xabi Alonso\'s side go five points clear at the top of Bundesliga',
      text:
          'Harry Kane says Bayern Munich must turn their form around quickly after Bayer Leverkusen beat them 3-0 to go five points clear at the top of the Bundesliga. Alejandro Grimaldo, the star of the show, struck the decisive goal for Leverkusen, the only unbeaten team left in Europe, shortly after half-time to double their lead following Bayern loanee Josip Stanisic\'s first-half opener. Substitute Jeremie Frimpong added a third from range in stoppage-time with Manuel Neuer out of his goal. Bayern boss Thomas Tuchel played a back five to match Leverkusen, although the tweak backfired, with the champions always second best at the BayArena. Harry Kane, the club\'s record signing, had one of his quietest games since joining from Spurs.',
      date: '02/11/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-budesliga-leverkusen_6451516.jpg?20240210200930',
    ),
    NewsItem(
      title:
          'Dundee 2-1 St Johnstone: Jordan McGhee seals comeback win for home side at Dens Park',
      text:
          'Dundee came from behind to secure a dramatic cinch Premiership 2-1 victory over St Johnstone at Dens Park. Saints had stormed into an early lead thanks to a Matt Smith goal but the Dark Blues fought back after the break with a controversial Luke McCowan penalty and what proved to be the winner in the closing stages from Jordan McGhee. The result leaves Dundee in sixth place, three points ahead of Hibernian, while St Johnstone remain 10th.',
      date: '02/11/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/b0d9cc5b1ebb6e7725c0043d6e27b1de23842cf2e6efe90970c2d8c1c64d976e_6452378.jpg?20240211190156',
    ),
    NewsItem(
      title:
          'Scottish Cup round-up: Celtic, Rangers, Hibs, Hearts, Aberdeen, Kilmarnock, Livingston all reach quarter-finals',
      text:
          'Japanese duo Kyogo Furuhashi and Daizen Maeda scored as holders Celtic beat spirited St Mirren 2-0 to reach the quarter-finals of the Scottish Gas Scottish Cup. Furuhashi finished off a fine move against the run of play after 15 minutes to give the cinch Premiership leaders a slender half-time lead at the SMiSA Stadium. Alex Gogic had come close a couple of times for the Buddies in the first half but the Saints could not find a breakthrough and Maeda pounced from close range in the 52nd minute to double Celtic\'s lead. St Mirren could not get back into the game and will rue missed chances and although it was not a sparkling performance from a Celtic side who have been unconvincing recently, it kept intact boss Brendan Rodgers\' record of not having lost a Scottish Cup tie in two spells at the club. Oscar Cortes shone in his first Rangers start as the Light Blues made their way into the quarter-finals with a 2-0 win over Ayr at Ibrox.',
      date: '02/11/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-oscar-cortes-rangers_6451565.jpg?20240210210222',
    ),
    NewsItem(
      title:
          'South Africa 0-0 DR Congo (6-5 on pens): South Africa seal third spot with penalty shootout win',
      text:
          'South Africa took third place at the Africa Cup of Nations finals in the Ivory Coast as they edged the Democratic Republic of Congo 6-5 on penalties after a goalless draw at the Felix Houphouet-Boigny Stadium. South Africa midfielder Teboho Mokoena hit the outside of the post with the first kick before the next eight efforts were all successful, leaving DR Congo captain Chancel Mbemba needing to score to win the contest. No extra time was played in the bronze medal match, which the Congolese dominated despite proving poor in front of goal. Silas Katompa had two glaring chances to put them ahead, first in the eighth minute when free on the left with just Williams to beat, but his hesitation allowed the keeper to grab the ball at his feet. When Williams dropped a high ball in his box midway through the second half, without any pressure on him, Katompa had an even easier chance but shot into the side netting. Fifteen minutes from the end, DR Congo striker Simon Banza also had clear sight on goal but botched his effort from point-blank range.',
      date: '02/10/2024',
      image:
          'https://e0.365dm.com/24/02/1600x900/skysports-south-africa-football_6451636.jpg?20240210223042',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 65, bottom: 42),
            child: Text(
              'News',
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [getNews()],
                ),
              ),
            ),
          ),
          BottomBar(
            callBack: () {
              widget.callBack();
            },
          ),
        ],
      ),
    );
  }

  Widget getNews() {
    List<Widget> list = [];

    for (var news in newsList) {
      list.add(InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(
                builder: (BuildContext context) => DescriptionNewsPage(
                      news: news,
                      newsList: newsList,
                      callBack: () {
                        widget.callBack();
                      },
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: const Color(0xFFe8e8e8),
              borderRadius: BorderRadius.circular(12)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 98,
              width: 98,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        news.image!,
                      ))),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 38),
                    child: Row(
                      children: [
                        Flexible(
                          child: Text(
                            news.title!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    news.date!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ));
    }
    return Column(
      children: list,
    );
  }
}
