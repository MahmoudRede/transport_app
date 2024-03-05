class UserModel {
  final String userName;
  final String email;
  final String phone;
  final String address;
  final String about;
  final String kind;
  final String personalImage;
  final String carImage;


  UserModel({
    required this.userName,
    required this.email,
    required this.phone,
    required this.address,
    required this.about,
    required this.kind,
    required this.personalImage,
    required this.carImage,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      userName: json["userName"]??"",
      email: json["email"]??"",
      phone: json["phone"]??"",
      address: json["address"]??"",
      about: json["about"]??"",
      kind: json["kind"]??"",
      personalImage: json["personalImage"]??"",
      carImage: json["carImage"]??"",

  );

  Map<String, dynamic> toMap() => {
    "userName": userName,
    "email": email,
    "phone": phone,
    "address": address,
    "about": about,
    "kind": kind,
    "personalImage": personalImage,
    "carImage": carImage,

  };
}