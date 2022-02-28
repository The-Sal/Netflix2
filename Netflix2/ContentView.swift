//
//  ContentView.swift
//  Netflix2
//
//  Created by Sal Faris on 29/01/2022.
//

import SwiftUI

struct ContentView: View {
    @State var enterText = String()
    @State var processURL = String()
    
    @State var possibleURLS = [recents]()
    
    func processLinkToName(link: String) -> String{
        let ln = link.components(separatedBy: "/series/")[1]
        var comps = ln.split(separator: "-")
        comps = comps.dropLast()
        
        var completeName = ""
        
        for part in comps{
            completeName += " " + part.localizedUppercase
        }
        
        
        completeName.removeFirst()
        
    
        return completeName
        
    }
    
    var body: some View {
        ZStack{
            Color.black
            if processURL == String(){
                VStack{
                    TextField("Enter URL", text: $enterText).onSubmit {
                        processURL = enterText
                    }
                    .frame(width: 400)
                    .textFieldStyle(.roundedBorder)
                    
                    Text("Recently Watched")
                        .bold()

                    
                    List(possibleURLS){ recentLink in
                        
                        Button{
                            processURL = recentLink.val
                        } label: {
                            Text(processLinkToName(link: recentLink.val))
                                .foregroundColor(.white)
                                
                        }.buttonStyle(.borderless)

                        
                    }.onAppear {
                        possibleURLS = User_getRecents()
                    }
                }

            }else{
                SeriesView(seriesURL: processURL)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
