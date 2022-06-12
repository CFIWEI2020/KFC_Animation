//
//  ViewController.swift
//  KFC_Animation
//
//  Created by WEI-YI Wang on 2022/6/12.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {
    
    let player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Making a mask picture as following:
        let imageView = UIImageView (frame: CGRect(x: 40, y: 200, width: 600, height: 180))
        imageView.image = UIImage(named: "1.KFC_Logo_backMak")
        imageView.transform = CGAffineTransform.identity.scaledBy(x: 1.5, y: 1.5)
        
        
        let kfcView = UIView (frame: imageView.frame)
        
        // building a gradient layer
        
        let gradientLayer = CAGradientLayer()
        // 要給漸層框架後才能部署顏色
        gradientLayer.frame = kfcView.frame
        gradientLayer.colors = [UIColor(red: 196/255, green: 18/255, blue: 47/255, alpha: 1.0).cgColor, UIColor.yellow.cgColor]
        
        kfcView.layer.addSublayer(gradientLayer)
        kfcView.mask = imageView
        view.addSubview(kfcView)
        view.backgroundColor = .darkGray
        
        //voice , sound
        let fileURL = Bundle.main.url(forResource: "Andy_neverGiveUp",withExtension: "mp3")!
        let playItem = AVPlayerItem(url: fileURL)
        player.replaceCurrentItem(with: playItem)
        player.play()
        let volumeView = MPVolumeView(frame: CGRect(x: 10, y: 750, width: 300, height: 50))
        view.addSubview(volumeView)
        

        //nug
        let nugCell = CAEmitterCell()
        nugCell.contents = UIImage(named: "2Nug_deMask")?.cgImage
        nugCell.birthRate = 1.5
        nugCell.lifetime = 30
        nugCell.velocity = 300
        nugCell.yAcceleration = 50
        nugCell.scale = 0.3
        nugCell.spin = 0.5
        nugCell.spinRange = 3
        nugCell.emissionRange = CGFloat.pi
        
        //CK
        let legCell = CAEmitterCell()
        legCell.contents = UIImage(named: "3.Leg_deMask")?.cgImage
        legCell.birthRate = 0.5     // 產生的平率
        legCell.lifetime = 30       // 生命週期
        legCell.velocity = 150      // 運轉速度
        legCell.yAcceleration = 40  // y方向的速度
        legCell.scale = 0.2         // 縮放比例
        legCell.spin = 0.7          // 自己旋轉速度
        legCell.spinRange = 2       // 旋轉角度範圍
        legCell.emissionRange = CGFloat.pi
        
        //4s
        let sCell = CAEmitterCell()
        sCell.contents = UIImage(named: "4s")?.cgImage
        sCell.birthRate = 0.5       // 產生（倍數）頻率，默認1.0
        sCell.lifetime = 30         // 生命週期係數, 默認1.0
        sCell.velocity = 300        // 基本速度係數(運轉速度), 默認1.0
        sCell.yAcceleration = 50    // y方向的加速度
        sCell.scale = 0.2           // 縮放比例係數, 默認1.0
        sCell.spin = 0.7            // 自旋轉速度係數, 默認1.0
        sCell.spinRange = 2         // 旋轉角度範圍
        sCell.alphaSpeed = 2        // 透明度在生命周期内的改变速度
        
        
        
        //foodfalling
        
        let foodpool = CAEmitterLayer()
        foodpool.emitterCells = [nugCell,legCell,sCell]
        foodpool.emitterPosition = CGPoint(x: view.bounds.width/2, y: -50)
        foodpool.emitterSize = CGSize(width: view.bounds.width, height: 0)
        foodpool.emitterShape = .line
        view.layer.addSublayer(foodpool)
        view.backgroundColor = .clear
        
        
        
    }


}

