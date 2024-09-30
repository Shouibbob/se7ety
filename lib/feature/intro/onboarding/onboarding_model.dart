class OnboardingModel {
  final String image;
  final String title;
  final String body;

  OnboardingModel(
      {required this.image, required this.title, required this.body});
}

List<OnboardingModel> pages = [
  OnboardingModel(
    image: 'assets/images/on1.svg',
    title: 'ابحث عن دكتور متخصص',
    body: 'اكتشف مجموعة واسعة من الاطباء الخبراء و المتخصصين في مختلف المجالات',
  ),
  OnboardingModel(
    image: 'assets/images/on2.svg',
    title: 'سهولة الحجز',
    body: 'احجز المواعيد بضغطة زرار في أي وقت و في أي مكان',
  ),
  OnboardingModel(
    image: 'assets/images/on3.svg',
    title: 'أمن وسري',
    body: 'كن مطمئنا لأن خصوصيتك وأمانك هما أهم أولوياتنا',
  ),
];
