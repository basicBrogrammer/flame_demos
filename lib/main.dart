import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame_square/game/game.dart';
import 'package:flame_square/widgets/button_component.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  // final myGame = PauseResumeGame();
  final game = MyGame();
  // runApp(GameWidget(game: myGame));
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const ['AudioButtons'],
    overlayBuilderMap: {
      "AudioButtons": (BuildContext ctx, MyGame game) {
        return SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              spriteButtonBuilder(
                "Short Audio",
                () {
                  FlameAudio.play("buzz_3.wav");
                  print('Short Audio Pressed');
                },
              ),
              spriteButtonBuilder(
                "Short Audio Loop",
                () async {
                  print('Short Audio Loop Pressed');
                  AudioPlayer shortLoopPlayer =
                      await FlameAudio.loop('engine-looping_1.wav');
                  var i = 0;
                  while (i < 8000) {
                    print("Playing");
                    i++;
                  }
                  await shortLoopPlayer.stop();
                },
              ),
              //  `playLongAudio/loopLongAudio` allows for audios of any length
              //  to be played, but they do create frame rate drop, and the
              //  looped audio will have a small gap between iterations.
              spriteButtonBuilder(
                "Long Audio",
                () {
                  print('Long Audio Pressed');
                  FlameAudio.playLongAudio("buzz_3.wav");
                },
              ),
              spriteButtonBuilder(
                "Long Audio Loop",
                () async {
                  print('Long Audio Loop Pressed');
                  AudioPlayer longLoopPlayer =
                      await FlameAudio.loopLongAudio('engine-looping_1.wav');
                  var i = 0;
                  while (i < 8000) {
                    print("Playing");
                    i++;
                  }
                  await longLoopPlayer.stop();
                },
              ),
            ],
          ),
        );
      }
    },
  ));
}
