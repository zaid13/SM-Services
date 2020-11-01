
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_showcase/flutter_showcase.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sm_service/App_Initialization/App_classes/Theme.dart';
import 'package:sm_service/App_Initialization/App_theme/App_theme.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:weather_icons/weather_icons.dart';



class Absence_Timeline extends StatefulWidget {
  @override
  _Absence_TimelineState createState() => _Absence_TimelineState();
}

class _Absence_TimelineState extends State<Absence_Timeline> {
  theme th = theme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[

          getAppBarUI(),
          Expanded(
            child: Showcase(
              title: 'Absence Request Status',
              app: _WeatherTimelineApp(),
              description: 'Keep it up with the weather with this shining timeline.',
              template: SimpleTemplate(reverse: false),
              theme: TemplateThemeData(
                frameTheme: FrameThemeData(
                  statusBarBrightness: Brightness.dark,
                  frameColor: Colors.black.withOpacity(0.7),
                ),
                flutterLogoColor: FlutterLogoColor.black,
                brightness: Brightness.dark,
                backgroundColor: const Color(0xFFDB84B1),
                titleTextStyle: GoogleFonts.lato(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Colors.black.withOpacity(0.7),
                ),
                descriptionTextStyle: GoogleFonts.lato(
                  fontSize: 24,
                  height: 1.2,
                  color: Colors.black.withOpacity(0.7),
                ),
                buttonTextStyle: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                buttonIconTheme: const IconThemeData(color: Colors.black),
                buttonTheme: ButtonThemeData(
                  buttonColor: const Color(0xFF9E3773),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  padding: const EdgeInsets.all(16),
                ),
              ),
              links: [
                LinkData.github('https://github.com/JHBitencourt/timeline_tile'),
              ],
              logoLink: LinkData(
                icon: Image.asset(
                  'assets/built_by_jhb_black.png',
                  fit: BoxFit.fitHeight,
                ),
                url: 'https://github.com/JHBitencourt',
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget getAppBarUI() {
    return Container(
      height: 150,
      decoration: BoxDecoration(

        border:  Border.all(
          color: th.pr,
          width: 2,
        ),
        color:  Hexcolor('#256CD0'),
//                    borderRadius: const BorderRadius.only(
//                      bottomLeft: Radius.circular(32.0),
//                    ),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: FintnessAppTheme.grey
                  .withOpacity(0.4 ),
              offset: const Offset(1.1, 1.1),
              blurRadius: 10.0),
        ],
      ),
      child: Column(
        children: <Widget>[

          Expanded(
            child: Stack(
              children: <Widget>[
                Image.asset('assets/topheaderblue.png'
                  ,fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: 150
                  ,


                ),

                Positioned(
                  top:40 ,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Timeline',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 30 ,
                          letterSpacing: 1.2,
                          color: Colors.white,

                        ),
                      ),
                      Container(
                        height: 5,
                      ),
                      Text(

                        'See the timeline',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                          fontFamily: FintnessAppTheme.fontName,
                          fontWeight: FontWeight.w100,
                          fontSize: 20 ,
                          letterSpacing: 1.2,
                          color: Colors.white,

                        ),
                      ),

                    ],
                  ),
                ),


              ],

            ),
          )
        ],
      ),
    );
  }

}

class _WeatherTimelineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather TimelineTile',
      builder: Frame.builder,
      home: _WeatherTimeline(),
    );
  }
}

class _WeatherTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            //TODO TIME LINE GRAD
            Colors.white,
            Colors.white,

