import 'package:flutter/material.dart';
import 'package:melancia_express/model/anuncio.dart';
import 'package:dots_indicator/dots_indicator.dart';

class AnuncioItem extends StatefulWidget {
  final Anuncio anuncio;

  AnuncioItem({required this.anuncio});

  @override
  _AnuncioItemState createState() => _AnuncioItemState();
}

class _AnuncioItemState extends State<AnuncioItem> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imagens = widget.anuncio.listaDeImagens;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.99,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF000000).withOpacity(0.2),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  height: 250,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    children: imagens
                        .map((imagemUrl) => ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                imagemUrl,
                                fit: BoxFit.cover,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                DotsIndicator(
                  dotsCount: imagens.length,
                  position: _currentIndex.toDouble(),
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.red,
                  ),
                ),
                Container(
                  height: 200,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Categoria: ${widget.anuncio.categoria}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Status: ${widget.anuncio.status}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Data de Colheita: ${widget.anuncio.dataColheita}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "${widget.anuncio.preco.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${widget.anuncio.telefone}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${widget.anuncio.email}",
                            style: TextStyle(
                              fontSize: 16,
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
        ],
      ),
    );
  }
}
