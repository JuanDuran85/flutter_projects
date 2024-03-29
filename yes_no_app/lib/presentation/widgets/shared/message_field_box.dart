import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(40),
    );

    final focusNode = FocusNode();
    final textController = TextEditingController();

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "??"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(
          Icons.send_outlined,
        ),
        onPressed: () {
          final textValue = textController.value.text;
          print('---------------------------Text value $textValue');
          textController.clear();
        },
      ),
    );

    return TextFormField(
      onTapOutside: (_) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('--------------------------Submit value: $value');
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
