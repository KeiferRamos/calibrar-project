import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class MainBar extends StatelessWidget implements PreferredSizeWidget {
  const MainBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleTextStyle: GoogleFonts.mcLaren(
        color: const Color.fromARGB(255, 85, 84, 84),
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(239, 156, 102, 1),
        size: 30,
      ),
      backgroundColor: const Color.fromRGBO(252, 220, 148, 1),
      toolbarHeight: 110,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Flutter Project"),
          Text("Calibrar"),
        ],
      ),
      actions: [
        IconButton(
          style: IconButton.styleFrom(
            iconSize: 23,
            padding: const EdgeInsets.all(12),
            backgroundColor: Colors.white,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () => context.go("/"),
          icon: const Icon(Icons.home),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          style: IconButton.styleFrom(
            iconSize: 23,
            padding: const EdgeInsets.all(12),
            backgroundColor: Colors.white,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () => context.go("/rick-morty"),
          icon: const Icon(Icons.person),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
