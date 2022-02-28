//
//  userdefaults.swift
//  Netflix2
//
//  Created by Sal Faris on 30/01/2022.
//

import SwiftUI
import Foundation

fileprivate let defaults = UserDefaults.standard

fileprivate func getAllRecentUrls() -> Array<String>{
    return defaults.object(forKey: "s") as? Array<String> ?? [String]()
}

func User_addValue(link: String){
    var links = getAllRecentUrls()
    if !links.contains(link){
        print("Adding Link!")
        links.append(link)
    }
    
    defaults.set(links, forKey: "s")
}


func User_getRecents() -> [recents]{
    let all = getAllRecentUrls()
    var recentArr = [recents]()
    
    for recent in all{
        recentArr.append(recents(val: recent))
    }
    
    return recentArr
}
