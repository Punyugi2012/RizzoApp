//
//  LoadingScene.swift
//  RizzoApp
//
//  Created by punyawee  on 28/7/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import SpriteKit
import UIKit


class LoadingScene: SKScene {
    
    var rizzoFrames = [SKTexture]()
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = (AppManager.shared.currentTheme?.viewBackgroundColor)!
        var frames = [SKTexture]()
        let rizzoAtlas = SKTextureAtlas(named: "Sprites")
        for index in 0...25 {
            let textureName = "frame_\(index)"
            let texture = rizzoAtlas.textureNamed(textureName)
            frames.append(texture)
        }
        rizzoFrames = frames
        run()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func run() {
        let texture = rizzoFrames[0]
        let rizzo = SKSpriteNode(texture: texture)
        rizzo.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        rizzo.size = self.frame.size
        rizzo.run(SKAction.repeatForever(SKAction.animate(with: rizzoFrames, timePerFrame: 0.03, resize: false, restore: true)))
        self.addChild(rizzo)
    }
}
