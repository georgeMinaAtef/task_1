/// status : 200
/// success : true
/// data : [{"id":1,"country_code":"AF","name":"Afghanistan","capital":"Badakhshan"},{"id":2,"country_code":"AL","name":"Albania","capital":"Berat"},{"id":3,"country_code":"DZ","name":"Algeria","capital":"'Ayn Daflah"},{"id":4,"country_code":"AS","name":"American Samoa","capital":"Eastern"},{"id":5,"country_code":"AD","name":"Andorra","capital":"Andorra la Vella"},{"id":6,"country_code":"AO","name":"Angola","capital":"Bengo"},{"id":7,"country_code":"AI","name":"Anguilla","capital":"Other Provinces"},{"id":8,"country_code":"AQ","name":"Antarctica","capital":"Sector claimed by Argentina/Ch"},{"id":9,"country_code":"AG","name":"Antigua And Barbuda","capital":"Barbuda"},{"id":10,"country_code":"AR","name":"Argentina","capital":"Buenos Aires"}]
/// pagination : {"count":10,"total":246,"perPage":10,"currentPage":1,"totalPages":25,"links":{"next":"https://test.kafiil.com/api/test/country?page=2"}}

class CountryModel {
  CountryModel({
      this.status, 
      this.success, 
      this.data, 
      this.pagination,});

  CountryModel.fromJson(dynamic json) {
    status = json['status'];
    success = json['success'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CountryData.fromJson(v));
      });
    }
    pagination = json['pagination'] != null ? Pagination.fromJson(json['pagination']) : null;
  }
  num? status;
  bool? success;
  List<CountryData>? data;
  Pagination? pagination;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['success'] = success;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      map['pagination'] = pagination?.toJson();
    }
    return map;
  }

}

/// count : 10
/// total : 246
/// perPage : 10
/// currentPage : 1
/// totalPages : 25
/// links : {"next":"https://test.kafiil.com/api/test/country?page=2"}

class Pagination {
  Pagination({
      this.count, 
      this.total, 
      this.perPage, 
      this.currentPage, 
      this.totalPages, 
      this.links,});

  Pagination.fromJson(dynamic json) {
    count = json['count'];
    total = json['total'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  num? count;
  num? total;
  num? perPage;
  num? currentPage;
  num? totalPages;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['total'] = total;
    map['perPage'] = perPage;
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }

}

/// next : "https://test.kafiil.com/api/test/country?page=2"

class Links {
  Links({
      this.next,});

  Links.fromJson(dynamic json) {
    next = json['next'];
  }
  String? next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['next'] = next;
    return map;
  }

}

/// id : 1
/// country_code : "AF"
/// name : "Afghanistan"
/// capital : "Badakhshan"

class CountryData {
  CountryData({
      this.id, 
      this.countryCode, 
      this.name, 
      this.capital,});

  CountryData.fromJson(dynamic json) {
    id = json['id'];
    countryCode = json['country_code'];
    name = json['name'];
    capital = json['capital'];
  }
  num? id;
  String? countryCode;
  String? name;
  String? capital;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['country_code'] = countryCode;
    map['name'] = name;
    map['capital'] = capital;
    return map;
  }

}