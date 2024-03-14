import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';



class TimerBar extends StatelessWidget {
  const TimerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const kPrimaryGradient = LinearGradient(
      colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 3),
          borderRadius: BorderRadius.circular(50)),
      // child: GetBuilder<QuestionController>(
      //   init: QuestionController(),
      //   builder: (controller) {
      //     return
      // ),
      child: Stack(
        children: [
          LayoutBuilder(
              builder: ((context, constraints) => Container(
                    width: constraints.maxWidth * 0.5,
                    decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.circular(50)),
                  ))),
          Positioned.fill(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("30 sec"),
                Icon(
                  Icons.timer,
                  color: Colors.white,
                )
              ],
            ),
          ))
        ],
        
      ),
    );
  }
}
