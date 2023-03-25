class Activity {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ActivityModel> _activities;

  //gettet
  List<ActivityModel> get activities => _activities;

  Activity(
      {required totalSize,
      required typeId,
      required offset,
      required activities}) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._activities = activities;
  }

  Activity.fromJson(Map<String, dynamic> json) {
    _totalSize = json['totalSize'];
    _typeId = json['typeId'];
    _offset = json['offset'];
    if (json['activityModel'] != null) {
      _activities = <ActivityModel>[];
      json['activityModel'].forEach((v) {
        _activities.add(new ActivityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalSize'] = this._totalSize;
    data['typeId'] = this._typeId;
    data['offset'] = this._offset;
    if (this._activities != null) {
      data['activityModel'] = this._activities.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActivityModel {
  int? id;
  String? organization;
  String? titleEn;
  String? titleZh;
  String? slogan;
  String? poster;
  int? activityLength;
  List<Dates>? dates;
  String? location;
  String? desc;
  String? validDate;
  int? stars;
  int? comments;
  int? fee;
  String? host;
  String? hostPhone;
  int? vacancy;

  ActivityModel(
      {this.id,
      this.organization,
      this.titleEn,
      this.titleZh,
      this.slogan,
      this.poster,
      this.activityLength,
      this.dates,
      this.location,
      this.desc,
      this.validDate,
      this.stars,
      this.comments,
      this.fee,
      this.host,
      this.hostPhone,
      this.vacancy});

  ActivityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organization = json['organization'];
    titleEn = json['title_en'];
    titleZh = json['title_zh'];
    slogan = json['slogan'];
    poster = json['poster'];
    activityLength = json['activity_length'];
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
    location = json['location'];
    desc = json['desc'];
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
    data['id'] = this.id;
    data['organization'] = this.organization;
    data['title_en'] = this.titleEn;
    data['title_zh'] = this.titleZh;
    data['poster'] = this.poster;
    data['slogan'] = this.slogan;
    data['activity_length'] = this.activityLength;
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['location'] = this.location;
    data['desc'] = this.desc;
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
    startTime = json['start_time'];
    endTime = json['end_time'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['day'] = this.day;
    return data;
  }
}
