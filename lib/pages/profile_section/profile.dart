import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/pages/follow_section/follower.dart';
import 'package:hola_app/pages/follow_section/following.dart';
import 'package:hola_app/pages/settings_section/settings_page.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  _profileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // Header Image
                  
                  
                  
                  Container(
                    height: screenHeight*0.25,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/post_image.png'), // Add your header image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    
                     right: 0.0,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: IconButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Settings()),
                            );

                        },
                         icon: const Icon(
                                Icons.settings,
                                color: Colors.black,
                                size: 30,
                                ),
                       ),
                     ),),
                  
                  Positioned(
                    bottom: 0,
                    left: screenWidth / 2 - 50,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/person_image.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight*0.03),
              // Profile Info
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const Text(
                      'Richard Wright',
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    const Text(
                      "I’m delighted to introduce myself\n as aprofessional musician",
                      style: TextStyle(color: whiteColor),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    const Text(
                      'Trusting the process ',
                      style: TextStyle(color: whiteColor, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _profileStat('319', 'Posts'),
                        _profileStat('2.1M', 'Followers'),
                        _profileStat('576', 'Following'),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Following()),
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: whiteColor)),
                              child: const Text(
                                'Edit Profile',
                                style:
                                    TextStyle(color: whiteColor, fontSize: 15),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Follower()),
                            );
                          },
                          child: Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: whiteColor)),
                              child: const Text(
                                'Share Profile',
                                style:
                                    TextStyle(color: whiteColor, fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.02),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: 9, // Adjust based on the number of images
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/post_image.png'), // Add your photo assets
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
