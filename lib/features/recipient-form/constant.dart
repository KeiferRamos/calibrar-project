import 'package:form_validator/form_validator.dart';

final initialValues = {
  "first_name": "",
  "last_name": "",
  "middle_name": "",
  "email": "",
  "bank": "BANKO_DE_ORO",
  "account_number": "",
  "account_name": "",
};

final validationSchema = {
  "first_name": ValidationBuilder().required('This field is required'),
  "last_name": ValidationBuilder().required('This field is required'),
  "email": ValidationBuilder()
      .required('This field is required')
      .email('invalid email'),
  "bank": ValidationBuilder().required('This field is required'),
  "account_number": ValidationBuilder().required('This field is required'),
  "account_name": ValidationBuilder().required('This field is required'),
};

final List<Map<String, dynamic>> inputs = [
  {"name": "first_name", "type": "string"},
  {"name": "middle_name", "type": "string"},
  {"name": "last_name", "type": "string"},
  {"name": "email", "type": "string"},
  {"name": "account_name", "type": "string"},
  {"name": "account_number", "type": "number"},
];
