#import <Foundation/Foundation.h>

typedef void (^FeathersFindCompletionBlock) (NSArray *results, NSError *error);
typedef void (^FeathersGetCompletionBlock) (id result, NSError *error);
typedef void (^FeathersUpdateCompletionBlock) (id result, NSError *error);

@protocol FeathersServiceProtocol
    @required
    - (void)find:(NSDictionary *)params
      completion:(FeathersFindCompletionBlock)completionHandler;

    - (void)get:(NSString *)objectId
         params:(NSDictionary *)params
    completion:(FeathersGetCompletionBlock)completionHandler;

@end


@interface FeathersService : NSObject <FeathersServiceProtocol>

- (instancetype)initWithBaseURL:(NSURL *)url servicePath:(NSString *)servicePath;

@end