import 'package:cloneflutter/auth_metods.dart';
import 'package:cloneflutter/colors.dart';
import 'package:cloneflutter/screens/history_meeting_screen.dart';
import 'package:cloneflutter/screens/meeting_screen.dart';
import 'package:cloneflutter/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthMethods _authMethods = AuthMethods();
  int _page = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      MeetingScreen(),
      const HistoryMeetingScreen(),
      const Text('Contacts'),
      CustomButton(
        text: 'Salir',
        onPressed: () async {
          _authMethods.signOut();
          Navigator.pushReplacementNamed(context, '/login');
        },
      ),
    ];
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: onPageChanged,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.comment_bank,
            ),
            label: 'Meet and Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.lock_clock,
            ),
            label: 'Meetings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            label: 'Contactos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
