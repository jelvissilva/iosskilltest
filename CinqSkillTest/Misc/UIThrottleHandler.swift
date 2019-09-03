import Foundation

class UIThrottleHandler {
    let interval: Int64
    //let block: dispatch_block_t
    
    fileprivate var source: DispatchSource?
    fileprivate var delegate: UIThrottleHandlerProtocol?
    fileprivate var execution: DefaultCallback?
    
    /**
     Initialize a new instance of BUIThrotthleHandler.
     
     - parameter interval: Interval in miliseconds
     - parameter delegate: Code to be executed.
     
     - returns: A new instance of BUIThrottleHandler
     */
    init(interval: Int64, delegate: UIThrottleHandlerProtocol) {
        self.interval = interval
        self.delegate = delegate
    }
    
    init(interval: Int64, execute: @escaping UIDefaultCallback) {
        self.interval = interval
        self.execution = execute
    }
    
    /**
     Initialize a new instance of BUIThrotthleHandler.
     
     - parameter interval: interval in miliseconds
     
     - returns: A new instance of BUIThrottleHandler
     */
    init(milisecondsInternval interval: Int64) {
        self.interval = interval * Int64(NSEC_PER_MSEC)
    }
    
    /**
     Execute throttled delegate.
     */
    func fire() {
        if let _ = self.delegate {
            fireWithDelegate()
        }
        
        if let _ = self.execution {
            fireWithClousure()
        }
    }
    
    func fire(_ target: @escaping UIDefaultCallback) {
        if let _ = source { return }
        
        source = nil
        
        let dispatchSource = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: 0), queue: DispatchQueue.main)
        let dispatchTime = DispatchTime.now() + Double(interval) / Double(NSEC_PER_SEC)
        dispatchSource.schedule(deadline: dispatchTime)
        
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            
            dispatchSource.setEventHandler { [weak self] in
                target()
                
                if let source = self?.source {
                    source.cancel()
                }
                
                self?.source = nil
            }
            
            dispatchSource.resume()
            self.source = dispatchSource as? DispatchSource
        }
    }
    
    fileprivate func fireWithClousure() {
        if let _ = source {
            return
        }
        
        guard let execution = self.execution else {
            return
        }
        
        source = nil
        
        let dispatchTime = DispatchTime.now() + Double(interval) / Double(NSEC_PER_SEC)
        
        let s = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: 0), queue: DispatchQueue.main)
        s.schedule(deadline:dispatchTime)
        
        execution()
        s.setEventHandler { [weak self] in
            if let source = self?.source {
                source.cancel()
            }
            self?.source = nil
        }
        s.resume()
        self.source = s as? DispatchSource
    }
    
    fileprivate func fireWithDelegate() {
        
        guard let delegate = self.delegate else {
            return
        }
        
        source = nil
        
        let when = interval * Int64(NSEC_PER_SEC)
        let s = DispatchSource.makeTimerSource(flags: DispatchSource.TimerFlags(rawValue: 0), queue: DispatchQueue.main)
        let time = DispatchTime.now() + Double(when) / Double(NSEC_PER_SEC)
        //s.setTimer(start: time, interval: DispatchTime.distantFuture, leeway: 0);
        
        delegate.fire?()
        
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            s.setEventHandler { [weak self] in
                if let source = self?.source {
                    source.cancel()
                }
                
                self?.source = nil
            }
            
            s.resume()
            self.source = s as? DispatchSource
            
        }
        
        
        
    }
}
