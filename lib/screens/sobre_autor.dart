import 'package:flutter/material.dart';

class SobreAutorPage extends StatelessWidget {
  const SobreAutorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          // FOTO DO AUTOR
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/autor/foto.png'),
          ),
          SizedBox(height: 16),

          // NOME
          Text(
            'Ederson Rodrigues',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          SizedBox(height: 16),

          // BIOGRAFIA
          Text(
            'Ederson Rodrigues é escritor, empresário e pregador da Palavra de Deus. '
            'Autor dos livros "Caminhando na Fé", compartilha mensagens diárias '
            'inspiradas nas Sagradas Escrituras, levando fé e esperança a milhares de pessoas.\n\n'
            'Fundador do projeto "Cristo em Mim", tem impactado vidas através das redes sociais, '
            'especialmente no TikTok, onde alcança dezenas de milhares de pessoas todos os dias. '
            'Com base bíblica sólida, suas reflexões ajudam os leitores a enfrentarem a vida com coragem e fé.\n\n'
            'Siga nas redes sociais:\n'
            '• TikTok: @er_cristoemmim\n'
            '• Instagram: @edersonsiqueirarodrigues\n'
            '• Site: www.edersonrodrigues.com.br\n\n'
            'Onde a Fé encontra seu Propósito.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
              height: 1.6,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(height: 24),

          // CRÉDITO AO DESENVOLVEDOR
          Text(
            'Desenvolvido por: ER Tecnologia da Informação',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white60,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
