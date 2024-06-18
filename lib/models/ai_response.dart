import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AIResponse {
  final String output;

  AIResponse({ required this.output});

  factory AIResponse.fromJson(Map<String, dynamic> json) => AIResponse(output: json["output"] );

  String toJson() => output;
}