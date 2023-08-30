import 'package:calc_imc/excecoes/nome_invalido.dart';
import 'package:calc_imc/models/console_utils.dart';

import 'models/pessoa.dart';

void imcApp() {
  print("Bem vindo à calculadora de IMC");
  String nome;
  double? altura;
  double? peso;

  nome = ConsoleUtils.lerStringComTexto("Digite o seu nome:");

  if (nome.trim() == "") {
    throw NomeInvalidoException();
  }

  altura = ConsoleUtils.lerDoubleComTexto("Digite a sua altura:");

  while ((altura?.isNegative ?? true) || altura == 0.0 || altura! > 3.0) {
    altura =
        ConsoleUtils.lerDoubleComTexto("Altura inválida! Digite novamente:");
  }

  peso = ConsoleUtils.lerDoubleComTexto("Digite o seu peso:");

  while (peso?.isNegative ?? true) {
    peso = ConsoleUtils.lerDoubleComTexto(
        "Peso inválido! Digite novamente o peso:");
  }

  var pessoa = Pessoa(nome, peso ?? 0.0, altura);

  double imc = pessoa.calculaimc();
  print("O IMC do(a) ${pessoa.getNome()} é: $imc");

  String classificacao = pessoa.infImc(imc);
  print("o Status do imc do(a) ${pessoa.getNome()} é: $classificacao");
}
