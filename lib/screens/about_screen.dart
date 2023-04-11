import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lospollos/icons/harika_icons.dart';

import '../model/url_model.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Bu uygulama Servet Eren DEĞER tarafından mobil programlama vize ödevi için hazırlanmıştır.\n\n\nFOR ENTERTAINMENT AND STUDY PURPOSES ONLY\n© 2023 AMC Network Entertainment LLC. All Rights Reserved.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.facebook, size: 40),
                onPressed: () => openUrl("https://www.facebook.com/amc/"),
              ),
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.instagram, size: 40),
                onPressed: () =>
                    openUrl('https://www.instagram.com/eatlospolloshermanos/'),
              ),
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.github, size: 40),
                onPressed: () => openUrl('https://github.com/regedner'),
              ),
            ),
            const SizedBox(width: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: IconButton(
                icon: const Icon(
                  Harika.selcuk,
                  size: 40,
                ),
                onPressed: () => openUrl(
                    'https://tf.selcuk.edu.tr/index.php?lang=tr&birim=033001&page=main'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
