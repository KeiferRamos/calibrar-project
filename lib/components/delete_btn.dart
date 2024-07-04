import 'package:calibrar/features/home/gql.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class DeleteBtn extends StatelessWidget {
  final String? id;
  final void Function() refresh;

  const DeleteBtn({super.key, this.id, required this.refresh});

  @override
  Widget build(BuildContext context) {
    if (id != null) {
      void openDialog() {
        showDialog(
          context: context,
          builder: (ctx) => Mutation(
            options: MutationOptions(
              document: gql(delete),
              onCompleted: (data) => refresh(),
            ),
            builder: (runMutation, result) => AlertDialog(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Text(
                "Are you sure you want to delete this Recipient?",
                style: GoogleFonts.nunito(fontSize: 16),
              ),
              title: Row(
                children: [
                  const Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Recipient Deletion",
                    style: GoogleFonts.robotoMono(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    runMutation({"id": id});
                    context.pop();
                    context.pop();
                  },
                  child: const Text("Yes"),
                )
              ],
            ),
          ),
        );
      }

      return Mutation(
        options: MutationOptions(
          document: gql(delete),
          onCompleted: (data) => refresh(),
        ),
        builder: (runMutation, result) => IconButton(
          onPressed: openDialog,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          icon: const Icon(
            Icons.delete,
            color: Color.fromRGBO(120, 171, 168, 1),
          ),
        ),
      );
    }

    return Container();
  }
}
