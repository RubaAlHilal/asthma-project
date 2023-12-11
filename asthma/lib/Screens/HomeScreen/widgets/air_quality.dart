import 'package:asthma/Screens/HomeScreen/home_screen.dart';
import 'package:asthma/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AirQuality extends StatelessWidget {
  const AirQuality({
    super.key,
  });

  getAirQualityStatus(double? airValue) {
    if (airValue! >= 0 && airValue <= 50) {
      return 'good';
    } else if (airValue >= 51 && airValue <= 100) {
      return 'moderate';
    } else if (airValue >= 100 && airValue <= 200) {
      return 'unhealthy';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorPaltte().newBlueTra,
          borderRadius: BorderRadius.circular(10)),
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              '$value%',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ColorPaltte().darkBlue),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              AppLocalizations.of(context)!.quality,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorPaltte().darkBlue),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              getAirQualityStatus(value!).toString(),
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: ColorPaltte().newDarkBlue),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: const Text('Emergency Call'),
                        content: const Text(
                            'Are you sure you want to call emergency?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              Uri tel = Uri.parse('tel:997');
                              await launchUrl(tel);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Call',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.phone_enabled_rounded,
                  color: Colors.red,
                ))
          ],
        ),
      ),
    );
  }
}
