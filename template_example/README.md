# desafio_toro

Projeto para o desafio técnico da equipe Toro.

## Como rodar o projeto:

Este projeto foi desenvolvido utilizando as seguintes dependências externas:

- [flutter_svg](https://pub.dev/packages/flutter_svg)
- [http](https://pub.dev/packages/http)
- [json_annotation](https://pub.dev/packages/json_annotation)
- [rxdart](https://pub.dev/packages/rxdart)
- [mask_text_input_formatter](https://pub.dev/packages/mask_text_input_formatter)
- [provider](https://pub.dev/packages/provider)
- [build_runner](https://pub.dev/packages/build_runner)
- [json_serializable](https://pub.dev/packages/json_serializable)

Para obter todas as dependências externas, rodar `flutter pub get`

Para manter os packages atualizados, rodar `flutter pub upgrade`.

Para rodar o projeto: utilizar o comando `flutter pub run` no nível do projeto (pasta desafio_toro).

## Arquitetura

O projeto foi desenvolvido seguindo o padrão `BlocPattern`, tendo sua injeção de dependências feita pelo `Provider`.

A organização de pastas segue o padrão:

### Modules: 
Cada módulo da aplicação terá sua própria pasta.

Cada `Module` terá seus respectivos submódulos. Estes se caracterizam pelas seguinte estrutura de pastas:

### Provider:
Classe responsável pela injeção de depência de cada módulo.

### Pages: 
Ficará aqui nossa View. Toda a UI deverá vir nessa pasta;

### Controller: 
Nossa ViewModel. O `Controller` é responsável por adaptar os dados do nosso `UseCases` para nossa UI'

### UseCases: 
as regras da aplicação. Este terá a responsabilidade de comunicar-se com nossa regra de negócios, `Repositories`;

### Repositories: 
Nossa camada para tratar os dados externos da nossa regra de negócios, este se comunica com nossa fonte de dados `Services`;

### Services: 
unicamente responsável por fazer a comunicação com nosso serviço externo.

### Widget:
Um módulo poderá ter um componente próprio que tem uso excluiso neste módulo e que se repete ao longo do mesmo. Nesse caso, este componente deverá vir nessa pasta

Fora de `Modules`, temos o módulo `Shared` que são todas as classes que podem ser chamadas em qualquer lugar do app, comumente utilizada para Utilidades, constantes e componentes.


- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
