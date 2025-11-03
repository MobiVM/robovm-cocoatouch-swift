//
//  AsyncSequence.h
//  StoreKitRvm
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 AsyncSequence to ObjC wrapper that supports lightweight generics
 Usage:
 
 struct StringSequence: AsyncSequence {
     typealias AsyncIterator = StringIterator
     typealias Element = String
     func makeAsyncIterator() -> StringIterator { StringIterator() }

     struct StringIterator: AsyncIteratorProtocol {
         private var count: Int = 5
         mutating func next() async -> String? { "infinite" }
     }
 }
 
 let seq = StringSequence()
 let objCSeq: RvmAsyncSequence<NSString> = seq.toRvm { $0 as NSString? }

 // check toRvm() ext for details
 */

@class RvmTask;
/// Wrapper for iterator. Underlaying iterator should be captured in `nextProducer` block
@interface RvmAsyncIterator<T: NSObject*>: NSObject
- (instancetype)init NS_UNAVAILABLE;
- (id) initWithNextProducer: ( RvmTask* (^ _Nonnull) (void (^ _Nonnull competionHandler)(T _Nullable, NSError* _Nullable)) )  nextProducer;
- (RvmTask*)nextWithCompletionHandler:(void (^ _Nonnull)(T _Nullable, NSError* _Nullable)) completionHandler;
@end

/// Wrapper for Swift AsyncSequence that exposes lighweight generic interface
@interface RvmAsyncSequence<T: NSObject*>: NSObject
- (instancetype)init NS_UNAVAILABLE;
/// @param producer -- producer of Iterator wraper (of specified T type).
///                  it should create a new makeAsyncIterator() and wrap it with RvmAsyncIterator<T>
-(id) initWithIteratorProducer: (RvmAsyncIterator<T>*(^_Nonnull)(void)) producer;
-(RvmAsyncIterator<T>*) makeAsyncIterator;
@end

NS_ASSUME_NONNULL_END
