import 'package:flutter/material.dart';
import 'mensagens.dart';
import '../widgets/logo_header.dart';

class ReflexoesPage extends StatelessWidget {
  const ReflexoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hoje = DateTime.now();
    final hojeSemHora = DateTime(hoje.year, hoje.month, hoje.day);

    final mensagensFiltradas = mensagens.where((msg) {
      try {
        final partesData = msg['data']!.split(' de ');
        final dia = int.parse(partesData[0]);
        final mes = _mesPorExtensoParaNumero(partesData[1]);
        final ano = int.parse(partesData[2]);
        final dataMsg = DateTime(ano, mes, dia);
        return dataMsg.year == hojeSemHora.year &&
               dataMsg.month == hojeSemHora.month &&
               dataMsg.day == hojeSemHora.day;
      } catch (_) {
        return false;
      }
    }).toList();

    return ListView.builder(
      itemCount: mensagensFiltradas.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 12),
            child: LogoHeader(),
          );
        }

        final data = mensagensFiltradas[index - 1];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          elevation: 3,
          color: const Color(0xFF1B263B),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['texto']!,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  data['referencia']!,
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  data['reflexoes']!,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white60,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    data['data']!,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int _mesPorExtensoParaNumero(String mes) {
    switch (mes.toLowerCase()) {
      case 'janeiro':
      case 'january':
        return 1;
      case 'fevereiro':
      case 'february':
        return 2;
      case 'março':
      case 'marco':
      case 'march':
        return 3;
      case 'abril':
      case 'april':
        return 4;
      case 'maio':
      case 'may':
        return 5;
      case 'junho':
      case 'june':
        return 6;
      case 'julho':
      case 'july':
        return 7;
      case 'agosto':
      case 'august':
        return 8;
      case 'setembro':
      case 'september':
        return 9;
      case 'outubro':
      case 'october':
        return 10;
      case 'novembro':
      case 'november':
        return 11;
      case 'dezembro':
      case 'december':
        return 12;
      default:
        return 1;
    }
  }
}
