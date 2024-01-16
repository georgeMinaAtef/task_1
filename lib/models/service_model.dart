/// status : 200
/// success : true
/// data : [{"id":1,"main_image":"https://kafiil.com//storage/images/products/d1bbf83a-b810-485b-878c-2a80093e307b.jpg","price":35,"discount":null,"price_after_discount":35,"title":"سأقوم بكتابة مقالة عن موقعك أو مدونتك ونشرها علي موقعي دومين اثورتي 45","average_rating":5,"completed_sales_count":3,"recommended":false},{"id":2,"main_image":"https://kafiil.com//storage/images/products/65a3151a-f162-4079-a095-e4b35f567986.jpg","price":5,"discount":null,"price_after_discount":5,"title":"شراء أي شيء من الإنترنت بواسطة البايبال","average_rating":5,"completed_sales_count":28,"recommended":false},{"id":3,"main_image":"https://kafiil.com//storage/images/products/ab835f01-6f88-450e-84d2-7a390a7ce095.jpg","price":5,"discount":null,"price_after_discount":5,"title":"تطبيق أندرويد لموقعك او مدونتك","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":4,"main_image":"https://kafiil.com//storage/images/products/a813d9de-af71-4471-bd5b-7468630537f3.jpg","price":5,"discount":null,"price_after_discount":5,"title":"شراء أي شيء من الإنترنت بواسطة الفيزا","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":5,"main_image":"https://kafiil.com//storage/images/products/cb220bdd-de21-4e40-b367-0c617f618f81.jpg","price":5,"discount":null,"price_after_discount":5,"title":"سأقوم بكتابة مقالة عن تطبيقك التقني ونشرها على موقعي","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":6,"main_image":"https://kafiil.com//storage/images/products/7784a032-e3ac-4d33-913c-f1d37c47398e.jpg","price":5,"discount":null,"price_after_discount":5,"title":"حملة إعلانية ممولة على الفيس بوك","average_rating":5,"completed_sales_count":0,"recommended":false},{"id":7,"main_image":"https://kafiil.com//storage/images/products/7009ed63-eb2a-4448-a07b-676a5fec5a4e.png","price":15,"discount":null,"price_after_discount":15,"title":"أعلن على مدونة نبض الكمبيوتر دومين اثورتي 45","average_rating":5,"completed_sales_count":1,"recommended":false},{"id":8,"main_image":"https://kafiil.com//storage/images/products/a4ddaba5-6de5-45b5-b859-88620d2de16a.png","price":5,"discount":null,"price_after_discount":5,"title":"تركيب صندوق تعليقات Disqus لبلوجر","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":9,"main_image":"https://kafiil.com//storage/images/products/48641b09-b0c9-4517-99ff-4163e63012d0.jpg","price":5,"discount":null,"price_after_discount":5,"title":"سأقوم بعمل سجل زوار لمدونتك تمكن الزوار من طرح أسئلتهم عليك","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":10,"main_image":"https://kafiil.com//storage/images/products/95bc8231-6eab-49a2-95b1-2c1cd02edfb1.png","price":5,"discount":null,"price_after_discount":5,"title":"نشر موقعك أو مدونتك في صحف ومجلات جوجل بلاي","average_rating":0,"completed_sales_count":0,"recommended":false}]

class ServiceModel {
  ServiceModel({
      this.status, 
      this.success, 
      this.data,});

  ServiceModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ServiceData.fromJson(v));
      });
    }
  }
  num? status;
  bool? success;
  List<ServiceData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// main_image : "https://kafiil.com//storage/images/products/d1bbf83a-b810-485b-878c-2a80093e307b.jpg"
/// price : 35
/// discount : null
/// price_after_discount : 35
/// title : "سأقوم بكتابة مقالة عن موقعك أو مدونتك ونشرها علي موقعي دومين اثورتي 45"
/// average_rating : 5
/// completed_sales_count : 3
/// recommended : false

class ServiceData {
  ServiceData({
      this.id, 
      this.mainImage, 
      this.price, 
      this.discount, 
      this.priceAfterDiscount, 
      this.title, 
      this.averageRating, 
      this.completedSalesCount, 
      this.recommended,});

  ServiceData.fromJson(dynamic json) {
    id = json['id'];
    mainImage = json['main_image'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    title = json['title'];
    averageRating = json['average_rating'];
    completedSalesCount = json['completed_sales_count'];
    recommended = json['recommended'];
  }
  num? id;
  String? mainImage;
  num? price;
  dynamic discount;
  num? priceAfterDiscount;
  String? title;
  num? averageRating;
  num? completedSalesCount;
  bool? recommended;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['main_image'] = mainImage;
    map['price'] = price;
    map['discount'] = discount;
    map['price_after_discount'] = priceAfterDiscount;
    map['title'] = title;
    map['average_rating'] = averageRating;
    map['completed_sales_count'] = completedSalesCount;
    map['recommended'] = recommended;
    return map;
  }

}