#import <Foundation/Foundation.h>

@interface Feathers : NSObject
+ (Feathers *)sharedInstance;
+ (void)registerService:(NSString *)name host:(NSString *)host;
+ (NSMutableDictionary *)services;
+ (BOOL)debugLoggingEnabled;
@end
