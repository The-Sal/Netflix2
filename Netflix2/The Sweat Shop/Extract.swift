//
//  python extracts.swift
//  Netflix2
//
//  Created by Sal Faris on 30/01/2022.
//

import Foundation

fileprivate struct executables{
    static let entrypoint = Bundle.main.url(forResource: "entrypoint", withExtension: "")
    static let extractor = Bundle.main.url(forResource: "extractor", withExtension: "")
}

fileprivate func processPipe(pipe: Pipe) -> String?{
    do {
        let ReadPipe = try pipe.fileHandleForReading.readToEnd()
        let stringRead = String(data: ReadPipe!, encoding: .utf8)
        return stringRead
    } catch  {
        return nil
    }
}

class extractors{
    
    func newExtractor(url: String) -> series?{
        let pipe = Pipe()
        let proc = Process()
        let ePipe = Pipe()
        
        

        
        proc.executableURL = executables.extractor!
        proc.arguments = [url]
        proc.standardOutput = pipe
        proc.standardError = ePipe
        
        var output: series
        
        do {
            try proc.run()
            proc.waitUntilExit()
            
            let response = try pipe.fileHandleForReading.readToEnd()
            
            if response == nil{
                return nil
            }
            
            let stringResponse = String(data: response!, encoding: .utf8)
            
            print(stringResponse!)
            
            let Dictionary = try JSONSerialization.jsonObject(with: response!, options: [.fragmentsAllowed, .json5Allowed, .json5Allowed]) as? Dictionary<String, String>
            
            User_addValue(link: url)
            
            var showName = String()
            var season = String()
            var episodes = Int()
            
            var episodeDic: Dictionary<String, String> = [:]
            for item in Dictionary!.keys{
                let isInt = Int(item)
                if isInt != nil{
                    // valid number like 1,2,3
                    let value = Dictionary![item]
                    episodeDic[item] = value!
                    
                    print("Adding Episode: \(item)")
                    continue
                }
                
                
                switch item{
                case "showName":
                    showName = Dictionary![item]!
                
                case "showSeason":
                    season = Dictionary![item]!
                
                case "episodes":
                    episodes = Int(Dictionary![item]!)!
                    
                default:
                    print("Unknown Type: \(item)")
                }
            
            }
            
            output = series(episodes: episodeDic, seriesName: showName, seriesEpisodes: episodes, seriesSeason: season)
            
            return output
            
            
        } catch  {
            print("Error: \(error)")
        }
        
        
        return nil
        
    }
    
    
}
