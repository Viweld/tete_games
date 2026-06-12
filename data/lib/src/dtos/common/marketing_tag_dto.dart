part of 'common_dtos.dart';

@JsonSerializable(createToJson: false)
@immutable
class MarketingTagDto {
  @JsonKey(name: 'label')
  final String? label;

  @JsonKey(name: 'bg_color')
  final String? bgColor;

  @JsonKey(name: 'text_color')
  final String? textColor;

  const MarketingTagDto({this.label, this.bgColor, this.textColor});

  factory MarketingTagDto.fromJson(Map<String, dynamic> json) => _$MarketingTagDtoFromJson(json);
}
