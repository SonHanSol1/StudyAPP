//
//  ViewController.swift
//  StudyAPP
//
//  Created by 손한솔 on 2022/01/10.
//

import UIKit

class ViewController: UIViewController {

    var randomValue: Int = 0
    var tryCount: Int = 0
    // IBOutlet: 스토리보드 위에 올려져 있는 요소와 연결하는 어로테이션
    @IBOutlet weak var  slider: UISlider!
    @IBOutlet weak var  tryCountLable: UILabel!
    @IBOutlet weak var  sliderValueLable: UILabel!
    @IBOutlet weak var  minimumValueLabel: UILabel!
    @IBOutlet weak var  maximumValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }

    // IBAction: 이벤트에 반응하는 액션
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLable.text = String(integerValue)
        /* slider는 Float 타입, 라벨텍스트는 String타입, 이 둘을 변환해도 되지만 보기 좋게 하기 위해 Int형으로 변환하고
         그 후에 Int형을 String으로 변환하는 선택을 한 것임. */
    }

    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        // Int형으로 변환을 해서 실수타입의 소수점 날리고 slider는 Float타입이기에 소수점을 날린 상태로 변환을 해서 정확한 위치에 놓을 수 있게 하는 것
        tryCount = tryCount + 1
        tryCountLable.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            print("YOU HIT!")
            reset()
            return // return을 통해 5번째 맞출 때 HIT과 LOSE가 같이 출력되는 문제를 해결
        } else if tryCount >= 5 {
            print("YOU LOSE...")
            reset()
            return
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    func reset() {
        print("Reset")
        randomValue = Int.random(in: 0...30) // ...은 범위 연산자 ~의 역할 ..<은 미만
        print(randomValue)
        tryCount = 0
        tryCountLable.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLable.text = "15"
    }
}

