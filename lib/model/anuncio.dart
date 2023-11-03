class Anuncio {
  final List<String> listaDeImagens; // Lista de URLs de imagens
  final String categoria;
  final String status;
  final String dataColheita;
  final List<String> comentarios; // em duvida
  final String telefone;
  final String email;
  final double preco; // Novo atributo para o preço

  Anuncio({
    required this.listaDeImagens,
    required this.categoria,
    required this.status,
    required this.dataColheita,
    required this.comentarios, // duvida
    required this.telefone,
    required this.email,
    required this.preco, // Incluindo o preço no construtor
  });
}
