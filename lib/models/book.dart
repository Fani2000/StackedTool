import 'package:freezed_annotation/freezed_annotation.dart';
import "package:observable_flutter/models/image_links.dart";

part "book.freezed.dart";
part "book.g.dart";

@freezed
class Book with _$Book {
  factory Book({
    required String title,
    required List<String> authors,
    String? description,
    ImageLinks? imageLinks,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
