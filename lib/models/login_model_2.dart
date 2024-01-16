/// status : 200
/// success : true
/// data : {"id":1,"first_name":"samer","last_name":"metwally","about":"searching for experts","tags":[{"id":1,"name":"إدارة البريد الإلكتروني"}],"favorite_social_media":["facebook"],"salary":100,"email":"samer@gmail.com","birth_date":"1970-01-25","gender":1,"type":{"code":1,"name":"buyer","nice_name":"مشتري"},"avatar":"https://kafiil.s3.eu-central-1.amazonaws.com/media/avatar/f60d29a947c20a54c5d090a4b8a45e2e/ziKtCPFBwiAxd5y5n24JULOej4ENgsyi.png"}
/// access_token : "$2y$10$dXT0YNXk1bu1XnP4CG.b2uNedZKP.8h0dHmPoCwAF/Cn8TRQMXbPy"

class LoginModel2 {
  LoginModel2({
      this.status, 
      this.success, 
      this.data, 
      this.accessToken,});

  LoginModel2.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }
  num? status;
  bool? success;
  Data? data;
  String? accessToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['access_token'] = accessToken;
    return map;
  }

}

/// id : 1
/// first_name : "samer"
/// last_name : "metwally"
/// about : "searching for experts"
/// tags : [{"id":1,"name":"إدارة البريد الإلكتروني"}]
/// favorite_social_media : ["facebook"]
/// salary : 100
/// email : "samer@gmail.com"
/// birth_date : "1970-01-25"
/// gender : 1
/// type : {"code":1,"name":"buyer","nice_name":"مشتري"}
/// avatar : "https://kafiil.s3.eu-central-1.amazonaws.com/media/avatar/f60d29a947c20a54c5d090a4b8a45e2e/ziKtCPFBwiAxd5y5n24JULOej4ENgsyi.png"

class Data {
  Data({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.about, 
      this.tags, 
      this.favoriteSocialMedia, 
      this.salary, 
      this.email, 
      this.birthDate, 
      this.gender, 
      this.type, 
      this.avatar,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    about = json['about'];
    if (json['tags'] != null) {
      tags = [];
      json['tags'].forEach((v) {
        tags?.add(Tags.fromJson(v));
      });
    }
    favoriteSocialMedia = json['favorite_social_media'] != null ? json['favorite_social_media'].cast<String>() : [];
    salary = json['salary'];
    email = json['email'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    type = json['type'] != null ? Type.fromJson(json['type']) : null;
    avatar = json['avatar'];
  }
  num? id;
  String? firstName;
  String? lastName;
  String? about;
  List<Tags>? tags;
  List<String>? favoriteSocialMedia;
  num? salary;
  String? email;
  String? birthDate;
  num? gender;
  Type? type;
  String? avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['about'] = about;
    if (tags != null) {
      map['tags'] = tags?.map((v) => v.toJson()).toList();
    }
    map['favorite_social_media'] = favoriteSocialMedia;
    map['salary'] = salary;
    map['email'] = email;
    map['birth_date'] = birthDate;
    map['gender'] = gender;
    if (type != null) {
      map['type'] = type?.toJson();
    }
    map['avatar'] = avatar;
    return map;
  }

}

/// code : 1
/// name : "buyer"
/// nice_name : "مشتري"

class Type {
  Type({
      this.code, 
      this.name, 
      this.niceName,});

  Type.fromJson(dynamic json) {
    code = json['code'];
    name = json['name'];
    niceName = json['nice_name'];
  }
  num? code;
  String? name;
  String? niceName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['name'] = name;
    map['nice_name'] = niceName;
    return map;
  }

}

/// id : 1
/// name : "إدارة البريد الإلكتروني"

class Tags {
  Tags({
      this.id, 
      this.name,});

  Tags.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  num? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}