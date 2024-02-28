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
    
    private init() {}
    
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

// We only want outside modules to interact with the use cases, therefore we will only register the use cases.
fileprivate func buildDependencyInjectionContainer() -> Container {
    
    let container = Container()
    
    container.register(
        GetBmi.self
    ) { _ in
        return GetBmiImpl()
    }
    
    container.register(
        GetBmiCategory.self
    ) { _ in
        return GetBmiCategoryImpl()
    }
    
    return container
}
