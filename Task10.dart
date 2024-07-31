void main() {
  // Create some books
  var book1 = Book(title: '1984', author: 'George Orwell', publicationYear: 1949);
  var book2 = Book(title: 'To Kill a Mockingbird', author: 'Harper Lee', publicationYear: 1960);
  var book3 = Book(title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', publicationYear: 1925);

  // Create a library and add books to it
  var library = Library();
  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);
  
  print("***************************************");

  // List all books in the library
  print('Books in the library:');
  library.listBooks();

  print("***************************************");
  
  // Remove a book and list again
  library.removeBook('1984');
  print('Books in the library after removal:');
  library.listBooks();
}

class Book {
  final String title;
  final String author;
  final int publicationYear;

  Book({required this.title, required this.author, required this.publicationYear});

  @override
  String toString() {
    return '$title by $author (Published: $publicationYear)';
  }
}

class Library {
  final List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
    print('Added: $book');
  }

  void removeBook(String title) {
    _books.removeWhere((book) => book.title == title);
    print('Removed book with title: $title');
  }

  void listBooks() {
    if (_books.isEmpty) {
      print('No books in the library.');
    } else {
      for (var book in _books) {
        print(book);
      }
    }
  }
}