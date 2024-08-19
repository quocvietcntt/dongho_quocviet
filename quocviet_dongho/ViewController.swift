//
//  ViewController.swift
//  quocviet_dongho
//
//  Created by apple on 2024/08/16.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer!
    var dongho:UIView!
    var gio,phut,giay:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        caidatdongho()
        caidatgio()
        laygio()
        laygiay()
        layphut()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(chay), userInfo: nil, repeats: true)
    }
    
    @objc func chay() {
        let calenda = Calendar.current
        let date = Date()
        let gio1 = calenda.component(.hour, from: date)
        let phut1 = calenda.component(.minute, from: date)
        let giay1 = calenda.component(.second, from: date)
        
        let gocgio = (CGFloat(gio1 % 12) + CGFloat(phut1)/60)  * (2 * CGFloat.pi/12)
        let gocphut = (CGFloat(phut1) + CGFloat(giay1)/60)  * (2 * CGFloat.pi/60)
        let gocgiay = (CGFloat(giay1)) * (2 * CGFloat.pi/60)
        UIView.animate(withDuration: 0.5)
        {
            self.gio.transform = CGAffineTransform(rotationAngle: gocgio)
            self.phut.transform = CGAffineTransform(rotationAngle: gocphut)
        }
        UIView.animate(withDuration: 0.1)
        {
            self.giay.transform = CGAffineTransform(rotationAngle: gocgiay)
        }
    }
    
    func caidatdongho() {
        let kichthuoc:CGFloat = 320
        dongho = UIView(frame: CGRect(x: view.frame.width - kichthuoc, y: (view.frame.height - kichthuoc)/2, width: kichthuoc, height: kichthuoc))
        dongho.backgroundColor = .green
        dongho.layer.cornerRadius = kichthuoc/2
        dongho.layer.borderWidth = 1
        dongho.layer.borderColor = UIColor.blue.cgColor
        dongho.center = view.center
        view.addSubview(dongho)
    }
    
    func caidatgio()  {
        let clockradius = dongho.frame.width/2
        let labelradius = clockradius - 30
        for i in 1...12{
            let angle = CGFloat(i)*(2*CGFloat.pi/12) - (CGFloat.pi/2)
            let labelx = dongho.frame.origin.x + dongho.frame.width/2 + labelradius*cos(angle)
            let labely = dongho.frame.origin.y + dongho.frame.height/2 + labelradius*sin(angle)
            
            let label = UILabel()
            label.frame = CGRect(x: labelx-15, y: labely-15, width: 30, height: 30)
            label.text = "\(i)"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 24)
            view.addSubview(label)
        }
    }
    
    func laygio() {
        gio = UIView(frame: CGRect(x: dongho.frame.width/2 - 4, y: dongho.frame.height/2 - 40, width: 8, height: 80))
        gio.backgroundColor = .darkGray
        gio.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        dongho.addSubview(gio)
    }
    
    func layphut() {
        phut = UIView(frame: CGRect(x: dongho.frame.width/2 - 3, y: dongho.frame.height/2 - 60, width: 6, height: 120))
        phut.backgroundColor = .blue
        phut.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        dongho.addSubview(phut)
    }

    func laygiay() {
        giay = UIView(frame: CGRect(x: dongho.frame.width/2 - 1, y: dongho.frame.height/2 - 70, width: 2, height: 140))
        giay.backgroundColor = .red
        giay.layer.anchorPoint = CGPoint(x: 0.5, y: 1.0)
        dongho.addSubview(giay)
    }
}

