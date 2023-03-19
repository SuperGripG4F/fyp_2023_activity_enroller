
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fyp_2023_activity_enroller/utils/app_constants.dart';
import 'package:fyp_2023_activity_enroller/widgets/header.dart';
import 'package:http/http.dart' as http;

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/enrty_point.dart';

class AnnouncementsDetailPage extends StatefulWidget {
  final int activityId;

  AnnouncementsDetailPage({required this.activityId});

  @override
  _AnnouncementsPageState createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsDetailPage> {
  List<Announcement> _announcements = [];

  @override
  void initState() {
    super.initState();
    _fetchAnnouncements();
  }

  void _fetchAnnouncements() async {
    String url = AppConstants.BASE_URL + AppConstants.ANNOUNCEMENT_URL;
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> data = json.decode(response.body);
      List<Announcement> announcements =
          data.map((item) => Announcement.fromJson(item)).toList();
      setState(() {
        _announcements = announcements;
      });
    } else {
      print('Failed to fetch announcements');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Header_info(),
          Expanded(
            child: ListView.builder(
              itemCount: _announcements.length,
              itemBuilder: (context, index) {
                Announcement announcement = _announcements[index];
                return ListTile(
                  title: Text(announcement.title),
                  subtitle: Text(announcement.description),
                  trailing: Text(announcement.date),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const EntryPoint(),
    );
  }
}

class Announcement {
  final String title;
  final String description;
  final String date;

  Announcement(
      {required this.title, required this.description, required this.date});

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      title: json['title'],
      description: json['description'],
      date: json['date'],
    );
  }
}
