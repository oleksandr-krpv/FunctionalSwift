//
//  Combine.swift
//  
//
//  Created by Alexander Karpov on 17.02.2020.
//

/**
 Function that can apply value as closure argument.
  
 source: https://www.swiftbysundell.com/tips/combining-values-with-functions/
  
 A view controller that currently captures 'self' weakly, in
 order to call a method on a 'productManager' property object:
  
 ```
 class ProductViewController: UIViewController {
     ...

     override func viewDidLoad() {
         super.viewDidLoad()

         buyButton.handler = { [weak self] in
             guard let self = self else {
                 return
             }

             self.productManager.startCheckout(for: self.product)
         }
     }
 }
  
 class ProductViewController: UIViewController {
      ...

      override func viewDidLoad() {
          super.viewDidLoad()
          
          buyButton.handler = combine(product,
              with: productManager.startCheckout
          )
      }
 }
  ```

 Introducing a 'combine' function for applying a value to
 any function or closure:
  - Parameter value: value you want to pass as closure argument
  - Parameter closure: closure that will receive `value` as argument
  - Returns: modifed closure
 */
@available(*, deprecated, message: "use `curry` instead")
public func combine<A, B>(
    _ value: A,
    with closure: @escaping (A) -> B
) -> () -> B {
    { closure(value) }
}
