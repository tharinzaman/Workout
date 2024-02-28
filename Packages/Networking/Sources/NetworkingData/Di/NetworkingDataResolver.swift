//
//  File.swift
//
//
//  Created by Tharin Zaman on 27/02/2024.
//

import Foundation
import NetworkingDomain
import Swinject

@available(
    iOS 13.0.0,
    *
)
public struct NetworkingDataResolver {
    
    private init() {}
    
    static let shared = NetworkingDataResolver()
    
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
@available(
    iOS 13.0.0,
    *
)
fileprivate func buildDependencyInjectionContainer() -> Container {
    
    let container = Container()
    
    container.register(
        Fetch.self
    ) { _ in
        return FetchImpl(
            client: NetworkClientImpl()
        )
    }
    
    return container
}

