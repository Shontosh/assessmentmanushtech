/*class ProductsDataResponse {
  ProductsDataResponse({
    Data? data,}){
    _data = data;
  }

  ProductsDataResponse.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  Data? _data;
  ProductsDataResponse copyWith({  Data? data,
  }) => ProductsDataResponse(  data: data ?? _data,
  );
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}*/

class ProductsDataResponse {
  ProductsDataResponse({
    List<Products>? products,
    num? total,}){
    _products = products;
    _total = total;
  }

  ProductsDataResponse.fromJson(dynamic json) {
    if (json['products'] != null) {
      _products = [];
      json['products'].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
    _total = json['total'];
  }
  List<Products>? _products;
  num? _total;
  ProductsDataResponse copyWith({  List<Products>? products,
    num? total,
  }) => ProductsDataResponse(  products: products ?? _products,
    total: total ?? _total,
  );
  List<Products>? get products => _products;
  num? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_products != null) {
      map['products'] = _products?.map((v) => v.toJson()).toList();
    }
    map['total'] = _total;
    return map;
  }

}

class Products {
  Products({
    num? id,
    String? uid,
    String? title,
    String? sku,
    num? weight,
    String? weightUnit,
    num? minimumOrderQuantity,
    num? mrp,
    num? stock,
    List<ProuductImages>? prouductImages,
    Promotion? promotion,}){
    _id = id;
    _uid = uid;
    _title = title;
    _sku = sku;
    _weight = weight;
    _weightUnit = weightUnit;
    _minimumOrderQuantity = minimumOrderQuantity;
    _mrp = mrp;
    _stock = stock;
    _prouductImages = prouductImages;
    _promotion = promotion;
  }

  Products.fromJson(dynamic json) {
    _id = json['id'];
    _uid = json['uid'];
    _title = json['title'];
    _sku = json['sku'];
    _weight = json['weight'];
    _weightUnit = json['weightUnit'];
    _minimumOrderQuantity = json['minimumOrderQuantity'];
    _mrp = json['mrp'];
    _stock = json['stock'];
    if (json['prouductImages'] != null) {
      _prouductImages = [];
      json['prouductImages'].forEach((v) {
        _prouductImages?.add(ProuductImages.fromJson(v));
      });
    }
    _promotion = json['promotion'] != null ? Promotion.fromJson(json['promotion']) : null;
  }
  num? _id;
  String? _uid;
  String? _title;
  String? _sku;
  num? _weight;
  String? _weightUnit;
  num? _minimumOrderQuantity;
  num? _mrp;
  num? _stock;
  List<ProuductImages>? _prouductImages;
  Promotion? _promotion;
  Products copyWith({  num? id,
    String? uid,
    String? title,
    String? sku,
    num? weight,
    String? weightUnit,
    num? minimumOrderQuantity,
    num? mrp,
    num? stock,
    List<ProuductImages>? prouductImages,
    Promotion? promotion,
  }) => Products(  id: id ?? _id,
    uid: uid ?? _uid,
    title: title ?? _title,
    sku: sku ?? _sku,
    weight: weight ?? _weight,
    weightUnit: weightUnit ?? _weightUnit,
    minimumOrderQuantity: minimumOrderQuantity ?? _minimumOrderQuantity,
    mrp: mrp ?? _mrp,
    stock: stock ?? _stock,
    prouductImages: prouductImages ?? _prouductImages,
    promotion: promotion ?? _promotion,
  );
  num? get id => _id;
  String? get uid => _uid;
  String? get title => _title;
  String? get sku => _sku;
  num? get weight => _weight;
  String? get weightUnit => _weightUnit;
  num? get minimumOrderQuantity => _minimumOrderQuantity;
  num? get mrp => _mrp;
  num? get stock => _stock;
  List<ProuductImages>? get prouductImages => _prouductImages;
  Promotion? get promotion => _promotion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uid'] = _uid;
    map['title'] = _title;
    map['sku'] = _sku;
    map['weight'] = _weight;
    map['weightUnit'] = _weightUnit;
    map['minimumOrderQuantity'] = _minimumOrderQuantity;
    map['mrp'] = _mrp;
    map['stock'] = _stock;
    if (_prouductImages != null) {
      map['prouductImages'] = _prouductImages?.map((v) => v.toJson()).toList();
    }
    if (_promotion != null) {
      map['promotion'] = _promotion?.toJson();
    }
    return map;
  }

}

class Promotion {
  Promotion({
    num? id,
    String? createdAt,
    String? title,
    String? type,
    String? description,
    String? startDate,
    String? endDate,
    List<PromotionDetails>? promotionDetails,}){
    _id = id;
    _createdAt = createdAt;
    _title = title;
    _type = type;
    _description = description;
    _startDate = startDate;
    _endDate = endDate;
    _promotionDetails = promotionDetails;
  }

