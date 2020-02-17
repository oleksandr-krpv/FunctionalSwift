//
//  Pipe.swift
//
//
//  Created by Alexander Karpov on 17.02.2020.
//

/**
 Operator enable piping of arguments inside function using simple syntax
 #Pipe operator
 example https://five.agency/functional-programming-in-swift/
 function like this:
 ```
 let result = joinByComma(formatForPrint(sortByGrade(filterOutFailed(students))))
 ```
 becomes:
 ```
 let result = students |> filterOutFailed |> sortByGrade |> formatForPrint |> joinByComma
 ```
 */
infix operator |> : pipe
precedencegroup pipe {
    associativity: left
//    precedence: 80
}

public func |> <T, U>(
    value: T,
    function: ((T) -> U)
) -> U {
    return function(value)
}
