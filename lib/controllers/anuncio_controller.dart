import 'package:melancia_express/model/anuncio.dart';

class AnuncioController {
  List<Anuncio> listaDeAnuncios = [
    Anuncio(
      'assets/images/plantacao.png',
      "sem semente",
      "Crescimento",
      "23-10-2023",
      ["-"],
      "123-456-7890",
      "email1@example.com",
      0.99, // Inclua o preço aqui
    ),
    Anuncio(
      'assets/images/plantacao.png',
      "Amarela",
      "Colheita",
      "20-03-2023",
      [""],
      "987-654-3210",
      "email2@example.com",
      01.10, // Inclua o preço aqui
    ),
    Anuncio(
      'assets/images/logo.png',
      "Amarela",
      "Crescimento",
      "10-02-2023",
      [""],
      "555-555-5555",
      "email3@example.com",
      01.15, // Inclua o preço aqui
    ),
    // Adicione mais anúncios fictícios conforme necessário
  ];
}
