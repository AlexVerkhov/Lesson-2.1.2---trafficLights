//
//  ViewController.swift
//  Lesson 2.1.2 - trafficLights
//
//  Created by Алексей Верховых on 03.03.2022.
//

import UIKit

enum TrafficLightState {
    case red
    case yellow
    case green
    case off
}

class TrafficLight {
    private var redLightHanler = UIView()
    private var yellowLightHandler = UIView()
    private var greenLightHandler = UIView()
    private var controlButton = UIButton()
    
    private var currentLight = TrafficLightState.off
    
    func linkAndReset(
        redLightHandler: UIView,
        yellowLightHandler: UIView,
        greenLightHandler: UIView,
        controlButton: UIButton
    ) {
        self.redLightHanler = redLightHandler
        self.yellowLightHandler = yellowLightHandler
        self.greenLightHandler = greenLightHandler
        self.controlButton = controlButton
        
        controlButton.configuration?.title = "START"
        
        setDefaultLights()
        currentLight = TrafficLightState.off
    }
    
    func setDefaultLights() {
        redLightHanler.layer.opacity = 0.3
        greenLightHandler.layer.opacity = 0.3
        yellowLightHandler.layer.opacity = 0.3
    }
    
    func nextLight() {
        setDefaultLights()
        switch currentLight {
        case .red:
            yellowLightHandler.layer.opacity = 1
            currentLight = TrafficLightState.yellow
        case .yellow:
            greenLightHandler.layer.opacity = 1
            currentLight = TrafficLightState.green
        case .green, .off:
            redLightHanler.layer.opacity = 1
            currentLight = TrafficLightState.red
        }
        
        controlButton.configuration?.title = "NEXT"
    }
}




class ViewController: UIViewController {
    @IBOutlet weak var redLightView: UIView!
    @IBOutlet weak var yellowLightView: UIView!
    @IBOutlet weak var greenLightView: UIView!
    @IBOutlet weak var trafficControlButton: UIButton!
    
    private var trafficLight = TrafficLight()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redLightView.layer.cornerRadius = redLightView.layer.frame.height / 2
        yellowLightView.layer.cornerRadius = yellowLightView.layer.frame.height / 2
        greenLightView.layer.cornerRadius = greenLightView.layer.frame.height / 2
        
        trafficLight.linkAndReset(
            redLightHandler: redLightView,
            yellowLightHandler: yellowLightView,
            greenLightHandler: greenLightView,
            controlButton: trafficControlButton
        )

        trafficLight.setDefaultLights()
    }

    @IBAction func trafficControlButtonClick() {
        trafficLight.nextLight()
    }
    
}

