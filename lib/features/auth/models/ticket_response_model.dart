import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_response_model.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class TicketResponseModel {
  final List<TicketResponseData> data;

  TicketResponseModel({required this.data});

  factory TicketResponseModel.fromJson(Map<String, dynamic> json) =>
      TicketResponseModel(
        data:
            json['data'] != null && json['data'] != []
                ? List<TicketResponseData>.from(
                  json["data"].map((x) => TicketResponseData.fromJson(x)),
                )
                : <TicketResponseData>[],
      );

  factory TicketResponseModel.empty() =>
      TicketResponseModel(data: <TicketResponseData>[]);

  TicketResponseModel copyWith({List<TicketResponseData>? data}) {
    return TicketResponseModel(data: data ?? this.data);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((x) => x.toJson()).toList(),
    };
  }

}

class TicketResponseData {
  final String ticketPrice;
  final String artist;
  final String duration;
  final String location;
  final String locationHex;
  final String eventDate;
  final String ticketRef;
  final int quantityAvailable;
  final bool purchased;
  final bool favorited;
  final String purchasedAt;

  TicketResponseData({
    required this.ticketPrice,
    required this.artist,
    required this.duration,
    required this.location,
    required this.locationHex,
    required this.eventDate,
    required this.ticketRef,
    required this.quantityAvailable,
    required this.purchased,
    required this.purchasedAt,
    required this.favorited,
  });

  factory TicketResponseData.fromJson(Map<String, dynamic> json) =>
      TicketResponseData(
        ticketPrice: json["ticketPrice"] ?? '',
        artist: json["artist"] ?? '',
        duration: json["duration"] ?? '',
        location: json["location"] ?? '',
        locationHex: json["locationHex"] ?? '',
        eventDate: json["eventDate"] ?? '',
        ticketRef: json["ticketRef"] ?? '',
        quantityAvailable: json["quantityAvailable"] ?? 0,
        purchased: json["purchased"] ?? false,
        purchasedAt: json["purchasedAt"] ?? '',
        favorited: json["favorited"] ?? false,
      );

  factory TicketResponseData.empty() => TicketResponseData(
    ticketPrice: '',
    artist: '',
    duration: '',
    location: '',
    locationHex: '',
    eventDate: '',
    ticketRef: '',
    quantityAvailable: 0,
    purchased: false,
    purchasedAt: '',
    favorited: false,
  );

  TicketResponseData copyWith({
    String? ticketPrice,
    String? artist,
    String? duration,
    String? location,
    String? locationHex,
    String? eventDate,
    String? ticketRef,
    int? quantityAvailable,
    bool? purchased,
    String? purchasedAt,
    bool? favorited,
  }) {
    return TicketResponseData(
      ticketPrice: ticketPrice ?? this.ticketPrice,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      location: location ?? this.location,
      locationHex: locationHex ?? this.locationHex,
      eventDate: eventDate ?? this.eventDate,
      ticketRef: ticketRef ?? this.ticketRef,
      quantityAvailable: quantityAvailable ?? this.quantityAvailable,
      purchased: purchased ?? this.purchased,
      purchasedAt: purchasedAt ?? this.purchasedAt,
      favorited: favorited ?? this.favorited,
    );
  }

  // to json

  Map<String, dynamic> toJson() {
    return {
      "ticketPrice": ticketPrice,
      "artist": artist,
      "duration": duration,
      "location": location,
      "locationHex": locationHex,
      "eventDate": eventDate,
      "ticketRef": ticketRef,
      "quantityAvailable": quantityAvailable,
      "purchased": purchased,
      "purchasedAt": purchasedAt,
      "favorited": favorited,
    };
  }

  Map<String, dynamic> toPrint() {
    return {
      "Amount": ticketPrice,
      "Ticket": artist,
      
      "purchasedAt": purchasedAt,
    };
  }

  

}
