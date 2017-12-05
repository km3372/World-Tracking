//
//  ViewController.swift
//  World Tracking
//
//  Created by kenneth moody on 11/21/17.
//  Copyright © 2017 kenneth moody. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configration)
        self.sceneView.autoenablesDefaultLighting = true
    }

    @IBAction func addButton(_ sender: Any) {
        let node = SCNNode()
        
        let path = UIBezierPath()
        // House Shape
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0.2))
        path.addLine(to: CGPoint(x: 0.2, y: 0.3))
        path.addLine(to: CGPoint(x: 0.4,y: 0.2))
        path.addLine(to: CGPoint(x: 0.4,y: 0))
        let shape = SCNShape(path: path, extrusionDepth: 0.2)
        node.geometry = shape
      
        
        
       // node.geometry = SCNPyramid(width: 0.1, height: 0.1, length: 0.1)
        
       //node.geometry = SCNPlane(width: 0.2, height: 0.2)
        
        //node.geometry = SCNTorus(ringRadius: 0.3, pipeRadius: 0.1)
        
        //node.geometry = SCNTube(innerRadius: 0.2, outerRadius: 0.3, height: 0.5)
        
        //node.geometry = SCNSphere(radius: 0.1)
        
        //node.geometry = SCNCylinder(radius: 0.2, height: 0.2)
        
       // node.geometry = SCNCone(topRadius: 0.1, bottomRadius: 0.3, height: 0.3)
        
        //node.geometry = SCNCapsule(capRadius: 0.1, height: 0.3)
        
        //node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.03)
        node.geometry?.firstMaterial?.specular.contents = UIColor(hue: 0.1333, saturation: 1, brightness: 1, alpha: 1.0) /* #ffcc00 */
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.black
       // let x = randomNumbers(firstNum: -0.3, secondNum: 0.3)
       // let y = randomNumbers(firstNum: -0.3, secondNum: 0.3)
       // let z = randomNumbers(firstNum: -0.3, secondNum: 0.3)
        
        node.position = SCNVector3(0,0,-0.7)
        self.sceneView.scene.rootNode.addChildNode(node)
        
    }
    @IBAction func restButton(_ sender: UIButton) {
        self.restartSession()
    }
    
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes {(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configration, options: [.resetTracking, .removeExistingAnchors])
    }
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

