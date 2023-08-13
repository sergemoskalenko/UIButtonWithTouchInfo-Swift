//
//  MSVViewController
//  UIButtonWithTouchInfo
//
//  Created by sergemoskalenko on 08/02/2017.
//  Copyright (c) 2017 sergemoskalenko. All rights reserved.
//  skype:camopu-ympo
//

import UIKit
import UIButtonWithTouchInfo_Swift

class MSVViewController: UIViewController, UIButtonWithTouchInfoProtocol {
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var buttonWithInfoView: UIButtonWithTouchInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonWithInfoView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func button(withInfoAction button: UIButtonWithTouchInfo) {
        let pointPart: CGPoint = button.touchPart
        print("(\(pointPart.x),\(pointPart.y))")
        if pointPart.y < 0.2 {
            counterLabel.text = "1"
        }
        else if pointPart.y > 0.8 {
            counterLabel.text = "100"
        }
        else if pointPart.x < 0.5 {
            var cnt = Int(CInt(counterLabel.text!)!)
            cnt -= 1
            if cnt < 1 {
                cnt = 100
            }
            counterLabel.text = "\(cnt)"
        }
        else if pointPart.x > 0.5 {
            var cnt = Int(CInt(counterLabel.text!)!)
            cnt += 1
            if cnt > 100 {
                cnt = 1
            }
            counterLabel.text = "\(cnt)"
        }
        
    }
    
    func uiButton(_ uiButtonWithTouchInfo: UIButtonWithTouchInfo, didTouch action: UIButtonWithTouchInfoAction) {
        print("Action: \(action)")
        let point: CGPoint = uiButtonWithTouchInfo.touchPointCurrent
        print("(\(point.x),\(point.y))")
        let point2: CGPoint = uiButtonWithTouchInfo.touchPartCurrent
        print("(\(point2.x),\(point2.y))")
        infoLabel.text = String(format: " XY: (%0.f,%0.f) norm: (%0.2f,%0.2f)", point.x, point.y, point2.x, point2.y)
    }
}


