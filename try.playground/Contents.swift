/*:
 # RemoteSettings Playground (Experimental)
 ## Usage
 Let's assume we want to use the GitHub API to fetch information about the **RemoteSettings** project. More specific we want to store the **url** of the **RemoteSettings** repository for later usage.
 
*/

import Foundation
import PlaygroundSupport

let apiUrl = URL(string:"https://api.github.com/repos/tbointeractive/remotesettings")!

//: ### Basic
//: 1. Create a subclass of **RemoteSettings**
final class GitHubRemoteSettings: RemoteSettings {
    struct GitHubProjectRepresentation: Codable {
        let id: Int
        let url: URL
    }
    
    var repoUrl: URL?
//: 2. Implement the method ``` open func update(_ data: Data) throws``` and process the fetched data.   After you gained your designated information from the data, we recommend you to store that as instance member of that subclass
    open override func update(_ data: Data) throws {
        let decoder = JSONDecoder()
        let parsed = try decoder.decode(GitHubProjectRepresentation.self, from: data)
        repoUrl = parsed.url
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

//: 3. Create an object of the subclass ```SubclassOfRemoteSettings(remote: apiUrl)```
let remoteSettings = GitHubRemoteSettings(remote: apiUrl)
//: 4. Use that object to fetch data by calling ```public func update(finished: Completion?)```

remoteSettings.update() { error in
    if error == nil, let url = remoteSettings.repoUrl {
        print("finsihed, url is \(url)")
    }
    PlaygroundPage.current.finishExecution()
}
