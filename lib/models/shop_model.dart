// ignore_for_file: public_member_api_docs, sort_constructors_first
 

class Shop {
  String? id;
  bool isShopOpen;
  String? name;
  double? rate;
  int? ratings;
  String? address;
  String? city;
  String? phone;
  String? email;
  String? cancelationPolicy;
  String? website;
  String? description;
  String? mainPhoto;
  String? genderSpecific;
  Shop({
    this.id,
    this.isShopOpen=false,
    this.name,
    this.rate,
    this.ratings,
    this.address,
    this.city,
    this.phone,
    this.email,
    this.cancelationPolicy,
    this.website,
    this.description,
    this.mainPhoto,
    this.genderSpecific,
  });

  Shop copyWith({
    String? id,
    bool? isShopOpen,
    String? name,
    double? rate,
    int? ratings,
    String? address,
    String? city,
    String? phone,
    String? email,
    String? cancelationPolicy,
    String? website,
    String? description,
    String? mainPhoto,
    String? genderSpecific,
 
  }) {
    return Shop(
      id: id ?? this.id,
      isShopOpen: isShopOpen ?? this.isShopOpen,
      name: name ?? this.name,
      rate: rate ?? this.rate,
      ratings: ratings ?? this.ratings,
      address: address ?? this.address,
      city: city ?? this.city,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      cancelationPolicy: cancelationPolicy ?? this.cancelationPolicy,
      website: website ?? this.website,
      description: description ?? this.description,
      mainPhoto: mainPhoto ?? this.mainPhoto,
      genderSpecific: genderSpecific ?? this.genderSpecific,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isShopOpen': isShopOpen,
      'name': name,
      'rate': rate,
      'ratings': ratings,
      'address': address,
      'city': city,
      'phone': phone,
      'email': email,
      'cancelationPolicy': cancelationPolicy,
      'website': website,
      'description': description,
      'main_photo': mainPhoto,
      'genderSpecific': genderSpecific,
    };
  }

  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      id: json['id'] != null ? json['id'] as String : null,
      isShopOpen: json['is_shop_open'] != null ? json['is_shop_open'].runtimeType==bool?json['is_shop_open']:false : null,
      name: json['name'] != null ? json['name'] as String : null,
      rate: json['rate'] != null ? json['rate'] as double : null,
      ratings: json['ratings'] != null ? json['ratings'] as int : null,
      address: json['address'] != null ? json['address'] as String : null,
      city: json['city'] != null ? json['city'] as String : null,
      phone: json['phone'] != null ? json['phone'] as String : null,
      email: json['email'] != null ? json['email'] as String : null,
      cancelationPolicy: json['cancelationPolicy'] != null ? json['cancelationPolicy'] as String : null,
      website: json['website'] != null ? json['website'] as String : null,
      description: json['description'] != null ? json['description'] as String : null,
      mainPhoto: json['main_photo'] != null ? json['main_photo'] as String : null,
      genderSpecific: json['genderSpecific'] != null ? json['genderSpecific'] as String : null,
    );
  }

 
  @override
  String toString() {
    return 'Shop(id: $id, isShopOpen: $isShopOpen, name: $name, rate: $rate, ratings: $ratings, address: $address, city: $city, phone: $phone, email: $email, cancelationPolicy: $cancelationPolicy, website: $website, description: $description, mainPhoto: $mainPhoto, genderSpecific: $genderSpecific)';
  }

  @override
  bool operator ==(covariant Shop other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.isShopOpen == isShopOpen &&
      other.name == name &&
      other.rate == rate &&
      other.ratings == ratings &&
      other.address == address &&
      other.city == city &&
      other.phone == phone &&
      other.email == email &&
      other.cancelationPolicy == cancelationPolicy &&
      other.website == website &&
      other.description == description &&
      other.mainPhoto == mainPhoto &&
      other.genderSpecific == genderSpecific;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      isShopOpen.hashCode ^
      name.hashCode ^
      rate.hashCode ^
      ratings.hashCode ^
      address.hashCode ^
      city.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      cancelationPolicy.hashCode ^
      website.hashCode ^
      description.hashCode ^
      mainPhoto.hashCode ^
      genderSpecific.hashCode;
  }
}
