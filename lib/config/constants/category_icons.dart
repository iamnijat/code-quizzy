import 'package:flutter/material.dart';

/// The categories endpoint labels each group with a Lucide icon name.
/// Topics are loaded at runtime, so they have no bundled artwork - these are
/// the Material equivalents used in their place.
abstract class CategoryIcons {
  static const fallback = Icons.quiz;

  static const _byName = <String, IconData>{
    'Atom': Icons.science,
    'BookOpen': Icons.menu_book,
    'Calculator': Icons.calculate,
    'Cloud': Icons.cloud,
    'Code2': Icons.code,
    'Database': Icons.storage,
    'Globe': Icons.public,
    'Landmark': Icons.account_balance,
    'Shield': Icons.shield,
    'Sparkles': Icons.auto_awesome,
    'TrendingUp': Icons.trending_up,
    'Tv': Icons.tv,
  };

  static IconData resolve(String? name) => _byName[name] ?? fallback;
}
