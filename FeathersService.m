#import "FeathersService.h"
#import "Feathers.h"

@implementation FeathersService {

    NSString *_baseUrl;
    NSString *_servicePath;
}

- (instancetype)init {
    return [self initWithBaseURL:nil servicePath:@""];
}

- (instancetype)initWithBaseURL:(NSURL *)url servicePath:(NSString *)servicePath {
    self = [super init];
    if (!self) {
        return nil;
    }

    // Ensure terminal slash for baseURL path, so that NSURL +URLWithString:relativeToURL: works as expected
    if ([[url path] length] > 0 && ![[url absoluteString] hasSuffix:@"/"]) {
        url = [url URLByAppendingPathComponent:@""];
    }
    _servicePath = servicePath;
    _baseUrl = [NSString stringWithFormat:@"%@/%@", url.description, servicePath];

    return self;
}

- (void)find:(NSDictionary *)params
  completion:(FeathersFindCompletionBlock)completionHandler {

    NSURL * url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", _baseUrl, [self queryString:params]]];
    
    if([Feathers debugLoggingEnabled]) {
        NSLog(@"FEATHERS FIND: %@\nParams:%@", url, params);
    }
    
    NSURLSessionDataTask * dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error) {
            NSLog(@"Error with FIND against %@: %@", url, error);
            completionHandler(nil, error);
        } else {
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if (completionHandler) {
                completionHandler(array, nil);
            }
        }
    }];
    [dataTask resume];
}

- (void)get:(NSString *)objectId
     params:(NSDictionary *)params
 completion:(FeathersGetCompletionBlock)completionHandler {
    NSURLSession * session = [NSURLSession sharedSession];
    NSURL * url = [NSURL URLWithString: [NSString stringWithFormat:@"%@/%@%@", _baseUrl, objectId, [self queryString:params]]];
    if([Feathers debugLoggingEnabled]) {
        NSLog(@"FEATHERS GET: '%@' | %@\nParams:%@", objectId, url, params);
    }
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(error) {
            NSLog(@"Error with GET against %@: %@", url, error);
            completionHandler(nil, error);
        } else {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            if (completionHandler) {
                completionHandler(dict, nil);
            }
        }
    }];
    [dataTask resume];
}

- (void)update:(NSString *)objectId
          data:(NSDictionary *)data
        params:(NSDictionary *)params
    completion:(FeathersUpdateCompletionBlock)completionHandler {

}

- (NSString *)URLEncodedString:(NSString *)theString
{
    __autoreleasing NSString *encodedString;
    NSString *originalString = (NSString *)theString;
    encodedString = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                          NULL,
                                                                                          (__bridge CFStringRef)originalString,
                                                                                          NULL,
                                                                                          (CFStringRef)@":!*();@/&?#[]+$,='%’\"",
                                                                                          kCFStringEncodingUTF8
                                                                                          );
    return encodedString;
}

- (NSString *)queryString:(NSDictionary *)dict
{
    NSMutableArray *pairs = [NSMutableArray array];
    for (NSString *key in [dict keyEnumerator])
    {
        id value = [dict objectForKey:key];
        NSString *escapedValue = [self URLEncodedString:value];
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", key, escapedValue]];
    }
    
    if(pairs.count == 0)
        return @"";
    
    return [NSString stringWithFormat:@"?%@", [pairs componentsJoinedByString:@"&"]];
}



@end