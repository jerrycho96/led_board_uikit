//
//  ViewController.swift
//  LEDBoard
//
//  Created by 조영진 on 2022/04/04.
//

import UIKit

class ViewController: UIViewController, LEDBoardSettingDelegate {
    
    @IBOutlet weak var ledLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ledLabel.textColor = .yellow
    }

    // 뷰를 그리기 전에 이전 뷰에서 데이터를 받아온다
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController {
            settingViewController.delegate = self
            settingViewController.ledText = self.ledLabel.text
            settingViewController.textColor = self.ledLabel.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
        
    }

    // LEDBoardSettingDelegate 프로토콜로 인한 함수 필수 사용
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.ledLabel.text = text
        }
        self.ledLabel.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
}

