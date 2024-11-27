import 'package:flutter/material.dart';
import 'package:hola_app/constants/colors.dart';
import 'package:hola_app/pages/explore.dart';
import 'package:hola_app/pages/homepage.dart';
import 'package:hola_app/pages/location.dart';
import 'package:hola_app/pages/post.dart';
import 'package:hola_app/pages/profile_section/profile.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});
  
  

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int selectedIndex = 0;


  _updateIndex(int i){
    setState(() {
      selectedIndex = i;
    });
  }

  _getBody(){
    switch (selectedIndex){
      case 0: return const HomePage();
      case 1: return const Explore();
      case 2: return const Post();
      case 3: return const Location();
      case 4: return const Profile();

    }
  }
  // SafeArea(
  //       child: Scaffold(
  //     body: SingleChildScrollView(
  //       child: Container(
  //         height: screenHeight * 0.25,
  //         width: screenWidth,
  //         decoration: BoxDecoration(color: Colors.red),
  //         child: Stack(
  //           children: [
  //             Image.asset("assets/chat_bg_image.png",fit: BoxFit.contain,width: screenWidth,),
  //             Positioned(
  //               bottom: 0,
  //               width: screenWidth/2,
  //               child:Center(
  //                 child: Container(
  //                   height: screenHeight*0.05,
  //                   decoration: BoxDecoration(
  //                     color: Colors.green
  //                   ),
                    
  //                 ),
  //               ),

  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   ));
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(

      body: _getBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:blackColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: _updateIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: selectedIndex == 0 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.explore,
             color: selectedIndex == 1 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: selectedIndex == 2 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
              color: selectedIndex == 3 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: selectedIndex == 4 ? whiteColor :  iconColor,
            ),
            label: "",
          ),
        ],
      ),
    ));
  }
}


