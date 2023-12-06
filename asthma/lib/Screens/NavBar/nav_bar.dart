import 'package:asthma/Screens/HomeScreen/home_screen%20copy.dart';
import 'package:asthma/Screens/NavBar/navigator_bar.dart';
import 'package:asthma/Screens/chatGPT/chat_gpt.dart';
import 'package:asthma/constants/colors.dart';
import 'package:flutter/material.dart';

class NavigatorBarScreen extends StatefulWidget {
  const NavigatorBarScreen({super.key});

  @override
  State<NavigatorBarScreen> createState() => _NavigatorBarScreenState();
}

class _NavigatorBarScreenState extends State<NavigatorBarScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  int selectedindex = 0;
  List scrren = [
    const HomeScreen(),
    const HomeScreen(),
    const ChatGPT(),
    const HomeScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        height: 60,
        color: ColorPaltte().lightgreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NavigatorBar(
                isSelect: selectedindex == 0 ? true : false,
                icons: Icons.chat_bubble,
                onPressed: () {
                  selectedindex = 0;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: NavigatorBar(
                isSelect: selectedindex == 1 ? true : false,
                icons: Icons.mail,
                onPressed: () {
                  selectedindex = 1;
                  setState(() {});
                },
              ),
            ),
            const Expanded(child: SizedBox()),
            Expanded(
              child: NavigatorBar(
                isSelect: selectedindex == 2 ? true : false,
                icons: Icons.calendar_month_rounded,
                onPressed: () {
                  selectedindex = 2;
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: NavigatorBar(
                isSelect: selectedindex == 3 ? true : false,
                icons: Icons.more_horiz,
                onPressed: () {
                  selectedindex = 3;
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton(
          backgroundColor: ColorPaltte().darkBlue,
          foregroundColor: ColorPaltte().white,
          shape: const CircleBorder(),
          onPressed: () {
            showBottomSheet(
                context: context,
                builder: (context) => Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Medicine Name',
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: quantityController,
                            decoration: const InputDecoration(
                              labelText: 'Quantity',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: daysController,
                            decoration: const InputDecoration(
                              labelText: 'Number of Days',
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ));
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: scrren[selectedindex],
    );
  }
}