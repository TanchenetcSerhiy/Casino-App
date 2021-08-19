//
//  Storyboard+Utils.swift
//  CasinoApp
//
//  Created by Serhiy Tanchenetc on 18.08.2021.
//

import UIKit

enum StoryboardFlow: String {
    case main = "Main"
}

enum StoryboardControllerID: String {
    case gameDetails = "GameDetailsViewController"
}
    
extension UIStoryboard {
    
    class func get(flow: StoryboardFlow) -> UIStoryboard {
        return UIStoryboard(name: flow.rawValue, bundle: nil)
    }
    
    class func instantiateFlow(_ flow: StoryboardFlow) -> UIViewController {
        let flowSB = UIStoryboard.get(flow: flow)
        let initialVC = flowSB.instantiateInitialViewController()!
        
        return initialVC
    }
    
    func get(controller controllerID: StoryboardControllerID) -> UIViewController {
        return self.instantiateViewController(withIdentifier: controllerID.rawValue)
    }
    
}
