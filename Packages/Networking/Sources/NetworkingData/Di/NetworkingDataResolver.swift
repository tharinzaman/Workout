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
class NetworkingDataResolver {
    
    static let shared = NetworkingDataResolver()
    
    private var container = buildDependencyInjectionContainer()
    
    func resolve<T>(
        _ type: T.Type
    ) -> T? {
        return container.resolve(
            T.self
        )
    }
}

// We only want outside modules to interact with the use cases, therefore we will only register the use cases.
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