//            Color(0xFF4A8EFE),
//            Color(0xFF3A3E88),
          ],
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: const Color(0xFFDB84B1).withOpacity(0.2),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,

            body: ListView(
              children: <Widget>[
                TimelineTile(
                  alignment: TimelineAlign.manual,
                  lineX: 0.3,
                  isFirst: true,
                  indicatorStyle: IndicatorStyle(
                    width: 70,
                    height: 70,
                    indicator: _Sun(),
                  ),
                  topLineStyle: LineStyle(color: Colors.black.withOpacity(0.7)),
                  rightChild: _ContainerHeader(),
                ),
                _buildTimelineTile(
                    indicator: const _IconIndicator(
                      iconData: WeatherIcons.cloudy,
                      size: 20,
                    ),
                    hour: '27/june/2020\n10:33 pm', //todo processed date
                    weather: 'Submitted By',  //TODO STATUS
                    temperature: 'Mike', //TODO approved by
                    phrase: 'Remarks By Mike' //TODO Remarks by mike
                ),
                _buildTimelineTile(
                  indicator: const _IconIndicator(
                    iconData: WeatherIcons.sunset,
                    size: 20,
                  ),
                  hour: '20:00',
                  weather: 'Sunset',
                  temperature: '24°C',
                  phrase: 'Enjoy the view, the sun will be back tomorrow.',
                ),
                _buildTimelineTile(
                  indicator: const _IconIndicator(
                    iconData: WeatherIcons.night_alt_rain_mix,
                    size: 20,
                  ),
                  hour: '22:00',
                  weather: 'Fall of rain',
                  temperature: '18°C',
                  phrase: 'Temperature is decreasing...',
                ),
                _buildTimelineTile(
                  indicator: const _IconIndicator(
                    iconData: WeatherIcons.snowflake_cold,
                    size: 20,
                  ),
                  hour: '00:00',
                  weather: 'Chilly',
                  temperature: '16°C',
                  phrase: "Have a good night, don't forget your blanket.",
                  isLast: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text(
        //TODO REQUUEST #
        'Request No',
        style: GoogleFonts.lato(
          color: const Color(0xFF9E3773),
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.menu,
            color: Color(0xFF9E3773),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  TimelineTile _buildTimelineTile({
    _IconIndicator indicator,
    String hour,
    String weather,
    String temperature,
    String phrase,
    bool isLast = false,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineX: 0.3,
      topLineStyle: LineStyle(color: Colors.black.withOpacity(0.7)),
      indicatorStyle: IndicatorStyle(
        indicatorY: 0.3,
        drawGap: true,
        width: 30,
        height: 30,
        indicator: indicator,
      ),
      isLast: isLast,
      leftChild: Center(
        child: Container(
          alignment: const Alignment(0.0, -0.50),
          child: Text(
            hour,
            style: GoogleFonts.lato(
              fontSize: 15,
              color: Colors.black.withOpacity(0.6),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      rightChild: Padding(
        padding:
        const EdgeInsets.only(left: 16, right: 10, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              weather,
              style: GoogleFonts.lato(
                fontSize: 18,
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              temperature,
              style: GoogleFonts.lato(
                fontSize: 16,
                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              phrase,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IconIndicator extends StatelessWidget {
  const _IconIndicator({
    Key key,
    this.iconData,
    this.size,
  }) : super(key: key);

  final IconData iconData;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ContainerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              'James Bond',
              style: GoogleFonts.lato(
                fontSize: 18,
                color: const Color(0xFFF4A5CD),
              ),
            ),
            Text(
              'Annual - 15 Days in Year',

              style: GoogleFonts.lato(
                fontSize: 18,

                color: Colors.black.withOpacity(0.8),
                fontWeight: FontWeight.w800,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Text(
                    '01/Jul/2020 - 15/Jul/2020 ',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: const Color(0xFF4A448F).withOpacity(0.8),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    '00:00:00 - 00:00:00',
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: const Color(0xFF4A448F).withOpacity(0.8),
                      fontWeight: FontWeight.w800,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Sun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 12,
                spreadRadius:10,
              ),
            ],

            shape: BoxShape.circle,
            color: Color(0xFF0C215F),
          ),
        ),

//        Container(
//          decoration: const BoxDecoration(
//            boxShadow: [
//              BoxShadow(
//                color: Colors.black,
//                blurRadius: 1,
//                spreadRadius:0.5,
//              ),
//            ],
//
//            shape: BoxShape.circle,
//            color: Colors.black ,
//          ),
//        ),

      ],

    );
  }
}
