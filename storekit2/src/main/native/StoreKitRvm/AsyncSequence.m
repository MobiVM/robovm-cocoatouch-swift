//
//  AsyncSequence.m
//  StoreKitRvm
//

#import "AsyncSequence.h"
#import <StoreKitRvm/StoreKitRvm-Swift.h>

///
/// RvmAsyncIterator
///
API_AVAILABLE(ios(13))
@interface RvmAsyncIterator<T: NSObject*>()
@property (nonatomic) RvmTask* (^nextProducer) (void (^_Nonnull competionHandler)(T _Nullable, NSError* _Nullable));
@end

/// Wrapper for iterator. Underlaying iterator should be captured in `nextProducer` block
API_AVAILABLE(ios(13))
@implementation RvmAsyncIterator

- (id) initWithNextProducer: (RvmTask* (^) (void (^_Nonnull competionHandler)(NSObject* _Nullable, NSError* _Nullable))) nextProducer {
    if (self = [super init]) {
        self.nextProducer = nextProducer;
    }
    return self;
}

- (RvmTask*)nextWithCompletionHandler:(void (^ _Nonnull)(NSObject* _Nullable, NSError* _Nullable)) completionHandler {
    return self.nextProducer(completionHandler);
}

@end

///
/// RvmAsyncSequence
///
@interface RvmAsyncSequence<T: NSObject*>()
@property (nonatomic) RvmAsyncIterator<T>* (^_Nonnull iteratorProducer)(void);
@end

@implementation RvmAsyncSequence
-(id) initWithIteratorProducer: (RvmAsyncIterator<NSObject*>*(^_Nonnull)(void)) producer {
    if (self =  [super init]) {
        self.iteratorProducer = producer;
    }
    return self;
}

-(RvmAsyncIterator<NSObject*> *) makeAsyncIterator {
    return self.iteratorProducer();
}
@end