  Promotion.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _title = json['title'];
    _type = json['type'];
    _description = json['description'];
    _startDate = json['startDate'];
    _endDate = json['endDate'];
    if (json['promotionDetails'] != null) {
      _promotionDetails = [];
      json['promotionDetails'].forEach((v) {
        _promotionDetails?.add(PromotionDetails.fromJson(v));
      });
    }
  }
  num? _id;
  String? _createdAt;
  String? _title;
  String? _type;
  String? _description;
  String? _startDate;
  String? _endDate;
  List<PromotionDetails>? _promotionDetails;
  Promotion copyWith({  num? id,
    String? createdAt,
    String? title,
    String? type,
    String? description,
    String? startDate,
    String? endDate,
    List<PromotionDetails>? promotionDetails,
  }) => Promotion(  id: id ?? _id,
    createdAt: createdAt ?? _createdAt,
    title: title ?? _title,
    type: type ?? _type,
    description: description ?? _description,
    startDate: startDate ?? _startDate,
    endDate: endDate ?? _endDate,
    promotionDetails: promotionDetails ?? _promotionDetails,
  );
  num? get id => _id;
  String? get createdAt => _createdAt;
  String? get title => _title;
  String? get type => _type;
  String? get description => _description;
  String? get startDate => _startDate;
  String? get endDate => _endDate;
  List<PromotionDetails>? get promotionDetails => _promotionDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['title'] = _title;
    map['type'] = _type;
    map['description'] = _description;
    map['startDate'] = _startDate;
    map['endDate'] = _endDate;
    if (_promotionDetails != null) {
      map['promotionDetails'] = _promotionDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class PromotionDetails {
  PromotionDetails({
    num? id,
    String? uid,
    String? discountType,
    num? amount,
    dynamic percentage,
    num? ruleWeight,
    num? minWeight,
    num? maxWeight,
    String? weightUnit,
    DiscountProduct? discountProduct,}){
    _id = id;
    _uid = uid;
    _discountType = discountType;
    _amount = amount;
    _percentage = percentage;
    _ruleWeight = ruleWeight;
    _minWeight = minWeight;
    _maxWeight = maxWeight;
    _weightUnit = weightUnit;
    _discountProduct = discountProduct;
  }

  PromotionDetails.fromJson(dynamic json) {
    _id = json['id'];
    _uid = json['uid'];
    _discountType = json['discountType'];
    _amount = json['amount'];
    _percentage = json['percentage'];
    _ruleWeight = json['ruleWeight'];
    _minWeight = json['minWeight'];
    _maxWeight = json['maxWeight'];
    _weightUnit = json['weightUnit'];
    _discountProduct = json['discountProduct'] != null ? DiscountProduct.fromJson(json['discountProduct']) : null;

  }
  num? _id;
  String? _uid;
  String? _discountType;
  num? _amount;
  dynamic _percentage;
  num? _ruleWeight;
  num? _minWeight;
  num? _maxWeight;
  String? _weightUnit;
  DiscountProduct? _discountProduct;
  PromotionDetails copyWith({  num? id,
    String? uid,
    String? discountType,
    num? amount,
    dynamic percentage,
    num? ruleWeight,
    num? minWeight,
    num? maxWeight,
    String? weightUnit,
    DiscountProduct? discountProduct,
  }) => PromotionDetails(  id: id ?? _id,
    uid: uid ?? _uid,
    discountType: discountType ?? _discountType,
    amount: amount ?? _amount,
    percentage: percentage ?? _percentage,
    ruleWeight: ruleWeight ?? _ruleWeight,
    minWeight: minWeight ?? _minWeight,
    maxWeight: maxWeight ?? _maxWeight,
    weightUnit: weightUnit ?? _weightUnit,
    discountProduct: discountProduct ?? _discountProduct,
  );
  num? get id => _id;
  String? get uid => _uid;
  String? get discountType => _discountType;
  num? get amount => _amount;
  dynamic get percentage => _percentage;
  num? get ruleWeight => _ruleWeight;
  num? get minWeight => _minWeight;
  num? get maxWeight => _maxWeight;
  String? get weightUnit => _weightUnit;
  DiscountProduct? get discountProduct => _discountProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uid'] = _uid;
    map['discountType'] = _discountType;
    map['amount'] = _amount;
    map['percentage'] = _percentage;
    map['ruleWeight'] = _ruleWeight;
    map['minWeight'] = _minWeight;
    map['maxWeight'] = _maxWeight;
    map['weightUnit'] = _weightUnit;
    map['discountProduct'] = _discountProduct;
    return map;
  }

}

class ProuductImages {
  ProuductImages({
    num? id,
    String? image,}){
    _id = id;
    _image = image;
  }

  ProuductImages.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
  }
  num? _id;
  String? _image;
  ProuductImages copyWith({  num? id,
    String? image,
  }) => ProuductImages(  id: id ?? _id,
    image: image ?? _image,
  );
  num? get id => _id;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    return map;
  }


}
class DiscountProduct {
  final int id;
  final String title;
  final List<ProductImage> productImages;

  DiscountProduct({
    required this.id,
    required this.title,
    required this.productImages,
  });

  factory DiscountProduct.fromJson(Map<String, dynamic> json) {
    return DiscountProduct(
      id: json['id'],
      title: json['title'],
      productImages: (json['productImages'] as List)
          .map((image) => ProductImage.fromJson(image))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'productImages': productImages.map((image) => image.toJson()).toList(),
    };
  }
}

class ProductImage {
  final int id;
  final String image;

  ProductImage({
    required this.id,
    required this.image,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      id: json['id'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
    };
  }
}
