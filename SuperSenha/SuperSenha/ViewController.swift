//
//  ViewController.swift
//  SuperSenha
//
//  Created by Daivid Vasconcelos Leal on 19/08/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfNumberOfCharacters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swSpecialCharacters: UISwitch!
    @IBOutlet weak var swCaptitalLetters: UISwitch!
    
    @IBOutlet weak var lbErrorQtdSenha: UILabel!
    @IBOutlet weak var lbErrorTotalCaracter: UILabel!
    
    @IBOutlet weak var btPasswordGenerate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordsViewController = segue.destination as! PasswordViewController
        
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordsViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCharacters = Int(tfNumberOfCharacters.text!) {
            passwordsViewController.numberOfCharacters = numberOfCharacters
        }
        passwordsViewController.useNumbers = swNumbers.isOn
        passwordsViewController.useCapitalLetters = swCaptitalLetters.isOn
        passwordsViewController.useLetters = swLetters.isOn
        passwordsViewController.useSpecialCharacters = swSpecialCharacters.isOn
        
        view.endEditing(true)
    }
    
    @IBAction func acaoLetrasMinusculas(_ sender: UISwitch) {
        if (!sender.isOn && !swNumbers.isOn  && !swCaptitalLetters.isOn && !swSpecialCharacters.isOn){
           isButtonEnable(isEnable: false)
        }else{
           isButtonEnable(isEnable: true)
        }
    
    }

    @IBAction func acaoNumeros(_ sender: UISwitch) {
        if (!sender.isOn && !swLetters.isOn  && !swCaptitalLetters.isOn && !swSpecialCharacters.isOn){
           isButtonEnable(isEnable: false)
        }else{
            isButtonEnable(isEnable: true)
        }
    }
    
    @IBAction func acaoLetrasMaiusculas(_ sender: UISwitch) {
        if (!sender.isOn && !swNumbers.isOn  && !swLetters.isOn && !swSpecialCharacters.isOn){
           isButtonEnable(isEnable: false)
        }else{
            isButtonEnable(isEnable: true)
        }
    }
    
    
    @IBAction func acaoCaracteresEpeciais(_ sender: UISwitch) {
        if (!sender.isOn && !swNumbers.isOn  && !swCaptitalLetters.isOn && !swLetters.isOn){
            isButtonEnable(isEnable: false)
        }else{
            isButtonEnable(isEnable: true)
        }
    }
    
    @objc func checkErrors(textfield: UITextField) {
        
        isButtonEnable(isEnable: true)
        
        if(tfTotalPasswords.text?.isEmpty)! {
            lbErrorQtdSenha.text = "";
        }
        
        if let number = Int(tfTotalPasswords.text!){
            lbErrorQtdSenha.text = ""
            if(number == 0 || number > 99){
                lbErrorQtdSenha.text = "Valores não aceitáveis para a opção Quantidade de senhas: zero ou maior que 99"
                isButtonEnable(isEnable: false)
            }
        }
    }

    @objc func checkAndDisplayErrorForTotCaracter(textfield: UITextField) {
        
        isButtonEnable(isEnable: true)
        
        if(tfNumberOfCharacters.text?.isEmpty)! {
            lbErrorTotalCaracter.text = "";
        }
        
        if let number = Int(tfNumberOfCharacters.text!){
            lbErrorTotalCaracter.text = ""
            if(number == 0 || number > 16){
                lbErrorTotalCaracter.text = "Valores não aceitáveis para a opção Total de caracteres: zero ou maior que 16"
                isButtonEnable(isEnable: false)
            }
        }
    }
    
    func initView() {
        lbErrorQtdSenha.text = "";
        lbErrorTotalCaracter.text = "";
        
        tfTotalPasswords.addTarget(self, action: #selector(checkErrors(textfield:)), for: .editingChanged)
        
        tfNumberOfCharacters.addTarget(self, action: #selector(checkAndDisplayErrorForTotCaracter(textfield:)), for: .editingChanged)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if(CharacterSet(charactersIn: "123456789").isSuperset(of: CharacterSet(charactersIn: string))){
            lbErrorQtdSenha.text = ""
            return true
        }else {
            lbErrorQtdSenha.text = "Inválido!"
            return false
        }
    }
    
    func isButtonEnable(isEnable:Bool){
        if(!isEnable) {
            btPasswordGenerate.isEnabled = false
            btPasswordGenerate.backgroundColor = UIColor.gray
        }else {
            btPasswordGenerate.isEnabled = true
            btPasswordGenerate.backgroundColor = UIColor.purple
        }
    }
}

