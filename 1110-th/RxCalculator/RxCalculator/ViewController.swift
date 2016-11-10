//
//  ViewController.swift
//  RxCalculator
//
//  Created by Nikolas Burk on 09/11/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var operationSegmentedControl: UISegmentedControl!
    @IBOutlet weak var firstValueTextField: UITextField!
    @IBOutlet weak var secondValueTextField: UITextField!
    @IBOutlet weak var operationLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    let calculator = Calculator()
    let disposeBag = DisposeBag()
    
    // MARK: View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an observable for the first text field - we watch what is being typed into the text field and convert it to a string
        let firstValueObservable: Observable<Int> = firstValueTextField.rx.text.map { string in
            return Int(string!)!
        }
        
        // create an observable for the second textfield - we watch what is being typed into the second text field and convert it to a string.
        let secondValueObservable: Observable<Int> = secondValueTextField.rx.text.map { string in
            return Int(string!)!
        }
        
        // segmented observable
        let segmentControlObservable: Observable<Calculator.Operation> = operationSegmentedControl.rx.value.map {
            // value received is value
            value in
            return Calculator.Operation(rawValue: value)!
        }
        
        segmentControlObservable.map{
            operation in
            return self.calculator.sign(for: operation)
            }.bindTo(operationLabel.rx.text).addDisposableTo(disposeBag)
        
        
        // combine both vallues being return from both observables
        
        let combineValuesObservable: Observable<Int> = Observable.combineLatest(firstValueObservable, secondValueObservable, segmentControlObservable) { first, second, segment in
            switch segment {
            case .addition:
                return self.calculator.add(a: first, b: second)
            case .subtraction:
                return self.calculator.subtract(a: first, b: second)
            }
        }
        // bind the value to the uilabel
        let resultObservable: Observable<String> = combineValuesObservable.map{ (result: Int) in
            return String(result)
        }
        
        // here we bind the value to the uilabel
        resultObservable.bindTo(resultLabel.rx.text)
    }
    
}

