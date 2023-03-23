class User {
  // String image;
  String username;
  String email;
  String firstname;
  String lastname;
  String phone;
  String desc;

  // Constructor
  User({
    // required this.image,
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.desc,
  });

  User copy({
    String? username,
    String? email,
    String? firstname,
    String? lastname,
    String? phone,
    String? desc,
  }) =>
      User(
        // image: imagePath ?? this.image,
        username: username ?? this.username,
        email: email ?? this.email,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        desc: desc ?? this.desc,
      );

  static User fromJson(Map<String, dynamic> json) => User(
        username: json['username'],
        email: json['email'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        phone: json['phone'],
        desc: json['desc'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'firstname': firstname,
        'lastname': lastname,
        'phone': phone,
        'desc': desc,
      };
}
