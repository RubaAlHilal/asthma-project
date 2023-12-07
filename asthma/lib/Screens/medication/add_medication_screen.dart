import 'package:asthma/Screens/breathing/componnets/button_widget.dart';
import 'package:asthma/constants/colors.dart';
import 'package:flutter/material.dart';

import 'components/add_textfield.dart';

class AddMedicationScreen extends StatelessWidget {
  const AddMedicationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController medicationNameController = TextEditingController(),
        medicationQuantitysController = TextEditingController(),
        medicationDateController = TextEditingController(),
        medicationDaysController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              right: -185,
              bottom: 55,
              child: Image.asset(
                "lib/assets/images/stack_background.png",
                color: ColorPaltte().newBlue,
              )),
          Positioned(
              left: -185,
              top: 300,
              child: Image.asset(
                "lib/assets/images/stack_background.png",
                color: ColorPaltte().newBlue,
              )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        "Add Medication",
                        style: TextStyle(
                            color: ColorPaltte().newDarkBlue,
                            fontSize: 25,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      AddTextfield(
                        label: 'medication name',
                        fieldController: medicationNameController,
                        fieldWidth: MediaQuery.of(context).size.width * 0.95,
                        fieldHeight: 55,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AddTextfield(
                            label: 'quantity',
                            fieldController: medicationQuantitysController,
                            fieldWidth:
                                MediaQuery.of(context).size.width * 0.28,
                            fieldHeight: 55,
                          ),
                          AddTextfield(
                            label: 'days',
                            fieldController: medicationDaysController,
                            fieldWidth:
                                MediaQuery.of(context).size.width * 0.28,
                            fieldHeight: 55,
                          ),
                          // TextButton(
                          //     onPressed: () async {
                          //       DateTime? datepicker = await showDatePicker(
                          //           context: context,
                          //           initialDate: DateTime.now(),
                          //           firstDate: DateTime(2023),
                          //           lastDate: DateTime(2045));

                          //       if (datepicker != null) {
                          //       } else {
                          //         String date = datepicker.toString();
                          //         // String formatDate = DateFormat('').format(datepicker);

                          //         // DateInputElement().
                          //       }

                          //       showDialog(
                          //           context: context,
                          //           builder: (context) {
                          //             return DatePickerDialog(
                          //                 keyboardType: TextInputType.datetime,
                          //                 initialDate: DateTime.now(),
                          //                 firstDate: DateTime(2023),
                          //                 lastDate: DateTime(2045));
                          //           });
                          //     },
                          //     child: Text("date")),
                          AddTextfield(
                            icon: const Icon(Icons.date_range),
                            label: 'date',
                            fieldController: medicationDateController,
                            fieldWidth:
                                MediaQuery.of(context).size.width * 0.28,
                            fieldHeight: 55,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ButtonWidget(
                        widget: Text(
                          "Add",
                          style: TextStyle(
                              color: ColorPaltte().white, fontSize: 18),
                        ),
                        onPress: () {
                          // submit add
                        },
                      ),
                      // CalendarDatePicker(
                      //     initialDate: DateTime(1),
                      //     firstDate: DateTime(1),
                      //     lastDate: DateTime(1),
                      //     onDateChanged: (DateTime value) {})
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
