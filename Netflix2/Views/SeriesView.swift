//
//  SeriesView.swift
//  Netflix2
//
//  Created by Sal Faris on 30/01/2022.
//

import SwiftUI

struct SeriesView: View {
    
    private func toggleSidebar() { // 2
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        }
    
    let seriesURL: String
    @State var availEpisodes = [episode]()
    @State var loading = true
    
    @State var showError = false
    @State var errorShow = [String]()
    
    var body: some View {
        if loading{
            
            VStack{
                ProgressView()
                    .progressViewStyle(.circular)
                Text("")
                Text("Parsing Episodes...")
                    .font(.footnote)
            }                    .onAppear {
                print("Circular View on!")
                DispatchQueue.global().async {
                    let possibleEpisodes = extractors().newExtractor(url: seriesURL)
                    
                    if possibleEpisodes == nil{
                        showError = true
                        errorShow.append(commonErr.unableToParse)
                        loading = false
                    }else{
                        let eps = possibleEpisodes!.episodes
                        
                        for key in eps.keys{
                            if let episodeStringURL = eps[key]{
                                availEpisodes.append(episode(episodeNumber: key,
                                                             episodeURL: URL(string: episodeStringURL) ?? URL(string: "https://google.com")!))
                            }else{
                                print("Unable to add episode url for key", key)
                            }
                            
                        }
                        
                        
                        availEpisodes = availEpisodes.sorted { ep1, ep2 in
                            Int(ep1.episodeNumber)! < Int(ep2.episodeNumber)!
                        }
                        
                        loading = false
                    }
                    

                }
                
            }
                
        }else if showError{
            ErrorView(error: errorShow[0])
        }else{
            NavigationView{
                ZStack{
                    Color.black
                    List(availEpisodes){episodeItem in
                        if episodeItem.episodeNumber == "1"{
                            Text("")
                        }
                        NavigationLink("Episode " + episodeItem.episodeNumber) {
                            EpisodeView(url: episodeItem.episodeURL.absoluteString)
                        }
                    }
                }

            }.background(Color.black)
                .foregroundColor(.white)
                .toolbar {
                            ToolbarItem(placement: .navigation) {
                                Button(action: toggleSidebar, label: { // 1
                                    Image(systemName: "sidebar.leading")
                                })
                            }
                        }
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(seriesURL: "https://watchseriesfree.co/series/peacemaker-season-1-1630852594")
    }
}



