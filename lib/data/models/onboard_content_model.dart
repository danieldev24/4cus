class OnBoarding {
  final String title;
  final String content;
  final String image;

  OnBoarding({
    required this.title,
    required this.content,
    required this.image,
  });
}

List<OnBoarding> contents = [
  OnBoarding(
    title: 'Welcome to\n Monumental habits',
    content: "Outreach to many social networks to improve your statistics",
    image: 'assets/images/onboarding_image_1.png',
  ),
  OnBoarding(
    title: 'Create new habits easily',
    content: "We will give best solution for your business isues",
    image: 'assets/images/onboarding_image_2.png',
  ),
  OnBoarding(
    title: 'Keep track of your progress',
    content: "With our help, it will be easier to achieve your goals",
    image: 'assets/images/onboarding_image_3.png',
  ),
  OnBoarding(
    title: 'Join a supportive community',
    content: "",
    image: 'assets/images/onboarding_image_4.png',
  ),
];