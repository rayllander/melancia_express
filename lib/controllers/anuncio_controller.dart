import 'package:melancia_express/model/anuncio.dart';

class AnuncioController {
  List<Anuncio> listaDeAnuncios = [
    Anuncio(
      listaDeImagens: [
        'assets/images/imagem1.png',
        'assets/images/imagem2.png',
        'assets/images/imagem3.png',
      ],
      categoria: "sem semente",
      status: "Crescimento",
      dataColheita: "23-10-2023",
      comentarios: [""],
      telefone: "123-456-7890",
      email: "Rayllander@example.com",
      preco: 0.99,
    ),
    Anuncio(
      listaDeImagens: [
        'assets/images/imagem4.png',
        'assets/images/imagem5.png',
        'assets/images/imagem6.png',
      ],
      categoria: "Amarela",
      status: "Colheita",
      dataColheita: "20-03-2023",
      comentarios: [""],
      telefone: "987-654-3210",
      email: "MariaEduarda@example.com",
      preco: 1.10,
    ),
    Anuncio(
      listaDeImagens: [
        'assets/images/imagem7.png',
        'assets/images/imagem8.png',
        'assets/images/imagem9.png',
      ],
      categoria: "Amarela",
      status: "Crescimento",
      dataColheita: "10-02-2023",
      comentarios: [""],
      telefone: "555-555-5555",
      email: "Laurao@example.com",
      preco: 1.15,
    ),
    // Adicione mais anúncios fictícios conforme necessário
  ];
}
