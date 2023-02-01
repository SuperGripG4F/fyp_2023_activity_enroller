class ActivityModel {
  String? organization;
  String? titleEn;
  String? titleZh;
  String? slogan;
  int? activityLength;
  List<Dates>? dates;
  String? location;
  String? validDate;
  int? stars;
  int? comments;
  int? fee;
  String? host;
  String? hostPhone;
  int? vacancy;

  ActivityModel(
      {this.organization,
      this.titleEn,
      this.titleZh,
      this.slogan,
      this.activityLength,
      this.dates,
      this.location,
      this.validDate,
      this.stars,
      this.comments,
      this.fee,
      this.host,
      this.hostPhone,
      this.vacancy});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    organization = json['organization'];
    titleEn = json['title-en'];
    titleZh = json['title-zh'];
    slogan = json['slogan'];
    activityLength = json['activity-length'];
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
    location = json['location'];
    validDate = json['valid_date'];
    stars = json['stars'];
    comments = json['comments'];
    fee = json['fee'];
    host = json['host'];
    hostPhone = json['host_phone'];
    vacancy = json['vacancy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organization'] = this.organization;
    data['title-en'] = this.titleEn;
    data['title-zh'] = this.titleZh;
    data['slogan'] = this.slogan;
    data['activity-length'] = this.activityLength;
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['location'] = this.location;
    data['valid_date'] = this.validDate;
    data['stars'] = this.stars;
    data['comments'] = this.comments;
    data['fee'] = this.fee;
    data['host'] = this.host;
    data['host_phone'] = this.hostPhone;
    data['vacancy'] = this.vacancy;
    return data;
  }
}

class Dates {
  String? date;
  String? startTime;
  String? endTime;
  String? day;

  Dates({this.date, this.startTime, this.endTime, this.day});

  Dates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    startTime = json['start-time'];
    endTime = json['end-time'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['start-time'] = this.startTime;
    data['end-time'] = this.endTime;
    data['day'] = this.day;
    return data;
  }
}
