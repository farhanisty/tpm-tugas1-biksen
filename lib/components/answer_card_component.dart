import 'package:flutter/material.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class AnswerEntity{
  final String question;
  final String answer;

  AnswerEntity({
    required this.question,
    required this.answer
  });
}

class AnswerCardComponent extends StatelessWidget{
  final AnswerEntity answerEntity;

  const AnswerCardComponent({required this.answerEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: AppColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: AppColors.primaryColor,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                answerEntity.question,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor
                )
              ),
              SizedBox(height: 12,),
              Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  minHeight: 76
                ),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.light,
                  border: Border.all(
                    color: AppColors.primaryColor
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  answerEntity.answer,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 13
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }}