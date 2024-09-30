import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:share_plus/share_plus.dart';

class DynamicLinkProvider {
  // Create a dynamic link with a referral code
  Future<String> createLink(String refCode) async {
    final String url = "https://com.example.company_app?ref=$refCode";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      androidParameters: AndroidParameters(
        packageName: "com.example.company_app",
        minimumVersion: 0,
      ),
      link: Uri.parse(url),
      uriPrefix: "https://assignment20.page.link",
    );

    final FirebaseDynamicLinks link = FirebaseDynamicLinks.instance;
    final refLink = await link.buildShortLink(parameters);
    return refLink.shortUrl.toString();
  }

  void initDynamicLink() async {
    final instanceLink = await FirebaseDynamicLinks.instance.getInitialLink();

    if (instanceLink != null) {
      final Uri refLink = instanceLink.link;
      Share.share("This is the referral code: ${refLink.queryParameters["ref"]}");
    }
  }

  void generateReferralLink(String refCode) async {
    String dynamicLink = await createLink(refCode);
    print("Generated dynamic link: $dynamicLink");
    Share.share("Here is your referral link: $dynamicLink");
  }
}
