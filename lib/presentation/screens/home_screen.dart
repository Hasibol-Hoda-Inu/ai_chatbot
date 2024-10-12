import 'package:ai_chatbot/api/service.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../../api/model_class.dart';
import '../widgets/message_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Message> _message = [];
  TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: _message.length,
                      itemBuilder: (BuildContext context, index){
                        final message = _message[index];
                        return MessageWidget(isUser: message.isUser, response: message.response);
                      })),
              Row(
                children: [
                  Expanded(child:
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Enter a prompt";
                        }
                      },
                    ),
                  )),
                  const SizedBox(width: 10,),
                  IconButton.filled(
                      onPressed: (){
                        _talkWithGemini();
                        FocusScope.of(context).unfocus();
                        onTapClearForm();
                        setState(() {});
                      },
                    iconSize: 26,
                    padding: const EdgeInsets.all(12),
                    style: IconButton.styleFrom(),
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      ),
                  )
                ],
              ),
              const SizedBox(height: 8,)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _talkWithGemini()async {

    final userInput = _textEditingController.text;
    setState(() {
      _message.add(Message(isUser: true, response: userInput));
    });

    final model = GenerativeModel(
      model: 'gemini-1.5-flash-latest',
      apiKey: ApiService.apiKey,
    );

    final prompt = _textEditingController.text;
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);

    setState(() {
      _message.add(Message(isUser: false, response: response.text ?? ""));
    });

    print(response.text);
  }

  void onTapClearForm(){
    _textEditingController.clear();
  }

  @override
  void dispose(){
    super.dispose();
    _textEditingController.dispose();
  }
}
