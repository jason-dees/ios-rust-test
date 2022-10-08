//
//  ContentView.swift
//  ios-rust
//
//  Created by Jason Dees on 10/7/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(sayHello(to: "World"))")
        }
        .padding()
    }
    
    func sayHello(to: String) -> String {
            let result = rust_greeting(to)
            let swift_result = String(cString: result!)
            rust_greeting_free(UnsafeMutablePointer(mutating: result))
            return swift_result
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
