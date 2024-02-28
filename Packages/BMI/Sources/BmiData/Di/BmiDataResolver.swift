//
//  File.swift
//
//
//  Created by Tharin Zaman on 28/02/2024.
//

import Foundation
import BmiDomain
import Swinject

public struct BmiDataResolver {
    
    private init() {
    }
    
    static let shared = BmiDataResolver()
    
    private var container = buildDependencyInjectionContainer()
    
    public func resolve<T>(
        _ type: T.Type
    ) -> T? {
        return container.resolve(
            T.self
        )
    }
}

// We only want outside modules to interact/access the use cases, therefore we will only register the use cases and nothing else in order to hide the others.
fileprivate func buildDependencyInjectionContainer() -> Container {
    
    let container = Container()
    
    container.register(
        GetImperialBmi.self
    ) { _ in
        return GetImperialBmiImpl(
            calculator: BmiCalculatorImpl()
        )
    }
    
    container.register(
        GetMetricBmi.self
    ) { _ in
        return GetMetricBmiImpl(
            calculator: BmiCalculatorImpl()
        )
    }
    
    container.register(
        GetBmiCategory.self
    ) { _ in
        return GetBmiCategoryImpl(
            calculator: BmiCalculatorImpl()
        )
    }
    
    return container
}
