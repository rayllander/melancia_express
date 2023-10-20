import 'package:flutter/material.dart';
import 'package:melancia_express/view/pages/login_page.dart';

void main() {
  runApp(const inicioPage());
}

class inicioPage extends StatelessWidget {
  const inicioPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Inicio(),
        ],
      ),
    );
  }
}

class Inicio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 414,
          height: 736,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Color(0xFFF5F5F5)),
          child: Stack(
            children: [
              Positioned(
                left: 45,
                top: 166,
                child: Container(
                  width: 324,
                  height: 405,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 324,
                          height: 405,
                          decoration: ShapeDecoration(
                            color: Color(0xCCF7F7F7),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1, color: Color(0xFFFF6961)),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 59,
                        top: 83,
                        child: Text(
                          'BEM VIND@',
                          style: TextStyle(
                            color: Color(0xFFFF6961),
                            fontSize: 36,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 251,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                            );
                            // Lógica para o botão "LOGAR"
                            // Por exemplo, navegar para outra tela ou executar uma ação.
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF6961),
                            minimumSize: Size(291, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'LOGAR',
                            style: TextStyle(
                              color: Color(0xFFF5F5F5),
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 174,
                        child: ElevatedButton(
                          onPressed: () {
                            // Lógica para o botão "CADASTRAR"
                            // Por exemplo, navegar para outra tela ou executar uma ação.
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFFFF6961),
                            minimumSize: Size(291, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'CADASTRAR',
                            style: TextStyle(
                              color: Color(0xFFF5F5F5),
                              fontSize: 24,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w300,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 124,
                top: 83,
                child: Container(
                  width: 167,
                  height: 167,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
