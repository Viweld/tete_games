part of 'services_models.dart';

@immutable
class SimpleCategory {
  final int id;
  final String name;
  final CategoryType categoryType;
  final Photo? image;

  const SimpleCategory({
    required this.id,
    required this.name,
    required this.categoryType,
    this.image,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SimpleCategory && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
