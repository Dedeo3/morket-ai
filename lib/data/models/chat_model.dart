class ChatRequest{
  final String messages;

  ChatRequest({required this.messages});

  Map<String, dynamic> toJson()=>{
    'messages': messages
  };
}

// class ChatResponse {
//   final String id;
//   final String object;
//   final int created;
//   final String model;
//   final List<ChatChoice> choices;
//   final Usage usage;

//   ChatResponse({
//     required this.id,
//     required this.object,
//     required this.created,
//     required this.model,
//     required this.choices,
//     required this.usage,
//   });

//   factory ChatResponse.fromJson(Map<String, dynamic> json) {
//     return ChatResponse(
//       id: json['id'],
//       object: json['object'],
//       created: json['created'],
//       model: json['model'],
//       choices: (json['choices'] as List)
//           .map((choice) => ChatChoice.fromJson(choice))
//           .toList(),
//       usage: Usage.fromJson(json['usage']),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'object': object,
//       'created': created,
//       'model': model,
//       'choices': choices.map((choice) => choice.toJson()).toList(),
//       'usage': usage.toJson(),
//     };
//   }
// }

class ChatResponse {
  final String message; // Hanya menyimpan message

  ChatResponse({required this.message});

  factory ChatResponse.fromJson(Map<String, dynamic> json) {
    final content = json['choices'][0]['message']['content'] as String;
    return ChatResponse(message: content);
  }
}

class ChatChoice {
  final String finishReason;
  final int? seed;
  final dynamic logprobs; // Bisa diubah ke tipe spesifik jika diperlukan
  final int index;
  final ChatMessage message;

  ChatChoice({
    required this.finishReason,
    this.seed,
    this.logprobs,
    required this.index,
    required this.message,
  });

  factory ChatChoice.fromJson(Map<String, dynamic> json) {
    return ChatChoice(
      finishReason: json['finish_reason'],
      seed: json['seed'],
      logprobs: json['logprobs'],
      index: json['index'],
      message: ChatMessage.fromJson(json['message']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'finish_reason': finishReason,
      'seed': seed,
      'logprobs': logprobs,
      'index': index,
      'message': message.toJson(),
    };
  }
}

class ChatMessage {
  final String role;
  final String content;
  final List<dynamic> toolCalls; // Bisa diubah ke tipe spesifik jika diperlukan

  ChatMessage({
    required this.role,
    required this.content,
    required this.toolCalls,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      role: json['role'],
      content: json['content'],
      toolCalls: json['tool_calls'] ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'content': content,
      'tool_calls': toolCalls,
    };
  }
}

class Usage {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;
  final int cachedTokens;

  Usage({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
    required this.cachedTokens,
  });

  factory Usage.fromJson(Map<String, dynamic> json) {
    return Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens'],
      cachedTokens: json['cached_tokens'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'prompt_tokens': promptTokens,
      'completion_tokens': completionTokens,
      'total_tokens': totalTokens,
      'cached_tokens': cachedTokens,
    };
  }
}