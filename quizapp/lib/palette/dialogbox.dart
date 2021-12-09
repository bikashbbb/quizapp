import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

dialogBox(BuildContext context, yes) {
  return showDialog(
    context: context,
    builder: (contex) => AlertDialog(
        title: const Text('Replay the Quiz?'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  yes();
                },
                child: const Text('YES')),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('NO')),
          ],
        )),
  );
}

chooseAanswer(BuildContext context) {
  return showDialog(
    context: context,
    builder: (contex) => const AlertDialog(
      title: Text('Please choose a answer'),
    ),
  );
}
