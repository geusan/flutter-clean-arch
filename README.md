# flutter_clean_arch

A new Flutter project.

## Objectitive

Make clean architectural flutter project.

## Requirements

- Flutter MVVM design pattern
- 4 Layer architecture: Domain / Repository / Service(Usecase) / Presentation(View, ViewModel)

### Pub libs
- Dio: Http request
- get_it: Dependency injection
- injectable: I don't know well.. what it is.. i'm struggling now.
- get: Page routers(can make named router easily)
- provider: State management in viewmodel.(I had considered with RxDart with DI, it was too complex)
- intl: i18n
- shared_preferences, sqflite: local storage
- 

## Directory
```bash
- lib
    | - common: enums? (I'm thinking..)
    | - domain: model definition(with JsonSerializable)
    | - repository
        | - api: api_provider
            | - network: retrofit api defnition
            | - interceptors: dio interceptors
            | - endpoints.dart: remote server endpoints
        | - shared_preferences: local storage
        | - sqflite: local storage(pending...)
    | - screens: views and viewmodels
    | - services(usercase): business logic
    | - values: constants for design or anything
    | - di.dart: dependency injection config
    | - main.dart: main file
```

### Discussion
- Is it the best way about using GetX as page routes navigator?


## Todo

- [x] Make auth screen for login(username and password)
- [x] Api(with go-clean-arch-chat-server)
- [x] Make chat socket example
- [ ] Sqflite (saving messages) Template
- [ ] Make unit test cases
- [ ] Refactoring


## Reference
- [flutter_basic_architecture - tyeom](https://github.com/tyeom/flutter_basic_architecture)
- [flutter-architecture - tguizelini](https://github.com/tguizelini/flutter-architecture)
- [Flutter 인기 아키텍처 라이브러리 3종 비교 분석 - GetX vs BLoC vs Provider](https://engineering.linecorp.com/ko/blog/flutter-architecture-getx-bloc-provider)
