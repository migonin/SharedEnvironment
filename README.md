# SharedEnvironment

Concept of sharing some settings environment for iOS apps.

`Environment` structure contains some settings like API endpoint, API version, feature toggle values and so on:
```swift
public struct Environment {
    public let apiEndpoint: String
    public let someFeature: Bool
    public let someValue: Int
}
```

It has default (or "production") values:
```swift
public enum EnvironmentVariable: String {
    
    case xAPIEndpoint
    case xSomeFeature
    case xSomeValue
}

public extension EnvironmentVariable {
    
    var defaultValue: String {
        switch self {
        case .xAPIEndpoint:
            return "https://prod.api.com"
        case .xSomeFeature:
            return "false"
        case .xSomeValue:
            return "0"
        }
    }
}

```


However you can override it from xCode environment:

<img src="https://github.com/migonin/SharedEnvironment/blob/master/Images/scheme.png?raw=true" width=800>



Or from Settings app, which you can share with your QA team:

<img src="https://github.com/migonin/SharedEnvironment/blob/master/Images/settings.png?raw=true" width="50%">


So you inject test settings into your app safely without tricks with "shake menu" or risk to forget sensetive debug data somewhere inside your binary.
