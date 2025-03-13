import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:smartspend/utils/constants/colors.dart';
import 'package:smartspend/utils/helpers/helper_functions.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final ChatUser currentUser = ChatUser(id: '1', firstName: 'user');
  final ChatUser aiUser = ChatUser(id: '2', firstName: 'BAI');
  List<ChatMessage> messages = <ChatMessage>[];
  //List<ChatUser> typingUsers = <ChatUser>[];
  @override
  Widget build(BuildContext context) {
    final dark = SHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BAI - Budget AI'),
        iconTheme: IconThemeData(color: dark ? SColors.white : SColors.black),
      ),
      body: DashChat(
          currentUser: currentUser,
          //typingUsers: typingUsers,
          messageOptions: MessageOptions(
            currentUserContainerColor: SColors.secondary,
            containerColor: SColors.primary,
            textColor: dark ? SColors.black : SColors.white,
            showTime: true,
          ),
          inputOptions: const InputOptions(
            alwaysShowSend: true,
          ),
          onSend: (ChatMessage m) {
            getResponse(m);
          },
          messages: messages),
    );
  }

  Future<void> getResponse(ChatMessage m) async {
    setState(() {
      messages.insert(0, m);
      //typingUsers.add(aiUser);
    });
  }
}
