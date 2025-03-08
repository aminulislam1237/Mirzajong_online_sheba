import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  final List<Library> libraries = const [
    Library(name: 'আল মুজিব লাইব্রেরি', address: 'কলেজ রোড, সুবিদখালী'),
    Library(name: 'শুভেচ্ছা লাইব্রেরি', address: 'কলেজ রোড, সুবিদখালী'),
    Library(name: 'জিনাত পুস্তকালয়', address: 'কলেজ রোড, সুবিদখালী'),
    Library(name: 'সোহাগ লাইব্রেরি', address: 'কলেজ রোড, সুবিদখালী'),
    Library(
        name: 'হিজবুল্লাহ লাইব্রেরি',
        address: 'সুবিদখালী র.ই পাইলট স্কুল সংলগ্ন'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('লাইব্রেরি'),
      ),
      body: ListView.builder(
        itemCount: libraries.length,
        itemBuilder: (context, index) {
          return LibraryCard(library: libraries[index]);
        },
      ),
    );
  }
}

class Library {
  const Library({required this.name, required this.address});

  final String name;
  final String address;
}

class LibraryCard extends StatelessWidget {
  const LibraryCard({
    super.key,
    required this.library,
  });

  final Library library;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              library.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'ঠিকানা: ${library.address}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
