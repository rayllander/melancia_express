class AnnouncementModel {
  late String categoria;
  late int preco;
  late String status;
  late DateTime dataColheita;
  late int telefone;
  late String email;
  late String usuarioPointer;

  AnnouncementModel({
    required this.categoria,
    required this.preco,
    required this.status,
    required this.dataColheita,
    required this.telefone,
    required this.email,
    required this.usuarioPointer,
  });

  Map<String, dynamic> toMap() {
    return {
      'categoria': categoria,
      'preco': preco,
      'status': status,
      'data_colheita': dataColheita,
      'telefone': telefone,
      'email': email,
      'usuario_pointer': usuarioPointer,
    };
  }
}
