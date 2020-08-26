//
//  File.swift
//  
//
//  Created by Alexander Karpov on 26.08.2020.
//

/// function curring, converts function that takes one argument into function that takes no arguments
/// - Example:
/// regular function: `ƒ(a) -> b`
/// curried function ` ƒ(a) -> ƒ() -> b`
///
///```
///class Button {
///    var handler: (()-> Void)? = nil
///}
///
///struct Product {}
///
///class ProductManager {
///    func startCheckout(for product: Product) {}
///}
///
///class ProductViewController {
///    let buyButton: Button = .init()
///    let productManager: ProductManager = .init()
///    let product = Product()
///
///    func viewDidLoad() {
///        // without curring
///        buyButton.handler = { [weak self] in
///            guard let self = self else {
///                return
///            }
///            self.productManager.startCheckout(for: self.product)
///        }
///        // using curring
///        buyButton.handler = curry(
///            productManager.startCheckout(for:),
///            argument: product
///        )
///    }
///}
///
/// ```
///
/// - Parameters:
///   - function: currying function
///   - argument: argument
/// - Returns: curried function
func curry<Arg1, Result>(
    _ function: @escaping (Arg1) -> Result,
    argument: Arg1
) -> () -> Result {
    { function(argument) }
}



/// function currying, converts function that takes two  arguments into two functions that each take single argument
/// - Example:
///  regular function:  `ƒ(a,b) -> c`
///  curried function: `ƒ(a) -> ƒ(b) -> c`
/// - Parameters:
///   - function: currying function
///   - argument: first argument
/// - Returns: curried function
func curry<Arg1, Arg2, Result>(
    _ function: @escaping (Arg1, Arg2) -> Result,
    argument: Arg1
) -> (Arg2) -> Result {
    { function(argument, $0) }
}

