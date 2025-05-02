import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class AudiosPage extends StatefulWidget {
  const AudiosPage({super.key});

  @override
  State<AudiosPage> createState() => _AudiosPageState();
}

class _AudiosPageState extends State<AudiosPage> {
  List<_AudioItem> _audios = [];

  @override
  void initState() {
    super.initState();
    _fetchAudios();
  }

  Future<void> _fetchAudios() async {
    const url = 'https://raw.githubusercontent.com/edersonrodriguesedt/audiocristoemmim/main/audios_v1.json';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        setState(() {
          _audios = jsonList
              .map((item) => _AudioItem(nome: item['titulo'], url: item['url']))
              .toList();
        });
      } else {
        print('Erro ao carregar JSON: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro de rede: $e');
    }
  }

  Future<void> _abrirYoutube(String url) async {
    final uri = Uri.parse(url);

    try {
      if (await launchUrl(uri, mode: LaunchMode.externalApplication)) return;
      if (await launchUrl(uri, mode: LaunchMode.platformDefault)) return;
      if (await launchUrl(uri, mode: LaunchMode.inAppBrowserView)) return;
      print('❌ Nenhum modo conseguiu abrir: $url');
    } catch (e) {
      print('Erro ao tentar abrir URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF001F3F),
      body: _audios.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _audios.length,
              itemBuilder: (context, index) {
                final audio = _audios[index];
                return ListTile(
                  leading: IconButton(
                    icon: const Icon(Icons.play_circle_fill, size: 36, color: Colors.green),
                    onPressed: () => _abrirYoutube(audio.url),
                  ),
                  title: Text(
                    audio.nome,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class _AudioItem {
  final String nome;
  final String url;

  _AudioItem({required this.nome, required this.url});
}
