import 'package:delivery_app/model/bussiness.dart';

class BussinessDao {
  final List<Bussiness> bussinesses = [
    Bussiness(
      'Dante\'s Ristorante',
      'Restaurante',
      'address',
      'Comida Tipica Italiana',
      'Comida',
    ),
    Bussiness(
      'McGyver Tools',
      'Ferreteria',
      'address',
      'Las mejores Herramientas',
      'Herramientas',
    ),
    Bussiness(
      'Jekyll Medicamenets',
      'Drogueria',
      'address',
      'Curamos todos sus males',
      'Medicamentos',
    ),
    // Bussiness(
    //   'Apple',
    //   'Tec',
    //   'address',
    //   'Los dejamos sin un centavo',
    //   ['Herramientas'],
    // ),
  ];
}
