class Gif {
  factory Gif.fromJson(String url) => Gif(
        url: url,
      );

  Gif({
    required this.url,
  });

  final String url;
}
