
import 'dart:convert';

List<Store> storeFromJson(String str) => List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store {
  String id;
  String county;
  int licenseNumber;
  String operationType;
  String establishmentType;
  String entityName;
  String dbaName;
  int streetNumber;
  String streetName;
  String city;
  String state;
  int zipCode;
  int squareFootage;
  int v;

  Store({
    this.id,
    this.county,
    this.licenseNumber,
    this.operationType,
    this.establishmentType,
    this.entityName,
    this.dbaName,
    this.streetNumber,
    this.streetName,
    this.city,
    this.state,
    this.zipCode,
    this.squareFootage,
    this.v,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["_id"],
    county: json["county"],
    licenseNumber: json["license_number"],
    operationType: json["operation_type"],
    establishmentType: json["establishment_type"],
    entityName: json["entity_name"],
    dbaName: json["DBA_name"],
    streetNumber: json["street_number"],
    streetName: json["street_name"],
    city: json["city"],
    state: json["state"],
    zipCode: json["zip_code"],
    squareFootage: json["square_footage"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "county": county,
    "license_number": licenseNumber,
    "operation_type": operationType,
    "establishment_type": establishmentType,
    "entity_name": entityName,
    "DBA_name": dbaName,
    "street_number": streetNumber,
    "street_name": streetName,
    "city": city,
    "state": state,
    "zip_code": zipCode,
    "square_footage": squareFootage,
    "__v": v,
  };
}
