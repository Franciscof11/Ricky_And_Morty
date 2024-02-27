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
          const SizedBox(height: 0),
          Hero(
            tag: 'tag${widget.character.name}',
            child: Container(
              color: Colors.amber,
              width: double.infinity,
              height: 400,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.character.image,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
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
