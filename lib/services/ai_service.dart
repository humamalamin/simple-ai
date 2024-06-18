import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:myapp/models/ai_response.dart';

class AIService {
  final model = GenerativeModel(
    model: 'gemini-pro',
    apiKey: "XXX",
    generationConfig: GenerationConfig(maxOutputTokens: 100),
  );

  Future<AIResponse> callAI(String input) async {
    final content = [Content.text(input)];
    final response = await model.generateContent(content);
    return AIResponse(output: response.text!);
  }
}