//
//  EpisodeView.swift
//  Netflix2
//
//  Created by Sal Faris on 29/01/2022.
//

import AVKit
import SwiftUI

struct EpisodeView: View {
    
    let url: String
    
    func getVideoPlayer() -> some View{
        return SwiftUIWebView(viewModel: WebViewModel(link: url))
    }
    
    var body: some View {
        getVideoPlayer()
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(url: "https://bit.ly/swswift")
    }
}
    
