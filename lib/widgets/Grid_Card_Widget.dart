import 'package:flutter/material.dart';
import 'package:musf_app1/Icon%20Page/Press_screen.dart';
import 'package:musf_app1/pages/contact.dart';
import 'package:musf_app1/pages/post_office_screen.dart';
import '../Icon Page/Famous_person.dart';
import '../Icon Page/Hotel_screen.dart';
import '../Icon Page/Newspapers_Screen.dart';
import '../Icon Page/bussiness_zone.dart';
import '../Icon Page/dish_Lilne_screen.dart';
import '../Icon Page/police_screen.dart';
import '../Icon Page/wifiLine_screen.dart';
import '../pages/Acadamey_screen.dart';
import '../pages/Bank_screen.dart';
import '../pages/Health_information_screen.dart';
import '../pages/Historical_Pleace_Screen.dart';
import '../pages/Rent_car_screen.dart';
import '../pages/Transport_screen.dart';
import '../pages/commentty_screen.dart';
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
                            MaterialPageRoute(builder: (context) => const PressScreen(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.call_outlined,
                          text: 'Press',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PoliceScreen(),),);
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
                            MaterialPageRoute(builder: (context) => const WifiLineScreen(),),);
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
                            MaterialPageRoute(builder: (context) => const DishScreen(),),);
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
                            MaterialPageRoute(builder: (context) => const BussinessZone(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.business_center,
                          text: 'Business Zone',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HotelScreen(),),);
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
                            MaterialPageRoute(builder: (context) => const FamousPerson(),),);
                        },
                        child: const LabeledContainer(
                          icon: Icons.hotel,
                          text: 'Famous Preson',
                        ),
                      ),
                      InkWell(
                        onTap:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const NewspapersScreen(),),);
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
          const SizedBox(height: 8),
          Row(
            children: [
              _buildCard(
                context,
                "assets/icon/map.png",
                'উপজেলা তথ্য ',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Informationscreen ()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/pleace.png",
                'দর্শনীয় স্থান',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HistoricalPleaceScreen ()),
                  );
                },
              ),

              _buildCard(
                context,
                "assets/icon/post office.png",
                'পোস্ট অফিস',
                    () {
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
              _buildCard(
                context,
                "assets/icon/hospital.png",
                'স্বাস্থ্যসেবা',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  const HealthInformationScreen()),
                  );
                },
              ),

              _buildCard(
                context,
                "assets/icon/shcool.png",
                'শিক্ষা প্রতিষ্ঠান',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AcadameyScreeen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/bank.png",
                'আর্থিক প্রতিষ্ঠান',
                    () {
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

              _buildCard(
                context,
                "assets/icon/dish.png",
                'ডিস সার্ভিস',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DishScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/wifi.png",
                'ইন্টারনেট সার্ভিস',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WifiLineScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/bus.png",
                'পরিবহন সেবা',
                    () {
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

              _buildCard(
                context,
                "assets/icon/comnety.png",
                'সংগঠন',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CommitteeScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/musf.jpg",
                'MUSF',
                    () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
              ),
              _buildCard(
                context,
                "assets/icon/Logo[1].jpg",
                'অ্যাপ সম্পর্কে',
                    () {
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
