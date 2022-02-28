//
//  ErrorView.swift
//  Netflix2
//
//  Created by Sal Faris on 28/02/2022.
//

import SwiftUI

struct ErrorView: View {
    
    var error: String
    
    var body: some View {
        VStack{
            Text(">>\(error)<<")
                .font(.title)
            
            Text("")
            
            HStack{
                Image(systemName: "info.circle")
                Text("Use cmd+w to close the window and cmd+n to open a new one.")
                    .font(.footnote)
            }
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Invalid Domain")
    }
}
