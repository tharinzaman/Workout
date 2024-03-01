//
//  SwiftUIView.swift
//  
//
//  Created by Tharin Zaman on 01/03/2024.
//

import SwiftUI

@available(iOS 14.0.0, *)
public struct LoadingScreen: View {
    
    public init() {}
    
    public var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .green))
        }
    }
}

