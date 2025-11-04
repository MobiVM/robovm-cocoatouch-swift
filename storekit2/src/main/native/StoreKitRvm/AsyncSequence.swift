//
//  AsyncSequence.swift
//  StoreKitRvm
//


@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
extension AsyncSequence {
    /// extention that converts swith AsyncSequence into ObjC wrapper
    /// @param elementConverter -- converts Swift element into acceptable ObjC one 
    func toRvm<R: NSObject>(elementConverter: @escaping (Self.Element?) -> R?) -> RvmAsyncSequence<R> {
        let res = RvmAsyncSequence<R> {
            var it = makeAsyncIterator()
            return RvmAsyncIterator<R> { completionHandler in
                Task.detached {
                    do { completionHandler(await elementConverter(try it.next()), nil) }
                    catch let e { completionHandler(nil, e) }
                    return
                }.toRvm()
            }
        }
        return res
    }
}
