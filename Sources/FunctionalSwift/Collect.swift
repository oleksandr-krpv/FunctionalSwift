//
//  Collect.swift
//  
//
//  Created by Alexander Karpov on 28.05.2020.
//

/**
 Function that combine calls of several functions
  ```
 func a() {
     print("func a called")
 }

 func b() {
     print("func b called")
 }

 func c() {
     print("func c called")
 }

 callTogether(a ,b ,c)()
 //func a called
 //func b called
 //func c called
  ```
 Introducing a 'callTogether' function to collect calls to several closures into one:
  - Parameter closures: closures that will call together
  - Returns: closure that contains calls of all input closures
 */

public func collect<A>(_ closures: Closure<A>?...) -> Closure<A> {
    { value in closures.forEach { $0?(value) } }
}

public func collect(_ closures: Handler?...) -> Handler {
    { closures.forEach { $0?() } }
}

