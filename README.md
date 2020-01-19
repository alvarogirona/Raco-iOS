# Raco-iOS

iOS app for the FIB UPC student portal (a.k.a Racó).

## Project architecture

The architecture is based on Uncle's Bob [Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

The project is divided on the following modules:

- **Raco:** Contains iOS framework specific presentation code (ViewControllers, Views, ViewModels...).
- **RacoDomain:** Code related to the domain of the app (Entities/Models, Repository protocols for dependency inversion with platform...)
- **Platform:** Repositories implementation, network related code.
- **RacoUIKit:** Set of reusable UIKit extensions that I use on different projects.

The project uses dependency injection. Each module has a dependency container (if needed) and submodules.

## About the layouts and views

Layouts and views are all created from code. The project uses Xcode 11 live previews alongside with UIKit to provide previews for each view as explained [NSHipster](https://nshipster.com/swiftui-previews/).

## Dependencies

Dependencies are managed with Swift Package Manager. The included dependencies are:

- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [Alamofire](https://www.github.com/Alamofire/Alamofire)

## API

The used API can be found [here](https://api.fib.upc.edu).