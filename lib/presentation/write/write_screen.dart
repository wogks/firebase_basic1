import 'package:firebase_why1/presentation/write/write_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class WriteScreen extends StatefulWidget {
  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  final inputTextController = inputTextController;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WriteViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('글쓰기'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              suffixIcon: IconButton(icon: const Icon(Icons.send), onPressed: () {
                viewModel.write(text);
              },),
              hintText: '글을 쓰세요',
            ),
          )
        ],
      ),
    );
  }
}