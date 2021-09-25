import 'package:basic_state_flutter/theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 32,
          right: 32,
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/payment.png',
                width: 267,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upgrade to ',
                  style: mainTitleTextStyle,
                ),
                Text(
                  'Pro',
                  style: mainTitleTextStyle.copyWith(
                    color: const Color(0xff007dff),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Go unlock all features and\nbuild your own business bigger',
              style: subTitleTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget option(int index, String title, String subtitle, String pricing) {
      return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedIndex == index
                ? const Color(0xff007dff)
                : const Color(0xff4d5b7c),
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor: const Color(0xff4d5b7c),
                      ),
                      child: Transform.scale(
                        scale: 1.2,
                        child: Radio(
                          value: index,
                          groupValue: selectedIndex,
                          activeColor: const Color(0xff007dff),
                          onChanged: (int? value) {
                            setState(() {
                              selectedIndex = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: titleTextStyle,
                        ),
                        Text(
                          subtitle,
                          style: descTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  pricing,
                  style: priceTextStyle,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget checkoutBtn() {
      return Column(
        children: [
          SizedBox(
            width: 312,
            height: 52,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xff007dff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Checkout Now',
                style: buttonTextStyle,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: const Color(0xff04112f),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  header(),
                  const SizedBox(
                    height: 50,
                  ),
                  option(0, 'Monthly', 'Good for starting up', '\$20'),
                  option(1, 'Quarterly', 'Focusing on building', '\$55'),
                  option(2, 'Yearly', 'Steady company', '\$220'),
                  const SizedBox(
                    height: 50,
                  ),
                  selectedIndex == -1 ? const SizedBox() : checkoutBtn(),
                ],
              ),
            ),
          )),
    );
  }
}
