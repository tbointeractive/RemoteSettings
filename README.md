# RemoteSettings
[![Build Status](https://travis-ci.org/tbointeractive/RemoteSettings.svg?branch=develop)](https://travis-ci.org/tbointeractive/RemoteSettings)


**RemoteSettings** is a framework that helps you to fetch remote data and to store them into a specific data structure.

## Requirements
* iOS 8.0+
* Xcode 9.0+
* Swift 4.0+

## Installation
### CocoaPods
You can use [CocoaPods](https://cocoapods.org) to install **RemoteSettings**. Add the following command to your Podfile:

```
pod 'RemoteSettings', '~> 1.0'
```

Then run `pod install`. Use `import RemoteSettings` to import the Framework into your SourceFiles.

## Usage
***Experimental: We also offer a Playground as documentation, check it out :). And make sure "Show Rendered Markdown" is active.***

Let's assume we want to use the GitHub API to fetch information about the **RemoteSettings** project. More specific we want to store the **url** of the **RemoteSettings** repository for later usage.
```swift
let apiUrl = URL(string:"https://api.github.com/repos/tbointeractive/remotesettings")!
```

### Basic
1. Create a subclass of **RemoteSettings**
2. Implement the method ``` open func update(_ data: Data) throws``` and process the fetched data  
   After you gained your designated information from the data, we recommend you to store that as instance member of that subclass
3. Create an object of the subclass ```SubclassOfRemoteSettings(remote: apiUrl)```
4. Use that object to fetch data by calling ```public func update(finished: Completion?)```

***PseudoCode:***
```swift
final class GitHubRemoteSettings: RemoteSettings {
  var repoUrl: URL?

  open override func update(_ data: Data) throws {
    self.repoUrl = // parse data (in this case this is some json), extract the repoUrl and store in member variable
  }
}

let remoteSettings = GitHubRemoteSettings(remote: apiUrl)
remoteSettings.update() { error in
  // error handling
}

// after an update your designated data is stored to repoUrl
remoteSettings.repoUrl
```

### JSONRemoteSettings
JSONRemoteSettings is handy if you need to handle with JSON data, like we had to do in our previous section.
1. Create a subclass of **JSONRemoteSettings**
2. Implement the methods ```open func update(_ data: [AnyHashable: Any]) throws``` and ```open func update(_ data: [Any]) throws```  
   Those are the callbacks for your already parsed JSON data. Those methods are mutex exclusive, so either `update(_ data: [AnyHashable: Any])` or `update(_ data: [Any])` is called.
3. Create an object of the subclass ```SubclassOfJSONRemoteSettings(remote: apiUrl)```
4. Use that object to fetch data by calling ```public func update(finished: Completion?)```


## Advanced Usage
### Fallback Data
TBD 👩‍💻
### DataFetcher
TBD 🙆
### DataStorage
TBD 🙋
