//
//  types.swift
//  Netflix2
//
//  Created by Sal Faris on 30/01/2022.
//

import SwiftUI
import Foundation

struct recents: Identifiable{
    let id = UUID()
    let val: String
}

struct episode: Identifiable{
    var id = UUID()
    let episodeNumber: String
    let episodeURL: URL
}

struct series : Identifiable{
    var id = UUID()
    var episodes: Dictionary<String, String> = [:]
    var seriesName: String
    var seriesEpisodes: Int
    var seriesSeason: String
}

struct commonErr{
    static let badDomain = "Invalid Domain"
    static let unableToParse = "Unable to parse"
}

