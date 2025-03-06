import 'package:flutter/material.dart';
import 'package:musf_app1/Icon%20Page/Press_screen.dart';
import 'package:musf_app1/pages/contact.dart';
import 'package:musf_app1/pages/post_office_screen.dart';
import '../Icon Page/Famous_person.dart';
import '../Icon Page/Newspapers_Screen.dart';
import '../Icon Page/dish_Lilne_screen.dart';
import '../Icon Page/police_screen.dart';
import '../Icon Page/wifiLine_screen.dart';
import '../pages/Acadamey_screen.dart';
import '../pages/Bank_screen.dart';
import '../pages/Health_information_screen.dart';
import '../pages/Historical_Pleace_Screen.dart';
import '../pages/Transport_screen.dart';
import '../pages/commentty_screen.dart';
import '../pages/iformation_screen.dart';
import 'Labeled_Container.dart';
import 'custom_card.dart';

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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PressScreen()),
                          );
                        },
                        child: const LabeledContainer(
                          icon: Icons.call_outlined,
                          text: 'প্রেস',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PoliceScreen()),
                          );
                        },
                        child: const LabeledContainer(
                          icon: Icons.phone_android,
                          text: 'পুলিশ স্টেশন',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const WifiLineScreen()),
                          );
                        },
                        child: const LabeledContainer(
                          icon: Icons.wifi,
                          text: 'ওয়াইফাই লাইন',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const DishScreen()),
                          );
                        },
                        child: const LabeledContainer(
                          icon: Icons.signal_cellular_connected_no_internet_4_bar,
                          text: 'ডিশ লাইন',
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const FamousPerson()),
                          );
                        },
                        child: const LabeledContainer(
                          icon: Icons.hotel,
                          text: 'প্রসিদ্ধ ব্যক্তি',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NewspapersScreen()),
                          );
                        },
                        child: const LabeledContainer(
                          icon: Icons.newspaper,
                          text: 'সংবাদপত্র',
                        ),
                      ),




                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomCard(
                imagePath: "assets/icon/map.png",
                title: 'উপজেলা তথ্য',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Informationscreen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/pleace.png",
                title: 'দর্শনীয় স্থান',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HistoricalPleaceScreen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/post office.png",
                title: 'পোস্ট অফিস',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PostOfficeScreen()),
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
                    'assets/ad Banner/dokan ad.png',
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
              CustomCard(
                imagePath: "assets/icon/hospital.png",
                title: 'স্বাস্থ্যসেবা',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HealthInformationScreen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/shcool.png",
                title: 'শিক্ষা প্রতিষ্ঠান',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AcadameyScreeen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/bank.png",
                title: 'আর্থিক প্রতিষ্ঠান',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BankScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomCard(
                imagePath: "assets/icon/dish.png",
                title: 'ডিস সার্ভিস',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DishScreen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/wifi.png",
                title: 'ইন্টারনেট সার্ভিস',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WifiLineScreen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/bus.png",
                title: 'পরিবহন সেবা',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TransportService()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              CustomCard(
                imagePath: "assets/icon/comnety.png",
                title: 'সংগঠন',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CommitteeScreen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/musf.jpg",
                title: 'MUSF',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              CustomCard(
                imagePath: "assets/icon/Logo[1].jpg",
                title: 'অ্যাপ সম্পর্কে',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 120),

        ],
      ),
    );
  }


}
