# This is a work in progress and is not ready to be used

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
