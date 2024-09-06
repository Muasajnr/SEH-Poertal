import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';  // Make sure this is imported

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEH STAFF PORTAL',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),  // Muted blue color
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1E88E5),  // Set AppBar background color to blue
          foregroundColor: Colors.white,  // Make title white
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'SEH STAFF PORTAL'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final WebViewController _controller;  // Declare the controller

  @override
  void initState() {
    super.initState();
    // Initialize the controller when the widget is first created
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://staff.sabatiaeyehospital.org'));  // Load the SEH Staff Portal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,  // Center the title
      ),
      body: WebViewWidget(controller: _controller),  // Use WebViewWidget for the new API
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Reload the page when the button is pressed
          _controller.reload();
        },
        tooltip: 'Reload',
        backgroundColor: const Color(0xFF1E88E5),  // Use the same muted blue color
        child: const Icon(Icons.refresh, color: Colors.white),  // White refresh icon
      ),
    );
  }
}
