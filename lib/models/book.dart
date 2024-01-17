class Book {
  String title;
  String author;
  String coverImage;
  int quantity;
  String category;
  DateTime? borrowedDate;

  Book({
    required this.title,
    required this.author,
    required this.coverImage,
    required this.quantity,
    required this.category,
    this.borrowedDate,
  });
}
