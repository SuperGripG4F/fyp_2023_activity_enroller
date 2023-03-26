class Announcements {
  late List<AnnouncementModel> _announcements;

  List<AnnouncementModel> get announcements => _announcements;

  Announcements({required announcements}) {
    this._announcements = announcements;
  }

  Announcements.fromJson(Map<String, dynamic> json) {
    if (json['announcements'] != null) {
      _announcements = <AnnouncementModel>[];
      json['announcements'].forEach((v) {
        _announcements.add(AnnouncementModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (announcements != null) {
      data['announcements'] = announcements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AnnouncementModel {
  int? id;
  String? title;
  String? content;
  String? activityName;
  String? userName;
  String? createdDate;

  AnnouncementModel(
      {this.id,
      this.title,
      this.content,
      this.activityName,
      this.userName,
      this.createdDate});

  AnnouncementModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    activityName = json['activity_name'];
    userName = json['username'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['activity_name'] = activityName;
    data['username'] = userName;
    data['created_date'] = createdDate;
    return data;
  }
}
