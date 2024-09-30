import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class DynamicLinkProvider {


  ////
  void createLink(String refCode) async {
    final String url = " https://com.example.company_app?link=$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
        link: Uri.parse(url), uriPrefix: "");
  }
}
