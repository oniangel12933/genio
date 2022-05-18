import 'package:flutter/material.dart';
import 'package:genio/utils/colors.dart';
import 'package:genio/utils/fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final PageController pageController = PageController();
  List<Map<String, dynamic>> dataList = [
    {
      'icon': 'assets/global.png',
      'title': 'Pay, Receive and Save on transfers worldwide',
      'desc': '',
      'txtColor': Colors.black,
    },
    {
      'icon': 'assets/check_rate.png',
      'title': 'Buy and Sell in 70+ currencies',
      'desc': 'Check our rates',
      'txtColor': Colors.red,
    },
    {
      'icon': 'assets/cards.png',
      'title': 'Get prepaid & Virtual Multi-Currency Cards',
      'desc': 'Get cards to use for your ATM, POS and online transactions.',
      'txtColor': Colors.black,
    },
    {
      'icon': 'assets/wallets.png',
      'title': 'Hybrid Wallet-Fiat and Crypto Wallets',
      'desc': 'Send, receive and convert in over 70 currencies.',
      'txtColor': Colors.black,
    },
    {
      'icon': 'assets/customers.png',
      'title': 'Connect your customers to your business',
      'desc':
          'Take control of your finances as a business by leveraging on payment tools to send and receive payments from clients.',
      'txtColor': Colors.black,
    },
    {
      'icon': 'assets/graph.png',
      'title': 'Track and Offset your CO2 emissions',
      'desc': 'Change the Climate Change with one simple click.',
      'txtColor': Colors.black,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      decoration: const BoxDecoration(
        gradient: AppColors.mainGradient,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (i) {},
              children: <Widget>[
                for (Map<String, dynamic> data in dataList)
                  item(
                    data['icon'],
                    data['title'],
                    data['desc'],
                    descColor: data['txtColor'],
                  ),
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: dataList.length,
            effect: const WormEffect(
                dotColor: AppColors.blue,
                activeDotColor: AppColors.orange,
                dotHeight: 7,
                dotWidth: 20),
            onDotClicked: (index) {
              pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeIn,
              );
            },
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 120,
                  height: 40,
                  child: Center(
                    child: Text(
                      'LOG IN',
                      style:
                          AppFonts.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.orange,
                  ),
                  child: Center(
                    child: Text(
                      'SIGN UP',
                      style:
                          AppFonts.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget item(
    String icon,
    String title,
    String description, {
    Color descColor = Colors.black,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(icon),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.header,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppFonts.body.copyWith(color: descColor),
            maxLines: null,
          ),
        ],
      );
}
