import 'package:calibrar/components/custom_dropdown.dart';
import 'package:calibrar/components/custom_text_field.dart';
import 'package:calibrar/components/delete_btn.dart';
import 'package:calibrar/features/home/gql.dart';
import 'package:calibrar/features/recipient-form/constant.dart';
import 'package:calibrar/recipient.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_formik/flutter_formik.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RecipientForm extends HookWidget {
  const RecipientForm({super.key, required this.refresh, this.id});

  final void Function() refresh;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      color: const Color.fromRGBO(252, 220, 148, 1),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 240, 227),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(252, 220, 148, 1),
          toolbarHeight: 80,
          titleTextStyle: GoogleFonts.mcLaren(
            color: const Color.fromARGB(255, 85, 84, 84),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          iconTheme: const IconThemeData(
            color: Color.fromRGBO(255, 85, 84, 84),
            size: 30,
          ),
          title: Text(
            "Create Recipient",
            style: GoogleFonts.mcLaren(),
          ),
          actions: [
            DeleteBtn(
              id: id,
              refresh: refresh,
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: Query(
          options: QueryOptions(
            document: gql(getById),
            variables: {
              "id": id,
            },
          ),
          builder: (result, {fetchMore, refetch}) {
            ValueNotifier<Recipient> initialValue = useState(Recipient());

            useEffect(() {
              if (id != null) {
                final data = result.data?["recipient"];
                initialValue.value = Recipient.fromJson(data);
              }
              return null;
            }, [id]);

            return Mutation(
              options: MutationOptions(
                document: gql(add),
                onCompleted: (data) => refresh(),
              ),
              builder: (runMutation, result) => FormContainer(
                initialValues: initialValue.value.toJson(),
                runCommand: (input) => runMutation({
                  "input": input,
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FormContainer extends StatelessWidget {
  const FormContainer({
    super.key,
    required this.initialValues,
    required this.runCommand,
  });

  final Map<String, dynamic> initialValues;
  final void Function(dynamic) runCommand;

  @override
  Widget build(BuildContext context) {
    return Formik(
      initialValues: initialValues,
      validationSchema: validationSchema,
      onSubmit: (payload, errors) {
        if (errors.isEmpty) {
          runCommand(payload);

          context.pop();
        }
      },
      child: (
        values,
        isValid,
        handleSubmit,
        handleReset,
        handleChange,
        errors,
      ) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
            child: Column(
              children: [
                ...List.generate(
                  inputs.length,
                  (i) => CustomTextField(
                    handleChange: handleChange,
                    filter: inputs[i]["type"] == "string"
                        ? FilteringTextInputFormatter.deny(RegExp('[0-9]'))
                        : FilteringTextInputFormatter.digitsOnly,
                    name: inputs[i]["name"],
                    error: errors["first_name"],
                    values: values,
                  ),
                ),
                CustomDropdown(
                  value: values["bank"],
                  items: const ["BANKO_DE_ORO", "UNION_BANK"],
                  onChanged: (value) => handleChange("bank", value),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: const Color.fromRGBO(120, 171, 168, 1),
                    ),
                    onPressed: () => handleSubmit(),
                    child: Text(
                      "SAVE",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
