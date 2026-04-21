import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ==================== الشاشة الرئيسية ====================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.home,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'أنت في الشاشة الرئيسية',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // زر للانتقال إلى شاشة التفاصيل
            ElevatedButton(
              onPressed: () {
                // push(): إضافة شاشة جديدة فوق المكدس
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text('الانتقال إلى التفاصيل (push)'),
            ),
            const SizedBox(height: 20),
            // زر لعرض حالة المكدس
            OutlinedButton(
              onPressed: () {
                _showStackDialog(context, ['HomeScreen']);
              },
              child: const Text('عرض حالة المكدس'),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== شاشة التفاصيل ====================
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.info,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 20),
            const Text(
              'أنت في شاشة التفاصيل',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            // زر للرجوع إلى الشاشة السابقة
            ElevatedButton(
              onPressed: () {
                // pop(): إزالة الشاشة العلوية من المكدس
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: Colors.blue.shade700,
              ),
              child: const Text('الرجوع (pop)'),
            ),
            const SizedBox(height: 20),
            // زر لعرض حالة المكدس
            OutlinedButton(
              onPressed: () {
                _showStackDialog(context, ['HomeScreen', 'DetailScreen']);
              },
              child: const Text('عرض حالة المكدس'),
            ),
          ],
        ),
      ),
    );
  }
}


void _showStackDialog(BuildContext context, List<String> screens) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.stacked_bar_chart, color: Colors.blue),
            SizedBox(width: 8),
            Text('حالة المكدس (Stack)'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'المكدس من الأسفل إلى الأعلى:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...screens.asMap().entries.map((entry) {
              final index = entry.key;
              final screen = entry.value;
              final isTop = index == screens.length - 1;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 24,
                      color: isTop ? Colors.green : Colors.grey,
                      margin: const EdgeInsets.only(right: 12),
                    ),
                    Expanded(
                      child: Text(
                        '${index + 1}. $screen ${isTop ? '(أعلى المكدس)' : ''}',
                        style: TextStyle(
                          fontWeight: isTop ? FontWeight.bold : FontWeight.normal,
                          color: isTop ? Colors.green : null,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    ' شرح التغيرات:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    screens.length == 1
                        ? '• المكدس يحتوي على شاشة واحدة فقط\n• push() يضيف شاشة جديدة فوقها'
                        : '• المكدس يحتوي على شاشتين\n• pop() يزيل الشاشة العلوية ويعود للشاشة الأولى',
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('فهمت'),
          ),
        ],
      );
    },
  );
}