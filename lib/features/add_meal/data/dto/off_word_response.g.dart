// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'off_word_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OFFWordResponse _$OFFWordResponseFromJson(Map<String, dynamic> json) =>
    OFFWordResponse(
      count: (json['count'] as num?)?.toDouble(),
      page: json['page'] as int?,
      page_count: json['page_count'] as int?,
      page_size: json['page_size'] as int?,
      products: (json['products'] as List<dynamic>)
          .map((e) => OFFProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OFFWordResponseToJson(OFFWordResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'page': instance.page,
      'page_count': instance.page_count,
      'page_size': instance.page_size,
      'products': instance.products,
    };
