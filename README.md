# This project is no longer under development. For a newer iOS client see [feathers-swift](https://github.com/feathersjs-ecosystem/feathers-swift)

# feathers-ios-client
Feathers service client for iOS

### Register a service
#### Typically in your app delegate
```objective-c
[Feathers registerService:@"todos" host:@"http://localhost:3000"];
```

#### Use the service in your app

```objective-c
FeathersService *todoService = Feathers.services[@"todos"];

[todoService find:@{@"name" : @"task 1"}
       completion:^(NSArray *results, NSError *error) {        
    NSLog(@"%@", results);
}];
```
