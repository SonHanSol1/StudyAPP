//
//  ViewController.swift
//  StudyAPP
//
//  Created by 손한솔 on 2022/01/10.
//

import UIKit

class ViewController: UIViewController {

    // IBOutlet: 스토리보드 위에 올려져 있는 요소와 연결하는 어로테이션
    @IBOutlet weak var  slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // IBAction: 이벤트에 반응하는 액션
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }

    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        
    }
}

