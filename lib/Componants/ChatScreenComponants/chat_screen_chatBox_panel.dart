import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class ChatBoxOptionsPanel extends StatelessWidget {
  const ChatBoxOptionsPanel({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.emoji_emotions,
          color: Colors.white,
          size: SizeConfig().heigth(context) * 0.04,
        ),

        Icon(
          Icons.photo_size_select_actual_outlined,
          color: Colors.white,
          size: SizeConfig().heigth(context) * 0.04,
        ),
        Icon(
          Icons.camera_alt_outlined,
          color: Colors.white,
          size: SizeConfig().heigth(context) * 0.04,
        ),
        Icon(
          Icons.attach_file_outlined,
          color: Colors.white,
          size: SizeConfig().heigth(context) * 0.04,
        ),
        Icon(
          Icons.mic_none_rounded,
          color: Colors.white,
          size: SizeConfig().heigth(context) * 0.04,
        ),
      ],
    );
  }
}