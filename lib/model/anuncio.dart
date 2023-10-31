class Anuncio {
  final String imagemUrl; // URL da imagem
  final String categoria;
  final String status;
  final String dataColheita;
  final List<String> comentarios;
  final String telefone;
  final String email;
  final double preco; // Novo atributo para o preço

  Anuncio(
    this.imagemUrl,
    this.categoria,
    this.status,
    this.dataColheita,
    this.comentarios,
    this.telefone,
    this.email,
    this.preco, // Incluindo o preço no construtor
  );
}
