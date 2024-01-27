const String imagePath = "assets/images/";
const String flags = "assets/images/flags/";

class ImagesManager {
  static const String splashScreenIcon = "${imagePath}cooker_splash_screen.svg";
  static const String onboardingIcon1 = "${imagePath}onboarding1.svg";
  static const String onboardingIcon2 = "${imagePath}onboarding2.svg";
  static const String onboardingIcon3 = "${imagePath}onboarding3.svg";
  static const String noInternetConnection = "${imagePath}noInternet.png";
  static String flag(String country) {
    switch (country) {
      case "american":
        return "${flags}american.png";
      case "british":
        return "${flags}british.png";
      case "canadian":
        return "${flags}canadian.png";
      case "chinese":
        return "${flags}chinese.png";
      case "croatian":
        return "${flags}croatian.png";
      case "dutch":
        return "${flags}dutch.png";
      case "egyptian":
        return "${flags}egyption.png";
      case "filipino":
        return "${flags}filipino.png";
      case "french":
        return "${flags}french.png";
      case "greek":
        return "${flags}greek.png";
      case "indian":
        return "${flags}indian.png";
      case "irish":
        return "${flags}irish.png";
      case "italian":
        return "${flags}italian.png";
      case "jamaican":
        return "${flags}jamaican.png";
      case "japanese":
        return "${flags}japanese.png";
      case "kenyan":
        return "${flags}kenyan.png";
      case "malaysian":
        return "${flags}malaysian.png";
      case "mexican":
        return "${flags}mexican.png";
      case "moroccan":
        return "${flags}moroccan.png";
      case "polish":
        return "${flags}polish.png";
      case "portuguese":
        return "${flags}portuguese.png";
      case "russian":
        return "${flags}russian.png";
      case "spanish":
        return "${flags}spainish.png";
      case "thai":
        return "${flags}thai.png";
      case "tunisian":
        return "${flags}tunisian.png";
      case "turkish":
        return "${flags}turkish.png";
      case "vietnamese":
        return "${flags}vietnamese.png";

      default:
        return "${flags}american.png";
    }
  }
}
