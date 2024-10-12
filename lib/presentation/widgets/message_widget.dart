import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {

  final bool isUser;
  final String response;

  const MessageWidget({
    super.key,
    required this.isUser,
    required this.response,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 16).copyWith(
        left: isUser ? 100 : 0,
        right: isUser ? 0 : 100,
      ),
      decoration: BoxDecoration(
          color: const Color(0xff303030),
          borderRadius: BorderRadius.only(
            topLeft: isUser ? const Radius.circular(20) : const Radius.circular(0),
            topRight: isUser ? const Radius.circular(0) : const Radius.circular(20),
            bottomLeft: const Radius.circular(20),
            bottomRight: const Radius.circular(20),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            response, style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          ),
        ],
      ),
    );
  }
}
