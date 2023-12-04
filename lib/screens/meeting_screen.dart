import 'dart:math';

import 'package:cloneflutter/jitsi_meet_metods.dart';
import 'package:cloneflutter/widgets/home_meeting_button.dart';
import 'package:flutter/material.dart';

class MeetingScreen extends StatelessWidget {
  MeetingScreen({Key? key}) : super(key: key);
  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  Future<void> _createNewMeeting() async {
    var random = Random();
    String roomName = (random.nextInt(100000000) + 10000000).toString();
    String meetingUrl = 'https://meet.jit.si/$roomName';

    await _jitsiMeetMethods.joinMeeting(roomName);
  }

  joinSala(BuildContext context) {
    Navigator.pushNamed(context, '/video-call');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        HomeMeetingButton(
          onPressed: _createNewMeeting,
          text: 'Crear nueva reunión',
          icon: Icons.videocam,
        ),
        HomeMeetingButton(
          onPressed: () => joinSala(context),
          text: 'Unirse a un meet',
          icon: Icons.add_box_rounded,
        ),
        HomeMeetingButton(
          onPressed: () {},
          text: 'Cronograma',
          icon: Icons.calendar_today,
        ),
        HomeMeetingButton(
          onPressed: () {},
          text: 'Compartir pantalla',
          icon: Icons.arrow_upward_rounded,
        ),
        const SizedBox(height: 16), // Espacio entre los botones y el texto
        const Center(
          child: Text(
            '¡Crea o únete a reuniones con un clic!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
