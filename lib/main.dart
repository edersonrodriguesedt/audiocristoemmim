import 'package:flutter/material.dart';
import 'screens/reflexoes.dart';
import 'screens/historico.dart';
import 'screens/livros.dart';
import 'screens/audios.dart'; // Nova aba de Áudios
import 'screens/sobre_autor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CristoEmMimApp());
}

class CristoEmMimApp extends StatelessWidget {
  const CristoEmMimApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cristo em Mim',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF001F3F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber.shade700,
            foregroundColor: Colors.black,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      home: const MainNavigationPage(),
    );
  }
}

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    ReflexoesPage(),
    HistoricoPage(),
    LivrosPage(),
    AudiosPage(),         // Áudio movido antes do Autor
    SobreAutorPage(),
  ];

  final List<String> _titles = const [
    'Reflexão de Hoje',
    'Histórico',
    'Livros',
    'Mensagens',             // Título na mesma ordem
    'Sobre o Autor',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        backgroundColor: const Color(0xFF001F3F),
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white70,
        selectedIconTheme: const IconThemeData(color: Colors.amber),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Hoje',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Livros',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: 'Mensagens', // Áudio movido
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Autor',
          ),
        ],
      ),
    );
  }
}
