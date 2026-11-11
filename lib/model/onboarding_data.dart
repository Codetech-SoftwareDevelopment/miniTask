class OnboardingData {
  final String image;
  final String title;

  OnboardingData({required this.image, required this.title});
}

List<OnboardingData> onboardingData = [
  OnboardingData(
    image: "assets/onboarding-1.png",
    title: "Discover the world\n with us",
  ),
  OnboardingData(
    image: "assets/onboarding-2.png",
    title: "To the most famous\n places of the world",
  ),
  OnboardingData(
    image: "assets/onboarding-3.png",
    title: "With cheap and\n affordable prices",
  ),
];
