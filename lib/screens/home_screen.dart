import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_ui/styles/colors.styles.dart';
import 'package:travel_ui/styles/textStyles.dart';
import 'package:travel_ui/widgets/destination_carousel.dart';
import 'package:travel_ui/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    double size = 50.0;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: _selectedIndex == index ? accentColor : Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: Icon(
          _icons[index],
          size: size / 3,
          color: _selectedIndex == index ? primaryColor : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 100.0),
              child: Text(
                'What would you like to find?',
                style: titleStyle,
              ),
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map(
                    (MapEntry map) => _buildIcon(map.key),
                  )
                  .toList(),
            ),
            DestinationCarousel(),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_bar,
              size: 30.0,
            ),
            title: SizedBox.shrink()
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'), radius: 15.0,),
            title: SizedBox.shrink()
          ),
        ],
      ),
    );
  }
}
