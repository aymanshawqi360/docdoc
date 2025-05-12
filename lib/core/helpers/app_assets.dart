class AppAssets {
  AppAssets._();
  static final AppAssets _instance = AppAssets._();
  factory AppAssets() => _instance;

  String onboardingDoctor = "assets/images/onboarding_doctor.png";
  String homeBluePattern = "assets/images/home_blue_pattern.png";
  String generalPractitioner = "assets/images/generalPractitioner.png";
  String neurologic = "assets/images/neurologic.png";
  String pediatric = "assets/images/pediatric.png";
  String radiology = "assets/images/radiology.png";
  String imageYou = "assets/images/image_you.png";

  String googleLogoSvg = "assets/svg/google_logo.svg";
  String onboardingDocdocLogoSvg = "assets/svg/docdoc-logo.svg";
  String onboardingDocdocLogoLowTransparencySvg =
      "assets/svg/docdoc_logo_low_transparency.svg";
  String notificationsSvg = "assets/svg/notifications.svg";
  String generalPractitionerSvg = "assets/svg/general_practitioner.svg";
}
