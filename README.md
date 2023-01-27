# Meli Learning Combine

Vamos apriender combine con los indexes.

1. Que es Programação Reativa (como haciemos hoy con su event y delegates vs con Combine ) ?
2. Diferencia de Subjects, Publisher y Operations.
3. Diferencia de @Published, CurrentValueSubject y PassthroughSubject.
4. Diferencia de los operantions stream(), como Zip, Merge e CombineLatest .
5. Future y Deferred como usar.
6. Como hacer um dispatchGroup, Semaphoro y thread simultáneos con Combine.
7. Como mesclar Combine y Async-Await.
8. Unit Test con Async.


# Chapter 1 :

Code en playground.

```swift
import Combine
import Foundation

var numberOne = 1
var numberTwo = 2

var sum = numberOne + numberTwo

print(sum)


// Publisher send event.
// Sub ... listenner

var cancellables = Set<AnyCancellable>()

var numberOnePublisher = Just(1)

var numberTwoPublisher = Just(1)

// combineLatest => operation.



numberOnePublisher.combineLatest(numberTwoPublisher).sink { completion in
    print(completion)
} receiveValue: { (numOne, numTwo) in
    print(numOne + numTwo)
}.store(in: &cancellables)

numberOnePublisher
    .map { "\($0)" } // Model Response
    .map { "Add una Reglas : \($0) "} // Mapper Model Response to Model View
    .sink { value in
        print("en View \(value)") // Setup value on View
    }


print("-----------------")


enum MyError: Error {
    case completation
}


var stream = CurrentValueSubject<String, MyError>("Inital")
stream.sink { completion in
    print(completion)
} receiveValue: { value in
    print("\(value) primer")
}.store(in: &cancellables)

stream.send("new value")
stream.send("another")


```



## Bibliografia

https://sites.google.com/mercadolibre.com/mobile/arquitectura/ios/deprecado-rxswift-c%C3%B3mo-reemplazar-con-combine?authuser=0&pli=1


https://www.kodeco.com/books/combine-asynchronous-programming-with-swift/v3.0/chapters/2-publishers-subscribers


https://medium.com/@iostpointblog/what-is-kvo-and-kvc-in-ios-a2d9365b4796

