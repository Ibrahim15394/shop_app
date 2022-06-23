class ShopLoginModel
{
  late bool status;
  late String message;
   UserData? data;

  ShopLoginModel.formJson(Map<String, dynamic>json)
  {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = UserData.formJson(json['data']);
    } else {
      data = null;
    }
  }

}

class UserData
{
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    this.id,
    this.email,
    this.phone,
    this.image,
    this.name,
    this.points,
    this.credit,
    this.token,
});

  // named constructor
  UserData.formJson(Map<String, dynamic> json)
  {
    id = json['id'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    name = json['name'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];

  }

}