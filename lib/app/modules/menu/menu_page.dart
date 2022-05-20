import 'package:arretadas/app/core/components/button.dart';
import 'package:arretadas/app/core/components/text_custom.dart';
import 'package:arretadas/app/core/constants/app_colors.dart';
import 'package:arretadas/app/modules/alert/alert_module.dart';
import 'package:arretadas/app/modules/menu/menu_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MenuPage extends StatefulWidget {
  final String title;
  const MenuPage({Key? key, this.title = 'MenuPage'}) : super(key: key);
  @override
  MenuPageState createState() => MenuPageState();
}

class MenuPageState extends State<MenuPage> {
  final MenuStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Text(
                          'Arretadas',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Exo',
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        store.signOut();
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      child: const TextCustom(
                        text: 'sair',
                        color: AppColors.primaryColor,
                        fontFamily: 'Exo',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Button(
                    margin: const EdgeInsets.only(top: 20),
                    width: (MediaQuery.of(context).size.width * 0.95),
                    height: 70,
                    buttonColor: AppColors.primaryColor.shade600,
                    child: const TextCustom(
                      text: 'pedir socorro',
                      fontSize: 18,
                    ),
                    onPressed: () {
                      Modular.to.push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) {
                            return AlertModule();
                          }));
                      //Modular.to.pushNamed('/alert');
                    }),
                Button(
                  margin: const EdgeInsets.only(top: 20),
                  width: (MediaQuery.of(context).size.width * 0.95),
                  height: 70,
                  buttonColor: AppColors.primaryColor.shade600,
                  child: const TextCustom(
                    text: 'denunciar',
                    fontSize: 18,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/complaints');
                  },
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                      child: const Icon(
                        Icons.import_contacts,
                        size: 50,
                        color: AppColors.primaryColor,
                      ),
                      width: 80.0,
                      height: 80.0,
                      buttonColor: AppColors.primaryColor.shade100,
                      onPressed: () {
                        Navigator.pushNamed(context, '/info');
                      },
                    ),
                    Button(
                      child: const Icon(
                        Icons.local_phone,
                        size: 50,
                        color: AppColors.primaryColor,
                      ),
                      width: 80.0,
                      height: 80.0,
                      buttonColor: AppColors.primaryColor.shade100,
                      onPressed: () {
                        Navigator.pushNamed(context, '/usefulcontacts');
                      },
                    ),
                    Button(
                      child: const Icon(
                        Icons.group,
                        size: 50,
                        color: AppColors.primaryColor,
                      ),
                      width: 80.0,
                      height: 80.0,
                      buttonColor: AppColors.primaryColor.shade100,
                      onPressed: () {
                        Navigator.pushNamed(context, '/friendcontacts');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
