import 'package:flutter/material.dart';
// ... other imports

class GridCardWidget extends StatelessWidget {
  const GridCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.65,
      child: SingleChildScrollView( // Add SingleChildScrollView here
        child: Column(
          children: [
            // ... (Horizontal scrollable row - unchanged)
            Wrap( // Use Wrap instead of multiple Rows
              spacing: 8.0, // Adjust spacing as needed
              runSpacing: 8.0, // Adjust run spacing as needed
              children: [
                _buildCard(context, "assets/icon/map.png", 'মানচিত্র', () {
                  // ...
                }),
                _buildCard(context, "assets/icon/clinic.png", 'ক্লিনিক', () {
                  // ...
                }),
                _buildCard(context, "assets/icon/diagonitis.png", 'ডায়াগনস্টিক ', () {
                  // ...
                }),
                // ... (Rest of your _buildCard calls)
                _buildCard(context, "assets/icon/hospital.png", 'হাসপাতাল', () {
                  // ...
                }),
                _buildCard(context, "assets/icon/clinic.png", 'ক্লিনিক', () {
                  // ...
                }),
                _buildCard(context, "assets/icon/diagonitis.png", 'ডায়াগনস্টিক ', () {
                  // ...
                }),
                // ... (Rest of your _buildCard calls)

              ],
            ),
            // ... (Image slider - unchanged)
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String imagePath, String title, Function onTap) {
    double cardHeight = MediaQuery.of(context).size.height * 0.2;

    return SizedBox(
      height: cardHeight,
      width: MediaQuery.of(context).size.width * 0.3, // Fixed width
      child: InkWell(
        onTap: () => onTap(),
        child: Card(
          // ... (Card properties - unchanged)
          child: Column(
            // ... (Column properties - unchanged)
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  height: cardHeight * 0.5,
                ),
              ),
              Center(child: Text(title)),
            ],
          ),
        ),
      ),
    );
  }
}