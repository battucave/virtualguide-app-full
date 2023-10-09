import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:virtualguide/controller/user_service/dio_interceptors/dio_interceptors.dart';
import 'package:virtualguide/model/history/history.dart';

class UserService {
  // Chat
  static Future<String> chatWithGPT(
      {required BuildContext context, required List message}) async {
    DioInterceptors.userServiceInterceptors(context);
    Map<String, dynamic> body = {
      "model": "gpt-3.5-turbo",
      "messages": message,
      "max_tokens": 1000,
    };
    final response = await dio
        .post("https://api.openai.com/v1/chat/completions", data: body, cancelToken: cancelToken);
    String reply = response.data['choices'][0]['message']['content'].toString();
    return reply;
  }

  // Generation
  static Future<String> generationWithGPT(
      {required BuildContext context,
        required String message,
        required String model,
        required String prompt,
        required int maxTokens}) async {
    DioInterceptors.userServiceInterceptors(context);

    String updatedPrompt = prompt.replaceAll("[Your Topic]", message);

    Map<String, dynamic> body = {
      "model": model,
      "prompt":
      updatedPrompt,
      "max_tokens": maxTokens,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0,
      "temperature": 0.3,
    };
    final response =
    await dio.post("https://api.openai.com/v1/completions", data: body, cancelToken: cancelToken);
    String reply = response.data['choices'][0]['text'].toString();
    return reply;
  }

  // Explain Code
  // Generation
  static Future<String> explainCodeWithGPT(
      {required BuildContext context,
        required String message,
        required String model,
        required String prompt,
        required int maxTokens}) async {
    DioInterceptors.userServiceInterceptors(context);

    String updatedPrompt = prompt.replaceAll("[Your Topic]", message);

    Map<String, dynamic> body = {
      "model": model,
      "prompt":
      updatedPrompt,
      "max_tokens": maxTokens,
      "top_p": 1.0,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0,
      "temperature": 0,
      "stop": ["\"\"\""]
    };
    final response =
    await dio.post("https://api.openai.com/v1/completions", data: body, cancelToken: cancelToken);
    String reply = response.data['choices'][0]['text'].toString();
    return reply;
  }

  // NOTE : Please Replace Your Domain With "example"
  // Insert Data
  static Future<dynamic> insertHistory(HistoryModel history) async {
    return await dio.post(
      "https://example.com/api/history.php",
      data: {
        'title': history.title,
        'messages': history.messages,
        'gptMessages': history.gptMessages,
        'category': history.category,
        'createdAt': history.createdAt,
        'aiAssistantData': history.aiAssistantData,
        'uid': FirebaseAuth.instance.currentUser!.uid.toString(),
      },
    );
  }

  // Fetch Data
  static Future<List<dynamic>> getHistory() async {
    final res = await dio.get('https://example.com/api/history.php?id=${FirebaseAuth.instance.currentUser!.uid.toString()}');
    List<dynamic> maps = res.data;
    return maps;
  }

  // Update Data
  static Future<dynamic> updateHistory(HistoryModel history,int id) async {
    return await dio.patch(
      "https://example.com/api/history.php?id=$id",
      data: {
        'title': history.title,
        'messages': history.messages,
        'gptMessages': history.gptMessages,
        'category': history.category,
        'createdAt': history.createdAt,
        'aiAssistantData': history.aiAssistantData,
        'uid': FirebaseAuth.instance.currentUser!.uid.toString(),
      },
    );
  }

  // DELETE Data
  static Future<dynamic> deleteHistory(int id,String title) async {
    return await dio.delete(
      "https://example.com/api/history.php?id=$id",
    );
  }
}
