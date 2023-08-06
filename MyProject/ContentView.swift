//
//  ContentView.swift
//  MyProject
//
//  Created by HuangSenhui on 2023/6/4.
//  Copyright © 2023 H.S.H. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Divider()
            
            // Xcode 15 自动生成 symbols 常量, xxxColor、xxxImage 自动优化掉后缀
            Image(.myDebug)
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            Button {
                logger.info("按钮被点击了")
            } label: {
                Text("Xcode 15")
                    .foregroundColor(Color(.myDebug))
            }

        }
        .padding()
    }
}

// Swift 5.9: Swift 宏
#Preview {
    ContentView()
}
