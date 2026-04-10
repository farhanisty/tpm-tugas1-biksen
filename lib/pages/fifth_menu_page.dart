import 'package:flutter/material.dart';
import 'package:tpm_tugas1/components/primary_button_component.dart';
import 'package:tpm_tugas1/layouts/menu_layout.dart';
import 'package:tpm_tugas1/services/stopwatch_service.dart';
import 'package:tpm_tugas1/theme/app_colors.dart';

class FifthMenuPage extends StatefulWidget{
  const FifthMenuPage({super.key});

  @override
  State<FifthMenuPage> createState() => _FifthMenuPageState();
}

class _FifthMenuPageState extends State<FifthMenuPage> {
  StopwatchService stopwatchService = StopwatchService();
  Duration time = Duration.zero;

  @override
  void initState() {
    super.initState();

    stopwatchService.onTick = (duration) {
      setState(() {
        time = duration;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    return MenuLayout(
      title: "Menu Ke-5", 
      content: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.light,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 1
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                stopwatchService.formatTime(time),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 30,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w600
                )
              ),
            ),
            SizedBox(height: 16,),
            Row(
              spacing: 28,
              children: [
                Expanded(child: PrimaryButtonComponent(
                  text: stopwatchService.state == StopwatchState.running ? "Stop" : "Start",
                  onPressed: () {
                    if (stopwatchService.state == StopwatchState.running) {
                      stopwatchService.stop();
                    } else {
                      if (stopwatchService.elapsed == Duration.zero) {
                        stopwatchService.setInitialTime(
                          Duration(minutes: 0, seconds: 0),
                        );
                      }

                      stopwatchService.start();
                    }
                    
                  },
                  )
                ),
                Expanded(
                  child: PrimaryButtonComponent(
                    text: "Reset", 
                    
                    onPressed: () {
                      if(stopwatchService.state == StopwatchState.stopped) {
                        stopwatchService.reset();
                      }
                    },
                    backgroundColor: stopwatchService.state == StopwatchState.stopped ? AppColors.light : Colors.blueGrey,
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}