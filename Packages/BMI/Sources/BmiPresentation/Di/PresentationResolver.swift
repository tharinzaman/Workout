//
//  File.swift
//  
//
//  Created by Tharin Zaman on 09/03/2024.
//

import Foundation
import Swinject
import Alerts

@available(iOS 13.0, *)
internal struct PresentationResolver {
    
    private init() {}
    
    internal static let shared = PresentationResolver()
    
    private var container = buildDependencyInjectionContainer()
    
    public func resolve<T>(
        _ type: T.Type
    ) -> T? {
        return container.resolve(
            T.self
        )
    }
}

@available(iOS 13.0, *)
fileprivate func buildDependencyInjectionContainer() -> Container {
    
    let container = Container()
    
    container.register(
        AlertHelper.self
    ) { _ in
        return BmiAlertHelperImpl()
    }

    return container
}
