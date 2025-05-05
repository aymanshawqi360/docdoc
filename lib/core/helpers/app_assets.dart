class AppAssets {
  AppAssets._();
  static final AppAssets _instance = AppAssets._();
  factory AppAssets() => _instance;
  String onboardingDocdocLogoSvg = "assets/svg/docdoc-logo.svg";
  String onboardingDocdocLogoLowTransparency =
      "assets/svg/docdoc_logo_low_transparency.svg";

  String onboardingDoctor = "assets/images/onboarding_doctor.png";
  String googleLogo = "assets/svg/google_logo.svg";
}
