import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:genio/utils/colors.dart';
import 'package:genio/utils/fonts.dart';
import 'package:genio/views/start.dart';
import 'package:genio/views/terms.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isCheckTerms = false, isCheckPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            gradient: AppColors.mainGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Welcome!',
                style: AppFonts.header,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Here\'s a few things to be aware of.',
                style: AppFonts.body,
              ),
              const SizedBox(
                height: 30,
              ),
              item('assets/welcome_beta.svg', 'We\'re in Beta',
                  'You\'re one of the first people to use our app. We\'re still working on a few things.'),
              const SizedBox(
                height: 30,
              ),
              item('assets/welcome_card.svg', 'Get your card today',
                  'Start planting trees with the GenioPay account, all you have to do is spend.'),
              const SizedBox(
                height: 30,
              ),
              item('assets/welcome_pass.svg', 'Dont\'t forget your ID',
                  'You will need your passport or driving license to prove whpu you are.'),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.error,
                      color: AppColors.deepBlue,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        'We only ask for essential information and we do not perform credit checks',
                        style: AppFonts.bodySmall
                            .copyWith(color: AppColors.deepBlue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 40,
                child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                    title: RichText(
                      overflow: TextOverflow.clip,
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: 'I have read and agree to the ',
                            style: AppFonts.bodySmall,
                          ),
                          TextSpan(
                              text: 'Terms of Service',
                              style: AppFonts.bodySmall.copyWith(
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const TermsPage(
                                          title: 'Terms and Service'),
                                    ),
                                  );
                                }),
                        ],
                      ),
                    ),
                    value: isCheckTerms,
                    onChanged: (status) {
                      setState(() {
                        isCheckTerms = status!;
                      });
                    }),
              ),
              CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  title: RichText(
                    overflow: TextOverflow.clip,
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'I have read and agree to the ',
                          style: AppFonts.bodySmall,
                        ),
                        TextSpan(
                            text: 'Privacy Policy',
                            style: AppFonts.bodySmall
                                .copyWith(decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const TermsPage(
                                        title: 'Privacy Policy'),
                                  ),
                                );
                              }),
                      ],
                    ),
                  ),
                  value: isCheckPolicy,
                  onChanged: (status) {
                    setState(() {
                      isCheckPolicy = status!;
                    });
                  }),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const StartPage(),
                    ),
                  );
                },
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.blue,
                  ),
                  child: Center(
                    child: Text(
                      'GOT IT!',
                      style:
                          AppFonts.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget item(String icon, String title, String description) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 60,
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.header.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  description,
                  style: AppFonts.body,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      );
}
