




import 'package:flutter/material.dart';
import 'package:talk_task/services/local_notification_service.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {

  @override
  void initState() {
    super.initState();
    NotificationService.showNotification(title: 'Meeting with Jawad', description: 'Your meeting is scheduled ');
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
