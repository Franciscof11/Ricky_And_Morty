import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:ricky_and_morty/character/data/service/character_response.dart';
import 'package:ricky_and_morty/character/presentation/pages/character_details_page.dart';

class CharacterListTile extends StatefulWidget {
  const CharacterListTile({super.key, required this.character});

  final CharacterResponse character;
  @override
  State<CharacterListTile> createState() => _CharacterListTileState();
}

class _CharacterListTileState extends State<CharacterListTile> {
  PaletteGenerator? paletteGenerator;

  Future<void> _updatePaletteGenerator(String imagePath) async {
    PaletteGenerator palette = await PaletteGenerator.fromImageProvider(
      NetworkImage(imagePath),
    );

    if (mounted) {
      setState(() {
        paletteGenerator = palette;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _updatePaletteGenerator(widget.character.image);
  }

  @override
  Widget build(BuildContext context) {
    Color? primaryColor = paletteGenerator?.dominantColor?.color;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CharacterDetailsPage(
            character: widget.character,
            primaryColor: primaryColor,
          ),
        ),
      ),
      child: Card(
        color: primaryColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                widget.character.image,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
