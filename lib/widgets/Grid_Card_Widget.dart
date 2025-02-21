import 'package:flutter/material.dart';
import 'package:musf_app1/pages/Clinic_Screen.dart';
import 'package:musf_app1/pages/Diagnostic_Screen.dart';
import 'package:musf_app1/pages/contact.dart';

import '../pages/iformation_screen.dart';
import 'Labeled_Container.dart';

class GridCardWidget extends StatelessWidget {
  const GridCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.65, // Adjusted with MediaQuery
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                // Important if items can expand
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap:(){
                          Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.phone,
                          text: 'Emergency',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.phone_android,
                          text: 'Police satation',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.wifi,
                          text: 'WiFi Line',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.signal_cellular_connected_no_internet_4_bar,
                          text: 'Dish Line',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.business_center,
                          text: 'Business ZOne',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.cabin,
                          text: 'Hotel',

                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.hotel,
                          text: 'Vip',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.bathtub_outlined,
                          text: 'News',
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              _buildCard(
                context,
                "assets/icon/map.png",
                'মানচিত্র',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Informationscreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/clinic.png",
                'ক্লিনিক',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClinicScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/diagonitis.png",
                'ডায়াগনস্টিক ',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiagnosticScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              // Add your navigation or action here
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/slide1.png',
                    width: screenWidth * .866, // Responsive width
                    height: screenHeight * 0.15, // Responsive height
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildCard(
                context,
                "assets/icon/hospital.png",
                'হাসপাতাল',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/clinic.png",
                'ক্লিনিক',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/diagonitis.png",
                'ডায়াগনস্টিক ',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildCard(
                context,
                "assets/icon/hospital.png",
                'হাসপাতাল',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/clinic.png",
                'ক্লিনিক',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/diagonitis.png",
                'ডায়াগনস্টিক ',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildCard(
                context,
                "assets/icon/hospital.png",
                'হাসপাতাল',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/clinic.png",
                'ক্লিনিক',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/diagonitis.png",
                'ডায়াগনস্টিক ',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      BuildContext context, String imagePath, String title, Function onTap) {
    double cardHeight =
        MediaQuery.of(context).size.height * 0.2; // Adjusted with MediaQuery

    return Flexible(
      child: SizedBox(
        height: cardHeight, // Responsive card height
        child: InkWell(
          onTap: () => onTap(),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    height: cardHeight * 0.5, // Responsive image size
                  ),
                ),
                Center(child: Text(title)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
