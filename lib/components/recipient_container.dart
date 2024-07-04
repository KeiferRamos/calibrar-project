import 'package:calibrar/recipient.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipientContainer extends StatelessWidget {
  final Recipient item;

  const RecipientContainer({
    super.key,
    required this.item,
    required this.onPressed,
  });

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(120, 171, 168, 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(239, 156, 102, 1),
              shape: BoxShape.circle,
            ),
            child: Text(
              '${item.firstName[0].toUpperCase()}${item.lastName[0].toUpperCase()}',
              style: GoogleFonts.mcLaren(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.firstName} ${item.middleName} ${item.lastName}',
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  item.accountNumber,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 25,
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onPressed: onPressed,
            icon: const Icon(
              Icons.edit,
              color: Color.fromRGBO(239, 156, 102, 1),
            ),
          )
        ],
      ),
    );
  }
}
