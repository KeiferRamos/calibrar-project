// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipient _$RecipientFromJson(Map<String, dynamic> json) => Recipient(
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      accountName: json['account_name'] as String? ?? "",
      accountNumber: json['account_number'] as String? ?? "",
      bank: json['bank'] as String? ?? "BANKO_DE_ORO",
      email: json['email'] as String? ?? "",
      middleName: json['middle_name'] as String? ?? "",
      id: json['id'] as String?,
    );

Map<String, dynamic> _$RecipientToJson(Recipient instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
      'account_number': instance.accountNumber,
      'account_name': instance.accountName,
      'bank': instance.bank,
      'id': instance.id,
      'email': instance.email,
    };
