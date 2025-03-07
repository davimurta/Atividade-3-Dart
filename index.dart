import 'dart:io';

void main() {
  Empresa empresa = Empresa();

  while (true) {
    print('\n1. Adicionar Funcionário');
    print('2. Listar Funcionários');
    print('3. Aumentar Salário');
    print('4. Remover Funcionário');
    print('5. Sair');
    stdout.write('Escolha uma opção: ');
    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        stdout.write('ID: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Nome: ');
        String nome = stdin.readLineSync()!;
        stdout.write('Cargo: ');
        String cargo = stdin.readLineSync()!;
        stdout.write('Salário: ');
        double salario = double.parse(stdin.readLineSync()!);

        empresa.adicionarFuncionario(Funcionario(id, nome, cargo, salario));
        print('Funcionário adicionado com sucesso!');
        break;

      case '2':
        empresa.listarFuncionarios();
        break;

      case '3':
        stdout.write('Informe o ID do funcionário: ');
        int id = int.parse(stdin.readLineSync()!);
        stdout.write('Informe a porcentagem de aumento: ');
        double percentual = double.parse(stdin.readLineSync()!);
        empresa.aumentarSalarioFuncionario(id, percentual);
        break;

      case '4':
        stdout.write('Informe o ID do funcionário a remover: ');
        int id = int.parse(stdin.readLineSync()!);
        empresa.removerFuncionario(id);
        break;

      case '5':
        print('Saindo do programa...');
        return;

      default:
        print('Opção inválida, tente novamente.');
    }
  }
}

class Funcionario {
  final int id;
  String nome;
  String cargo;
  double _salario;

  Funcionario(this.id, this.nome, this.cargo, this._salario);

  double get salario => _salario;

  void aumentarSalario(double percentual) {
    if (percentual > 0) {
      _salario += _salario * (percentual / 100);
      print('Salário atualizado com sucesso!');
    } else {
      print('Percentual inválido para aumento salarial.');
    }
  }

  void exibirInformacoes() {
    print('ID: $id');
    print('Nome: $nome');
    print('Cargo: $cargo');
    print('Salário: R\$ ${_salario.toStringAsFixed(2)}');
    print('---------------------------');
  }
}

class Empresa {
  List<Funcionario> funcionarios = [];

  void adicionarFuncionario(Funcionario funcionario) {
    funcionarios.add(funcionario);
  }

  void removerFuncionario(int id) {
    funcionarios.removeWhere((funcionario) => funcionario.id == id);
    print('Funcionário removido com sucesso!');
  }

  void listarFuncionarios() {
    if (funcionarios.isEmpty) {
      print('Nenhum funcionário cadastrado.');
    } else {
      for (var funcionario in funcionarios) {
        funcionario.exibirInformacoes();
      }
    }
  }

  void aumentarSalarioFuncionario(int id, double percentual) {
    for (var funcionario in funcionarios) {
      if (funcionario.id == id) {
        funcionario.aumentarSalario(percentual);
        return;
      }
    }
    print('Funcionário não encontrado.');
  }
}
