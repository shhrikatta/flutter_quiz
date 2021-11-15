import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:globant_quiz/src/domain/quiz/controller/question_controller.dart';
import 'package:globant_quiz/src/domain/quiz/view/quiz_screen.dart';
import 'package:globant_quiz/src/helpers/constants.dart';

class ScoreScreen extends GetView<QuestionController> {
  const ScoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Score",
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(color: kSecondaryColor),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Text(
                "${_qnController.correctAns}/${_qnController.questions.length}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kSecondaryColor),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            buildLoginButtonField(context),
          ],
        ),
      ),
    );
  }

  buildLoginButtonField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: InkWell(
        onTap: () => Get.off(const QuizScreen()),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
          decoration: const BoxDecoration(
            gradient: kPrimaryGradient,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            "Retake Quiz".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}