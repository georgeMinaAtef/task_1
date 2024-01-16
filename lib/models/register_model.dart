/// message : "The given data was invalid."
/// errors : {"tags":["يجب أن يكون حقل الأوسمة ًمصفوفة."],"favorite_social_media":["يجب أن يكون حقل favorite social media ًمصفوفة."],"email":["قيمة حقل البريد الإلكترونى مُستخدمة من قبل."],"type":["يجب على حقل النوع أن يكون رقمًا.","حقل النوع غير موجود."]}

class RegisterModel {
  RegisterModel({
      this.message, 
      this.errors,});

  RegisterModel.fromJson(dynamic json) {
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }
  String? message;
  Errors? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    return map;
  }

}

/// tags : ["يجب أن يكون حقل الأوسمة ًمصفوفة."]
/// favorite_social_media : ["يجب أن يكون حقل favorite social media ًمصفوفة."]
/// email : ["قيمة حقل البريد الإلكترونى مُستخدمة من قبل."]
/// type : ["يجب على حقل النوع أن يكون رقمًا.","حقل النوع غير موجود."]

class Errors {
  Errors({
      this.tags, 
      this.favoriteSocialMedia, 
      this.email, 
      this.type,});

  Errors.fromJson(dynamic json) {
    tags = json['tags'] != null ? json['tags'].cast<String>() : [];
    favoriteSocialMedia = json['favorite_social_media'] != null ? json['favorite_social_media'].cast<String>() : [];
    email = json['email'] != null ? json['email'].cast<String>() : [];
    type = json['type'] != null ? json['type'].cast<String>() : [];
  }
  List<String>? tags;
  List<String>? favoriteSocialMedia;
  List<String>? email;
  List<String>? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['tags'] = tags;
    map['favorite_social_media'] = favoriteSocialMedia;
    map['email'] = email;
    map['type'] = type;
    return map;
  }

}