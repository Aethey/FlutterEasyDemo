import 'package:json_annotation/json_annotation.dart';

part 'restaurant_entity.g.dart';

// this is a example for show you how to use json_annotation
// cmd: flutter pub run build_runner build

@JsonSerializable()
class Restaurant {
  final String restaurantId;
  final String restaurantName;
  final String restaurantLocation;
  final String restaurantPhoneNumber;
  final String restaurantImageId;
  final String bannerUrl;

  Restaurant({
    required this.restaurantId,
    required this.restaurantName,
    required this.restaurantLocation,
    required this.restaurantPhoneNumber,
    required this.restaurantImageId,
    required this.bannerUrl,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);
}
