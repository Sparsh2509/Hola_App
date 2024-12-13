import 'package:flutter/material.dart';
import 'package:hola_app/constants/accounts_list.dart';
import 'package:hola_app/constants/data_constants.dart';
import 'package:hola_app/constants/size.dart';
import 'package:hola_app/services/user_services.dart';
import 'package:hola_app/shared/accounts_card.dart';

// ignore: must_be_immutable
class Accounts extends StatefulWidget {
  const Accounts({super.key});

  @override
  State<Accounts> createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  @override
  void initState() {
    getAllUsers();
    super.initState();
  }

  void getAllUsers() {
    if (allUsers.length == 0) {
      UserServices().getAllUsers().then((onValue) {}).catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          e,
          textAlign: TextAlign.center,
        )));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: AccountsCard(
              imageUrl: allUsers[index].imageUrl!,
              text: allUsers[index].name,
              subtitle: allUsers[index].userName,
              id: allUsers[index].id,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: screenHeight * 0.0);
        },
        itemCount: allUsers.length);
  }
}
