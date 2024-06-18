import 'package:flutter/material.dart';
import 'package:myapp/models/ai_response.dart';
import 'package:myapp/services/ai_service.dart';

class AIWidget extends StatefulWidget {
  @override
  _AIWidgetState createState() => _AIWidgetState();
}

class _AIWidgetState extends State<AIWidget> {
  final AIService _aiService = AIService();
  String _response = '';
   bool _isLoading = false;

  Future<void> _callAI(String input) async {
    setState(() {
      _isLoading = true;
    });

    try {
      AIResponse aiResponse = await _aiService.callAI(input);
      setState(() {
        _response = aiResponse.output;
      });
    } catch (e) {
      setState(() {
        _response = 'Failed to get response';
      });
    } finally {
       setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Enter your input',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _callAI(_controller.text);
            },
            child: Text('Call AI'),
          ),
          SizedBox(height: 16),
          Expanded(
            child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView( child: Text(_response)),
          ),
        ],
      ),
    );
  }
}