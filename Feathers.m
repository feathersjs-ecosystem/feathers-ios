#import "Feathers.h"
#import "FeathersService.h"

@interface Feathers() {

}

@property (nonatomic, retain) NSMutableDictionary *registeredServices;

@end


@implementation Feathers


+ (Feathers *)sharedInstance
{
    static Feathers *_sharedInstance = nil;
    
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[Feathers alloc] init];
    });
    
    return _sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        _registeredServices = [[NSMutableDictionary alloc] init];
    }
    return self;
}

+ (void)registerService:(NSString *)name host:(NSString *)host {
    if([Feathers debugLoggingEnabled]) {
        NSLog(@"FEATHERS: Registered Service '%@' at '%@'", name, host);
    }
    FeathersService *todoService = [[FeathersService alloc] initWithBaseURL:[NSURL URLWithString:host] servicePath:name];
    [[Feathers sharedInstance].registeredServices setObject:todoService forKey:name];
}

+ (NSMutableDictionary *)services {
    return [Feathers sharedInstance].registeredServices;
}

+ (BOOL)debugLoggingEnabled {
    return true;
}

@end
