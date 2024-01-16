/// status : 200
/// success : true
/// data : [{"id":13,"main_image":"https://kafiil.com//storage/images/products/deb37f1e-aefe-4347-b352-7d97d0d45336.jpg","price":5,"discount":null,"price_after_discount":5,"title":"أقوم بربط الدومين الخاص بك في جودادي بمدونتك في بلوجر","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":14,"main_image":"https://kafiil.com//storage/images/products/7cae58b9-df70-4a9e-a63e-83a87ee262d7.jpg","price":5,"discount":null,"price_after_discount":5,"title":"سأقوم برفع تطبيقك علي جوجل بلاي","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":18,"main_image":"https://kafiil.com//storage/images/products/2d0b7950-1861-4b20-be96-85427e323553.png","price":5,"discount":null,"price_after_discount":5,"title":"سأزيل أسمك من برنامج تروكولر وامنع اسمك من الظهور للعامة","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":19,"main_image":"https://kafiil.com//storage/images/products/c17fc579-6d2d-43e4-b872-baeeebab7e1b.jpg","price":5,"discount":null,"price_after_discount":5,"title":"كتاب تعلم صناعة تطبيقات الأندرويد","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":20,"main_image":"https://kafiil.com//storage/images/products/a4761d75-38d3-4efc-9d14-d9ae5cb8fd4f.jpg","price":5,"discount":null,"price_after_discount":5,"title":"كتاب أسرار صناعة المنظفات الصناعية","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":21,"main_image":"https://kafiil.com//storage/images/products/203b8020-f8f1-4fab-b34f-7631a9c092b8.jpg","price":5,"discount":null,"price_after_discount":5,"title":"تطبيق أندرويد متجر إلكتروني","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":22,"main_image":"https://kafiil.com//storage/images/products/87a896f7-4902-4adb-b276-14e8ba0c86e7.jpg","price":5,"discount":null,"price_after_discount":5,"title":"تحويل صورتك الى شعار وايقونة لقناتك ومدونتك مع ملف psd","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":23,"main_image":"https://kafiil.com//storage/images/products/dfc00865-1021-48d5-a2e6-b3fbb75e0cef.jpg","price":5,"discount":null,"price_after_discount":5,"title":"نشر مقاطع فيديو في قناتك على مواقع فيديو","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":24,"main_image":"https://kafiil.com//storage/images/products/440459c7-8ea3-4608-be81-ee83afc0895d.jpg","price":5,"discount":null,"price_after_discount":5,"title":"انشاء مدونة والتعديل عليها ومواضيع وربطها بدومين","average_rating":0,"completed_sales_count":0,"recommended":false},{"id":27,"main_image":"https://kafiil.com//storage/images/products/12b5899f-088e-416b-985a-3a36f9e81b81.png","price":50,"discount":null,"price_after_discount":50,"title":"هل يمكن لمقالة واحدة أن تصنع لك الفرق","average_rating":0,"completed_sales_count":0,"recommended":false}]

class ServicePopularModel {
  ServicePopularModel({
      this.status, 
      this.success, 
      this.data,});

  ServicePopularModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? status;
  bool? success;
  List<Data>? data;

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

/// id : 13
/// main_image : "https://kafiil.com//storage/images/products/deb37f1e-aefe-4347-b352-7d97d0d45336.jpg"
/// price : 5
/// discount : null
/// price_after_discount : 5
/// title : "أقوم بربط الدومين الخاص بك في جودادي بمدونتك في بلوجر"
/// average_rating : 0
/// completed_sales_count : 0
/// recommended : false

class Data {
  Data({
      this.id, 
      this.mainImage, 
      this.price, 
      this.discount, 
      this.priceAfterDiscount, 
      this.title, 
      this.averageRating, 
      this.completedSalesCount, 
      this.recommended,});

  Data.fromJson(dynamic json) {
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