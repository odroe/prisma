# Configuration

Prisma ORM for Dart does not exist any third-party configuration scheme, so you do not need to add any configuration files to your project.

However Prisma ORM for Dart has some configuration options that can be used in the project. These options are only used in the CLI. In the Prisma client, it is generated by the code generator.

### Basics (pubspec.yaml)

In pubspec.yaml you can configure basic options for Prisma ORM for Dart.

```yaml
prisma:
    schema: prisma/schema.prisma # Path to your Prisma schema
    production: lib/prisma_configurator.dart # Path to your production configurator
    development: prisma/development.dart # Path to your development configurator
```

### Production

In a production environment, Prisma ORM for Dart will load the `lib/prisma_configurator.dart` file by default.

> The loading here is done by the code generated by codegen, if there is no configuration in `pubspec.yaml` and no `lib/prisma_configurator.dart` file exists, then Prisma ORM for Dart will not import it.

```dart
import 'package:orm/configure.dart';

/// Configure Prisma for production environment.
///
/// **NOTE**: The function name must be configurePrisma.
void configurePrisma(PrismaEnvironment environment) {
    /// here is your configuration code
    environment['DATABASE_URL'] =
      r'postgres://seven@localhost:5432/demo?schema=public';
}
```

### Development

In a development environment, Prisma ORM for Dart runs the `prisma/development.dart` file by default.

```yaml
prisma:
    development: prisma/development.dart
```

Equivalent to:
```yaml
prisma:
    development:
        executable: dart
        arguments:
            - run
            - prisma/development.dart
```

The development configuration is a runnable program that can be in any language as long as it can be run in a terminal. Here is an example in Dart language:

```dart
import 'package:orm/configure.dart';

/// Prisma development environment configurator.
void configurator(PrismaDevelopment development) {
  development.override(
      'DATABASE_URL', r'postgres://seven@localhost:5432/demo?schema=public');
}

/// Configure Prisma for development environment.
///
/// **NOTE**: Prisma development must be an executable.
///
/// The `main` function is a Dart executable file entrypoint.
void main() => PrismaDevelopment.server(configurator);
```

### Schema

The `--schema` option of Prisma CLI is used to specify the path of the Prisma schema file. The search order of the parameters is:

1. `--schema` option
2. `prisma.schema` option configured in pubscpe.yaml
3. Default `prisma/schema.prisma`

Passing `--schema` in the terminal every time is always annoying, so we recommend configuring the `prisma.schema` option in pubspec.yaml:

```yaml
prisma:
    schema: prisma/schema.prisma
```