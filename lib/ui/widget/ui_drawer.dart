
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rick_and_morty_wiki_apirest_flutter/app_exporter.dart';
import 'package:url_launcher/url_launcher.dart';

class UIDrawer extends StatelessWidget {
  const UIDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double iconsSize = size.width / 13;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(0, 85, 93, 251),
         
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(color: Colors.white),
             
              _buildListTile(
                context: context,
                size: size,
                title: "GitHub.",
                leading: Icon(
                  FontAwesomeIcons.github,
                  size: iconsSize,
                ),
                tapHandler: () =>
                    _openURL("https://github.com/yeisonsanz", context),
              ),
              _buildListTile(
                context: context,
                size: size,
                title: "LinkeIn.",
                leading: Icon(
                  FontAwesomeIcons.linkedin,
                  size: iconsSize,
                ),
                tapHandler: () => _openURL(
                    "https://www.linkedin.com/in/yeison-estiven-sanz-castro-ab53b9142/", context),
              ),
              
              _buildListTile(
                context: context,
                size: size,
                title: "Gmail.",
                leading: Icon(
                  FontAwesomeIcons.google,
                  size: iconsSize,
                ),
                tapHandler: () =>
                    _openURL("mailto:yeisonkb@gmail.com", context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _openURL(String url, BuildContext context) async {
    if (!await launch(url)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: WidgetUtils.buildInfoText(
            text:
                "Error tratando de abrir la URL $url, es probable que el dispositivo no soporte la opci??n de abrir URls externas.",
            context: context,
            size: MediaQuery.of(context).size,
            color: Colors.black,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
  }

  _buildListTile({
    required String title,
    required Widget leading,
    required Function tapHandler,
    required Size size,
    required BuildContext context,
  }) {
    return ListTile(
      leading: leading,
      minLeadingWidth: size.width / 15,
      title: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
          fontSize: size.width / 15,
        ),
      ),
      onTap: () => tapHandler(),
    );
  }
}
