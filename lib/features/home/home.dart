import 'package:calibrar/components/main_bar.dart';
import 'package:calibrar/components/recipient_container.dart';
import 'package:calibrar/features/home/gql.dart';
import 'package:calibrar/features/recipient-form/recipient_form.dart';
import 'package:calibrar/recipient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(get),
      ),
      builder: (result, {fetchMore, refetch}) {
        ValueNotifier<List<Recipient>> recipients = useState([]);

        useEffect(() {
          if (result.data?["recipients"] != null) {
            recipients.value = (result.data?["recipients"] as List<dynamic>)
                .map((item) => Recipient.fromJson(item))
                .toList();
          }
          return null;
        }, [result]);

        void showForm(String? id) {
          if (refetch != null) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => RecipientForm(
                refresh: refetch,
                id: id,
              ),
            );
          }
        }

        return Scaffold(
          floatingActionButton: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: const Color.fromRGBO(239, 156, 102, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            color: const Color.fromARGB(255, 244, 227, 188),
            icon: const Icon(
              Icons.add,
              size: 35,
            ),
            onPressed: () => showForm(null),
          ),
          backgroundColor: const Color.fromARGB(255, 245, 240, 227),
          appBar: const MainBar(),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
              child: Column(
                children: [
                  ...List.generate(
                    recipients.value.length,
                    (i) => RecipientContainer(
                      item: recipients.value[i],
                      onPressed: () => showForm(recipients.value[i].id),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
