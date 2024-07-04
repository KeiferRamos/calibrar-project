import 'package:json_annotation/json_annotation.dart';

part 'recipient.g.dart';

@JsonSerializable()
class Recipient {
  @JsonKey(name: "first_name")
  final String firstName;

  @JsonKey(name: "last_name")
  final String lastName;

  @JsonKey(name: "middle_name")
  final String middleName;

  @JsonKey(name: "account_number")
  final String accountNumber;

  @JsonKey(name: "account_name")
  final String accountName;

  final String bank;

  final String? id;

  final String email;

  Recipient({
    this.firstName = "",
    this.lastName = "",
    this.accountName = "",
    this.accountNumber = "",
    this.bank = "BANKO_DE_ORO",
    this.email = "",
    this.middleName = "",
    this.id,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);

  Map<String, dynamic> toJson() => _$RecipientToJson(this);
}
