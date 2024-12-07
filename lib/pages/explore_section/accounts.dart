import 'package:flutter/material.dart';
import 'package:hola_app/constants/accounts_list.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/shared/accounts_card.dart';

// ignore: must_be_immutable
class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Expanded(
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  
                },
                child: Row(children: [
                  AccountsCard(
                    imageUrl: accountList[index].imageUrl,
                    text: accountList[index].text,
                    subtitle: accountList[index].subtitle,
                  ),
                ]),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: screenHeight * 0.0);
            },
            itemCount: accountList.length),
      )),
    );
  }
}
