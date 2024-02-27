import 'package:flutter/material.dart';
import 'package:giphy_picker/giphy_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ricky_and_morty/character/data/service/character_response.dart';
import 'package:ricky_and_morty/giphy/presentation/gif_widget.dart';

class CharacterDetailsPage extends StatefulWidget {
  const CharacterDetailsPage({super.key, required this.character, required this.primaryColor});
  final CharacterResponse character;
  final Color? primaryColor;

  @override
  State<CharacterDetailsPage> createState() => _CharacterDetailsPageState();
}

class _CharacterDetailsPageState extends State<CharacterDetailsPage> {
  Future<GiphyGif?> gif() async {
    return await GiphyPicker.pickGif(
      context: context,
      apiKey: 'NxfpSBVW76TGs1pX2dBccSMeIZty5kqN',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.primaryColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Text(
                  widget.character.name,
                  style: GoogleFonts.raleway(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text.rich(
                  TextSpan(
                      text: 'Status:  ',
                      style: GoogleFonts.raleway(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: widget.character.status == 'Alive' ? '${widget.character.status} 🙂' : '${widget.character.status} 💀',
                          style: GoogleFonts.raleway(
                            fontSize: 18,
                            color: widget.character.status == 'Alive' ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]),
                ),
                const SizedBox(height: 6),
                Text(
                  'Specie: ${widget.character.species}',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Gender: ${widget.character.gender}',
                  style: GoogleFonts.raleway(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                GifWidget(characterName: widget.character.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
