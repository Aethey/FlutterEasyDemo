// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) => Restaurant(
      restaurantId: json['restaurantId'] as String,
      restaurantName: json['restaurantName'] as String,
      restaurantLocation: json['restaurantLocation'] as String,
      restaurantPhoneNumber: json['restaurantPhoneNumber'] as String,
      restaurantImageId: json['restaurantImageId'] as String,
      bannerUrl: json['bannerUrl'] as String,
    );

Map<String, dynamic> _$RestaurantToJson(Restaurant instance) =>
    <String, dynamic>{
      'restaurantId': instance.restaurantId,
      'restaurantName': instance.restaurantName,
      'restaurantLocation': instance.restaurantLocation,
      'restaurantPhoneNumber': instance.restaurantPhoneNumber,
      'restaurantImageId': instance.restaurantImageId,
      'bannerUrl': instance.bannerUrl,
    };
