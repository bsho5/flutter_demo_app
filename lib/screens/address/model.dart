// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AddressModel {
  String type;
  String street;
  String fullAddress;
  AddressModel({
    required this.type,
    required this.street,
    required this.fullAddress,
  });

  AddressModel copyWith({
    String? type,
    String? street,
    String? fullAddress,
  }) {
    return AddressModel(
      type: type ?? this.type,
      street: street ?? this.street,
      fullAddress: fullAddress ?? this.fullAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'street': street,
      'fullAddress': fullAddress,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      type: map['type'] as String,
      street: map['street'] as String,
      fullAddress: map['fullAddress'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddressModel(type: $type, street: $street, fullAddress: $fullAddress)';

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.street == street &&
        other.fullAddress == fullAddress;
  }

  @override
  int get hashCode => type.hashCode ^ street.hashCode ^ fullAddress.hashCode;
}
