import 'package:calc_imc/models/pessoa.dart';
import 'package:test/test.dart';

void main() {
  var pessoa = Pessoa("", 90, 1.90);
  test('calculo do imc', () {
    expect(pessoa.calculaimc(), 24.930747922437675);
  });
}
