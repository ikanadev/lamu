import 'package:flutter/widgets.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({super.key, required this.icon, this.size = 24, this.color});

  /// Null renders a blank box of [size] — for an unrecognized icon key.
  final AppIcons? icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
    if (icon == null) return SizedBox.square(dimension: size);

    return VectorGraphic(
      loader: AssetBytesLoader(icon.assetPath),
      width: size,
      height: size,
      colorFilter:
          color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

enum AppIcons {
  arandano,
  capuccino,
  chicle,
  durazno,
  frappe,
  fresa,
  fresasConCrema,
  jugo,
  leche,
  limon,
  maracuya,
  nutella,
  oreo,
  tumbo;

  String get assetPath => 'assets/icons/vec/$name.vec';

  static AppIcons? tryParse(String value) {
    for (final icon in values) {
      if (icon.name == value) return icon;
    }
    return null;
  }
}
