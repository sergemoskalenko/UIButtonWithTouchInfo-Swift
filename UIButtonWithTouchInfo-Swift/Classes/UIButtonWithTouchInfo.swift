//
//  UIButtonWithTouchInfo
//
//  Created by Serge Moskalenko on 25.07.17.
//  Copyright © 2017 Serge Moskalenko. All rights reserved.
//  skype:camopu-ympo, http://camopu.rhorse.ru/ios
//

import UIKit

public
enum UIButtonWithTouchInfoAction : Int {
    case began
    case moved
    case cancelled
    case ended
}


public protocol UIButtonWithTouchInfoProtocol :NSObjectProtocol {
    func uiButton(_ uiButtonWithTouchInfo: UIButtonWithTouchInfo, didTouch action: UIButtonWithTouchInfoAction)
}

public class UIButtonWithTouchInfo: UIButton {
    public var isClearForTouch: Bool = false
    public var touchPoint = CGPoint.zero
    public var touchPart = CGPoint.zero
    // normalized
    public var touchPointCurrent = CGPoint.zero
    public var touchPartCurrent = CGPoint.zero
    // normalized
    public var delegate: UIButtonWithTouchInfoProtocol?
    
    public var isTouched: Bool = false
    
    public override init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        
        setUp()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
        
    }
    
    func setUp() {
        isClearForTouch = true
    }
    
    func callDelegate(_ touches: Set<UITouch>, action: UIButtonWithTouchInfoAction) {
        touchPointCurrent = ((touches.first)?.location(in: self))!
        if frame.size.width > 0 && frame.size.height > 0 {
            touchPartCurrent = CGPoint(x: touchPointCurrent.x / frame.size.width, y: touchPointCurrent.y / frame.size.height)
        }
        else {
            touchPartCurrent = CGPoint.zero
        }
        if (delegate?.responds(to: Selector(("UIButtonWithTouchInfo:didTouchAction:"))))! {
            delegate?.uiButton(self, didTouch: action)
        }
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        callDelegate(touches, action: .began)
        isTouched = true
        super.touchesBegan(touches, with: event)
        if isClearForTouch {
            next?.touchesBegan(touches, with: event)
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        callDelegate(touches, action: .moved)
        super.touchesMoved(touches, with: event)
        if isClearForTouch {
            next?.touchesMoved(touches, with: event)
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        callDelegate(touches, action: .cancelled)
        isTouched = false
        touchPart = CGPoint.zero
        touchPoint = touchPart
        super.touchesCancelled(touches, with: event)
        if isClearForTouch {
            next?.touchesCancelled(touches, with: event)
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        callDelegate(touches, action: .ended)
        if isTouched {
            touchPoint = ((touches.first)?.location(in: self))!
            if frame.size.width > 0 && frame.size.height > 0 {
                touchPart = CGPoint(x: touchPoint.x / frame.size.width, y: touchPoint.y / frame.size.height)
            }
            else {
                touchPart = CGPoint.zero
            }
        }
        isTouched = false
        super.touchesEnded(touches, with: event)
        if isClearForTouch {
            next?.touchesEnded(touches, with: event)
        }
    }
}


