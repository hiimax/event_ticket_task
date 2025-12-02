// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketResponseModel _$TicketResponseModelFromJson(Map<String, dynamic> json) =>
    TicketResponseModel(
      data:
          (json['data'] as List<dynamic>)
              .map(
                (e) => TicketResponseData.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$TicketResponseModelToJson(
  TicketResponseModel instance,
) => <String, dynamic>{'data': instance.data};
