import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LivrosPage extends StatelessWidget {
  const LivrosPage({super.key});

  void _abrirLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);  // Abre a URL no navegador
    } else {
      debugPrint('❌ Não foi possível abrir o link: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final livros = [
      {
        'titulo': 'Caminhando na Fé: A Fé que Move Montanhas',
        'imagem': 'assets/livros/capa_fe_move_montanhas.png',
        'url': 'https://play.google.com/store/books/details?id=3NdZEQAAQBAJ',
        'gratuito': true,
      },
      {
        'titulo': 'Caminhando na Fé: O Segredo da Prosperidade Financeira',
        'imagem': 'assets/livros/capa_segredo_prosperidade.png',
        'url': 'https://play.google.com/store/books/details?id=s-tQEQAAQBAJ',
        'gratuito': false,
      },
      {
        'titulo': 'Caminhando na Fé: Uma Jornada Espiritual',
        'imagem': 'assets/livros/capa_jornada_espiritual.png',
        'url': 'https://play.google.com/store/books/details?id=9TYYEQAAQBAJ',
        'gratuito': false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Livros',
          style: TextStyle(color: Colors.amber),
        ),
        backgroundColor: const Color(0xFF001F3F),
      ),
      body: ListView.builder(
        itemCount: livros.length,
        itemBuilder: (context, index) {
          final livro = livros[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image.asset(
                    livro['imagem'] as String,
                    width: 80,
                    height: 110,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          livro['titulo'] as String,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () => _abrirLink(livro['url'] as String),
                          child: Text(livro['gratuito'] == true ? 'Gratuito' : 'Comprar agora'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
