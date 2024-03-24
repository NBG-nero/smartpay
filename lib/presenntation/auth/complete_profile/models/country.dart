import 'dart:convert';

import 'package:flutter/widgets.dart';

class Country {
  final String? flagUrl;
  final String? initials;
  final String? name;
  bool isSelected;

  Country({
    this.flagUrl,
    this.initials,
    this.name,
    this.isSelected = false,
  });

  Country copyWith({
    ValueGetter<String?>? flagUrl,
    ValueGetter<String?>? initials,
    ValueGetter<String?>? name,
    bool? isSelected,
  }) {
    return Country(
      flagUrl: flagUrl != null ? flagUrl() : this.flagUrl,
      initials: initials != null ? initials() : this.initials,
      name: name != null ? name() : this.name,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flagUrl': flagUrl,
      'initials': initials,
      'name': name,
      'isSelected': isSelected,
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      flagUrl: map['flagUrl'],
      initials: map['initials'],
      name: map['name'],
      isSelected: map['isSelected'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Country(flagUrl: $flagUrl, initials: $initials, name: $name, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Country &&
        other.flagUrl == flagUrl &&
        other.initials == initials &&
        other.name == name &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode {
    return flagUrl.hashCode ^
        initials.hashCode ^
        name.hashCode ^
        isSelected.hashCode;
  }
}

List listOfCountries = [
  Country(
      flagUrl: "assets/images/svgs/us_flag.svg",
      initials: "US",
      name: "United States"),
  Country(
      flagUrl: "assets/images/svgs/united_kingdom.svg",
      initials: "GB",
      name: "United Kingdom"),
  Country(
      flagUrl: "assets/images/svgs/singapore_flag.svg",
      initials: "SG",
      name: "Singapore"),
  Country(
      flagUrl: "assets/images/svgs/china_flag.svg",
      initials: "CN",
      name: "China"),
  Country(
      flagUrl: "assets/images/svgs/netherlands_flag.svg",
      initials: "NL",
      name: "Netherland"),
  Country(
      flagUrl: "assets/images/svgs/indonesia_flag.svg",
      initials: "ID",
      name: "Indonesia")
];
