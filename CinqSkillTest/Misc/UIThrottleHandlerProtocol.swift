protocol UIThrottleHandlerProtocol {
    var fire: (() -> Void)? { get }
}
