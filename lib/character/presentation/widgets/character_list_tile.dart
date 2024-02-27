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
      child: primaryColor != null
          ? Card(
              shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(35)),
              color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Hero(
                      tag: 'tag${widget.character.name}',
                      child: Image.network(
                        widget.character.image,
                      ),
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
                          const SizedBox(height: 14),
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
                          const SizedBox(height: 10),
                          Text(
                            'Specie: ${widget.character.species}',
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Gender: ${widget.character.gender}',
                            style: GoogleFonts.raleway(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          //
          // SHIMMER ANIMATION HERE
          //
          : const CircularProgressIndicator(),
    );
  }
}
