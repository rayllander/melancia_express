import 'package:flutter/material.dart';
import 'package:melancia_express/model/anuncio.dart';

class AnuncioItem extends StatelessWidget {
  final Anuncio anuncio;

  AnuncioItem({required this.anuncio});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF000000).withOpacity(0.2),
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  // Parte da imagem em um Row
                  Row(
                    children: [
                      Expanded(
                        child: Center(
                          child: Image.asset(
                            anuncio.imagemUrl,
                            width:
                                388, // Ajuste a largura da imagem conforme necessário
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Parte das descrições em outro Row
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Categoria: ${anuncio.categoria}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                " Status: ${anuncio.status}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                " Data de Colheita: ${anuncio.dataColheita}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                " Comentários: ${anuncio.comentarios.join(', ')}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                " Preço: ${anuncio.preco.toStringAsFixed(2)}  ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromRGBO(51, 219, 0, 0.945),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Telefone: ${anuncio.telefone}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "E-mail: ${anuncio.email}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
