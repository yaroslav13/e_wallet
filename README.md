# e_wallet

The project must help people organize their spending.

Before run you must complete next steps.

# Setup FVM

In order to run EWallet project FVN should be installed. https://fvm.app/docs/getting_started/installation
```
brew tap leoafarias/fvm
brew install fvm
fvm install 3.13.0
```

## Run the code generator script

Script ```scripts/run_code_generate.sh``` gets application dependencies.

### Run the generator manually

Use the [watch] flag to watch the files' system for edits and rebuild as necessary.

```fvm flutter packages pub run build_runner watch --delete-conflicting-outputs```

if you want the generator to run one time and exits use:

```fvm flutter packages pub run build_runner build --delete-conflicting-outputs```

## Build requires next parameters

You need to specify versions, `BUILD_TYPE`.
* **BUILD_TYPE** can be `dev`, `prod`

For example:
```
fvm flutter build apk --release \
--dart-define=BUILD_TYPE=dev  \
```

# Testing requirements 

Each screen must be covered by **golden** test. Some separated widgets also can be covered by **golden** tests.
Each interactive part of the screen must be covered by **widget** tests.
Important logical complex computation must be covered by **unit** test.

# Assert format

For icon and native splash screen use **.png**. 
For other app images use **.svg**.

For fonts let's use **GoogleFonts lib**.

# Code naming features

***Replace "Extension" with "X" postfix for the smaller name of extensions.***


# Assets

## Images
We prefer to use `SVG` image format.

Also we use `assets_gen` package to generate `ImagesSource` class for assets.

General `run_code_generate.sh` script will generate it for you.

In case if you want to generate it separately, you can run:

```
fvm flutter pub run assets_gen build
``` 

### Limitations for images
The images should be placed in `assets/images` folder. The depth of the folder should be no more than 2 levels.

Images located in `assets/images/launch_icon` folder will be ignored by `assets_gen`.

# Dependency Injection (DI)

We use the `injectable` and `get_it` packages for Dependency Injection in our project.

## Key Points

1. **Automatic Injectable Annotations:** The classes `Cubit`, `Interactor`, and `Mapper` are automatically marked as `@injectable` due to our predefined configurations.
   This automation heavily relies on adhering to specific naming conventions.

2. **Consistent Naming Conventions:** It's crucial to follow the established naming patterns consistently, as deviations can disrupt the automatic `@injectable` annotation process.

* Cubit Classes:

  **Class Name:** Should end with the `Cubit` postfix (e.g., AuthenticationCubit).
  **File Name:** Should end with `_cubit.dart` (e.g., authentication_cubit.dart).

* Interactor Classes:

  **Class Name:** Should end with the `Interactor` postfix (e.g., AuthenticationInteractor).
  **File Name:** Should end with `_interactor.dart` (e.g., authentication_interactor.dart).

* Mapper Classes:

  **Class Name:** Should end with the `Mapper` postfix (e.g., UserMapper).
  **File Name:** Should end with `_mapper.dart` (e.g., user_mapper.dart).

* Api Classes:

  **Class Name:** Should end with the `Api` postfix (e.g., UserApi).
  **File Name:** Should end with `_api.dart` (e.g., user_api.dart).

