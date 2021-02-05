class Question {
  String questionText;
  List options;
  String image;
  int correctOption;

  Question(String questionText, String image, List options, int correctOption) {
    this.questionText = questionText;
    this.image = image;
    this.options = options;
    this.correctOption = correctOption;
  }
}
