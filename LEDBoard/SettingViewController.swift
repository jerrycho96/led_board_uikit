//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 조영진 on 2022/04/07.
//

import UIKit

protocol LEDBoardSettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!

    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!

    // 프로토콜에 접근하기 위해 프로퍼티 추가
    weak var delegate: LEDBoardSettingDelegate?
    // changedSetting에 전달하기 위한 프로퍼티
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    var ledText: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        // 초기화
        self.configureView()
    }
    
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        if sender == self.yellowButton {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.purpleButton {
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        } else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }

    @IBAction func tabBackGroundColorButton(_ sender: UIButton) {
        if sender == self.blackButton {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.blueButton {
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        } else {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
    }

    @IBAction func tabSaveButton(_ sender: UIButton) {
        // delegate 프로퍼티 접근 후 사용
        self.delegate?.changedSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor)
        // 이전 화면으로
        self.navigationController?.popViewController(animated: true)
    }

    private func changeTextColor(color: UIColor) {
        self.yellowButton.alpha = color == UIColor.yellow ? 1.0 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1.0 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1.0 : 0.2
    }

    private func changeBackgroundColor(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1.0 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1.0 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1.0 : 0.2
    }
}
