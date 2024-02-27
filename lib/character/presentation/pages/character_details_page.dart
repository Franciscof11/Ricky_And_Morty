import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricky_and_morty/character/data/service/character_response.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({super.key, required this.character, required this.primaryColor});
  final CharacterResponse character;
  final Color? primaryColor;

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.primaryColor,
      body: Column(
        children: [
          Text(
            widget.character.name,
            style: GoogleFonts.raleway(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
