import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaginationBtn extends StatelessWidget {
  const PaginationBtn({
    super.key,
    required this.page,
    this.onPressed,
    this.isCurrentPage = false,
  });

  final int? page;
  final void Function()? onPressed;
  final bool isCurrentPage;

  @override
  Widget build(BuildContext context) {
    if (page == null) {
      return Container();
    }

    return IconButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: isCurrentPage
            ? Colors.grey
            : const Color.fromRGBO(120, 171, 168, 1),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      icon: Text(
        page != null ? page.toString() : '',
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
