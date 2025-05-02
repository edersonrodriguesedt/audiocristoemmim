import 'package:flutter/material.dart';
import 'reflexoes.dart';
import 'livros.dart';
import 'sobre_autor.dart';
import '../widgets/logo_header.dart'; // <-- import do LogoHeader

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F3F), // azul escuro elegante
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Cristo em Mim',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const LogoHeader(), // <-- aqui aparece o ícone, nome e frase
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildMenuButton(
                    context,
                    icon: Icons.menu_book,
                    label: 'Reflexões Diárias',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ReflexoesPage()),
                    ),
                  ),
                  _buildMenuButton(
                    context,
                    icon: Icons.book,
                    label: 'Livros',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LivrosPage()),
                    ),
                  ),
                  _buildMenuButton(
                    context,
                    icon: Icons.person,
                    label: 'Sobre o Autor',
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SobreAutorPage()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber.shade700,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 4,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
