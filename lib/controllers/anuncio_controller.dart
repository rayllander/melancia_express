import 'package:melancia_express/model/anuncio.dart';

class AnuncioController {
  List<Anuncio> listaDeAnuncios = [
    Anuncio(
      'assets/images/plantacao.png',
      "Categoria: sem semente",
      "Status: crescimento",
      "23-10-2023",
      ["-"],
      "123-456-7890",
      "email1@example.com",
      0.99, // Inclua o preço aqui
    ),
    Anuncio(
      'assets/images/plantacao.png',
      "Categoria: Amarela",
      "Status: colheita",
      "20-03-2023",
      [""],
      "987-654-3210",
      "email2@example.com",
      01.10, // Inclua o preço aqui
    ),
    Anuncio(
      'assets/images/logo.png',
      "Categoria: Amarela",
      "Status: crescimento",
      "10-02-2023",
      [""],
      "555-555-5555",
      "email3@example.com",
      01.15, // Inclua o preço aqui
    ),
    // Adicione mais anúncios fictícios conforme necessário
  ];
}
