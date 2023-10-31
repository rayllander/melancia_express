class UsuarioController {
  List<String> usuarios = [
    'maria produtora',
    'laura, comprador',
    'rayllander, vendedor',
    'Isaac, agronomo',
    'laurao, produtora',
    'ray, comprador',
    'maria de sá, vendedor',
    'isaac newton, agronomo',
  ];

  // Outros métodos relevantes para gerenciar usuários, como adicionar, editar ou excluir, podem ser adicionados aqui.

  List<String> searchUsuarios(String termo) {
    termo = termo.toLowerCase();
    return usuarios
        .where((usuario) => usuario.toLowerCase().contains(termo))
        .toList();
  }
}
