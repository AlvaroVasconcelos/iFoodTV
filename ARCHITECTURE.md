# Documentação da Arquitetura

## Visão Geral

Este documento fornece uma visão geral da arquitetura do IFoodTV App. O aplicativo é construído utilizando os princípios da Clean Architecture, `flutter_bloc` para gerenciamento de estado, `go_route` para roteamento, `provider` para injeção de dependências e `flutter_lints` para qualidade de código.

## Clean Architecture

A Clean Architecture divide o projeto em camadas distintas, cada uma com uma responsabilidade específica. As camadas são:

- **Domain (Domínio)**
- **Data (Dados)**
- **Presentation (Apresentação)**
- **Application (Aplicação)**

### Camada de Domínio

A camada de Domínio é a camada mais interna e contém a lógica de negócios. Esta camada é independente de quaisquer frameworks ou bibliotecas externas.

- **Entities (Entidades)**: Classes principais do aplicativo, contendo lógica de negócios.
- **Use Cases (Casos de Uso)**: Regras de negócios específicas da aplicação.
- **Repositories (Repositórios)**: Definições abstratas das operações de dados.

### Camada de Dados

A camada de Dados é responsável por gerenciar dados de várias fontes, como APIs, bancos de dados locais e servidores remotos. Ela implementa os repositórios definidos na camada de Domínio.

- **DTOs (Data Transfer Objects)**: Estruturas de dados usadas para transferir dados entre camadas.
- **Adapters**: Classes responsáveis por converter DTOs em entidades de domínio e vice-versa.
- **Repositories (Repositórios)**: Implementações concretas das interfaces dos repositórios da camada de Domínio.
- **Data Sources (Fontes de Dados)**: Classes responsáveis por buscar dados de APIs ou armazenamento local.

### Camada de Apresentação

A camada de Apresentação lida com a interface do usuário e a interação com o usuário. Consiste em:

- **Widgets**: Widgets do Flutter que compõem a UI.
- **Blocs/Cubits**: Classes `flutter_bloc` para gerenciar estado e lógica de negócios.
- **Pages (Páginas)**: Widgets de alto nível representando diferentes telas no aplicativo.

### Camada de Aplicação

A camada de Aplicação contém a configuração e o código de inicialização do aplicativo.

- **Views**: Classes Stateless que combinam injeção de dependências e definição de rotas usando `provider` e `go_route`.

### Exemplo de `HomeView`

```dart
class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
        Provider(create: (_) => DatabaseService()),
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => HomePage(),
            ),
            GoRoute(
              path: '/details',
              builder: (context, state) => DetailsPage(),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Gerenciamento de Estado

O gerenciamento de estado é realizado usando o pacote `flutter_bloc`. Cada funcionalidade tem seu próprio Bloc ou Cubit para gerenciar seu estado.

- **Cubits**: Usados para gerenciar estado e lógica de negócios.
- **States (Estados)**: Diferentes estados da UI.

### Exemplo

```dart
// CounterCubit.dart
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
```

## Injeção de Dependências

O `provider` é utilizado para injeção de dependências e gerenciamento de estado em todo o aplicativo. As dependências são configuradas na inicialização do aplicativo e injetadas onde necessário.

### Exemplo

```dart
void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => ApiService()),
        Provider(create: (_) => DatabaseService()),
        BlocProvider(create: (context) => CounterCubit()),
      ],
      child: MyApp(),
    ),
  );
}
```

### Acessando Dependências

As dependências podem ser acessadas em qualquer lugar do widget tree usando o `Provider.of` ou `context.read`.

```dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value: ${context.watch<CounterCubit>().state}'),
            ElevatedButton(
              onPressed: counterCubit.increment,
              child: Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Roteamento

O roteamento é gerenciado usando o pacote `go_route`. As rotas são definidas centralmente, e cada rota está associada a uma página.

### Exemplo

```dart
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/details',
      builder: (context, state) => DetailsPage(),
    ),
  ],
);
```

## Qualidade de Código

A qualidade do código é assegurada usando o pacote `flutter_lints`. Este pacote fornece um conjunto de regras de lint recomendadas para projetos Dart e Flutter.

### Configuração

1. Adicione `flutter_lints` ao seu `pubspec.yaml`:

```yaml
dev_dependencies:
  flutter_lints: ^2.0.0
```

2. Crie um arquivo `analysis_options.yaml` na raiz do seu projeto:

```yaml
include: package:flutter_lints/flutter.yaml
```

3. Execute o linter:

```sh
flutter analyze
```

## Estrutura de Diretórios

Aqui está um exemplo da estrutura de diretórios:

```
lib/
├── data/
│   ├── adapters/
│   ├── dtos/
│   ├── repositories/
│   └── data_sources/
├── domain/
│   ├── entities/
│   ├── usecases/
│   └── repositories/
├── presentation/
│   ├── blocs/
│   ├── pages/
│   └── widgets/
├── app/
│   ├── views/
├── main.dart
└── main_development.dart
└── main_staging.dart
└── main_production.dart
```

Para mais informações, consulte o [README do projeto](README.md).
