//
//  ViewController.swift
//  FirstProject
//
//  Created by jerry on 2022/8/6.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate ,
                      UIPickerViewDelegate,UIPickerViewDataSource,UISearchBarDelegate{
 

    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.view.addSubview(getLable())
     
        self.view.addSubview(getBtn())
    
        self.view.addSubview(getImageView())
    
        self.view.addSubview(getTextFiled())
        
        self.view.addSubview(getSwitch())
        
        self.view.addSubview(getUIPageControl())
        
        self.view.addSubview(getUISeControl())
        
        self.view.addSubview(getUISlider())
        
        self.view.addSubview(getUIAiv())
        
        self.view.addSubview(getProcessView())
        
        self.view.addSubview(getUIStepView())
        
        self.view.addSubview(getPickView())
        
        self.view.addSubview(getDatePickView())
        
        self.view.addSubview(getSearchBar())

    }
    
    @objc func btnClick(){
        print("点击了按钮")
    }
    
    func getLable() -> UILabel{
        
        // Do any additional setup after loading the view.
        let lable =  UILabel(frame: CGRect(x: 100, y: 300, width: 150, height: 200))
        //
        lable.text = "标签控件标签控件标签控件标签控件标签控件标签控件标签控件标签控件"
       
        //lable.textColor = UIColor.red
        //lable.font = UIFont.boldSystemFont(ofSize: 20)
//        lable.shadowColor = UIColor.blue
//        lable.shadowOffset = CGSize(width: 10, height: 10)
//        lable.textAlignment = NSTextAlignment.center
        lable.numberOfLines = 8
       
        let attri = NSMutableAttributedString(string: "个性化文本")
        attri.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20),
                            NSAttributedString.Key.foregroundColor: UIColor.red
                           ],range: NSRange(location: 0, length: 2))
        attri.addAttribute(NSAttributedString.Key.underlineStyle, value: 1,range:NSRange(location: 0, length: 2))
        lable.attributedText = attri
        return lable
    }
    
    func getBtn() -> UIButton{
        
        let btn1 = UIButton(type: UIButton.ButtonType.custom)
        btn1.frame = CGRect(x: 20, y: 130, width: 200, height: 40)
        btn1.setTitle("按钮", for: UIControl.State.normal)
        btn1.backgroundColor = UIColor.purple
        btn1.setImage(UIImage(named: "image"), for: UIControl.State.normal)
//        btn1.setBackgroundImage(UIImage(named: "image"), for: .normal)
        btn1.setTitleColor(UIColor.orange, for: .normal)
        btn1.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 90)
        btn1.imageEdgeInsets = UIEdgeInsets(top: 30, left: 60, bottom: 10, right: 10)
        btn1.addTarget(self, action: #selector(btnClick), for: UIControl.Event.touchUpInside)
        return btn1
    }
    
    func getImageView() -> UIImageView{
        let image = UIImage(named: "image")
        let uimv = UIImageView(image: image)
        uimv.frame = CGRect(x: 200, y: 300, width: 50, height:50)
        var imageArray:Array<UIImage> = Array()
        for index in 1...8 {
        
            imageArray.append(UIImage(named: "bird\(index)")!)
          
        }
        uimv.animationImages = imageArray
        uimv.animationDuration = 1
        uimv.animationRepeatCount = 0
        uimv.startAnimating()
        return uimv
    }
    func getTextFiled() -> UITextField{
        let textF = UITextField(frame: CGRect(x:50, y: 500, width: 200, height: 40))
        textF.borderStyle = UITextField.BorderStyle.roundedRect
        textF.placeholder = "请输入用户名:"
        textF.textAlignment = NSTextAlignment.left
        textF.textColor = UIColor.black
        var leftImageView = UIImageView(image: UIImage(named: "image"))
        var rightImageView = UIImageView(image: UIImage(named: "image"))
        textF.leftView = leftImageView
       // textF.rightView = rightImageView
//        textF.rightViewMode = UITextField.ViewMode.always
        textF.leftViewMode = UITextField.ViewMode.always
        textF.delegate = self
        textF.clearButtonMode = UITextField.ViewMode.always
        return textF
        
    }
    
    func getSwitch() -> UISwitch {
        let uiSwitch = UISwitch(frame: CGRect(x: 50, y: 600, width: 100, height: 80))
        uiSwitch.isOn = true
        uiSwitch.onTintColor = UIColor.orange
        uiSwitch.tintColor = UIColor.purple
        uiSwitch.thumbTintColor = UIColor.brown
        uiSwitch.addTarget(self, action: #selector(onSwitchValueChanged(swi:)), for: UISwitch.Event.valueChanged)
        return uiSwitch
    }
    func getUIPageControl() -> UIPageControl{
        let uipageControl = UIPageControl(frame: CGRect(x: 50, y: 650, width: 200, height: 30))
        uipageControl.numberOfPages = 8
        uipageControl.pageIndicatorTintColor = UIColor.purple
        uipageControl.currentPageIndicatorTintColor = UIColor.yellow
        uipageControl.currentPage = 5
        uipageControl.backgroundColor = UIColor.black
        uipageControl.addTarget(self, action: #selector(onUIPageChanged), for: UIControl.Event.valueChanged)
        
        return uipageControl
    }
    @objc func onUIPageChanged(uipageControl: UIPageControl){
        print(uipageControl.currentPage)
    }
    
    func getUISeControl() -> UISegmentedControl{
        let sec = UISegmentedControl(items: ["聊天","联系人","朋友圈","个人中心",])
        let cgrect = CGRect(x: 50, y: 40, width: 270, height: 50)
        sec.frame = cgrect
        sec.selectedSegmentIndex = 3
        sec.tintColor = UIColor.orange
        sec.insertSegment(with: UIImage(named: "image")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), at: 2, animated: true)
        sec.frame.size.width = sec.frame.size.width + (UIImage(named: "image")?.size.width ?? 40)
        sec.setTitle("测试", forSegmentAt: 1)
        
        sec.apportionsSegmentWidthsByContent = true
        sec.addTarget(self, action: #selector(onUISecControl), for: UIControl.Event.valueChanged)
        return sec
    }
    
    func getUISlider() -> UISlider{
        
        let slider = UISlider(frame: CGRect(x: 50, y: 70, width: 200, height: 50))
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.minimumTrackTintColor = UIColor.orange
        slider.maximumTrackTintColor = UIColor.white
        slider.value = 20
        slider.isContinuous = false
        slider.thumbTintColor = UIColor.purple
        slider.setThumbImage(UIImage(named: "image"), for: UIControl.State.normal)
        //slider.setMinimumTrackImage(UIImage(named: "image"), for: .normal)
        //slider.setMaximumTrackImage(UIImage(named: "image"), for: .normal)
        slider.addTarget(self, action: #selector(onSliderchanged(slider:)), for: UIControl.Event.valueChanged)
        return slider
    }
    func getUIAiv() -> UIActivityIndicatorView{
        let aiv = UIActivityIndicatorView()
        self.view.backgroundColor = UIColor.white
        aiv.style = UIActivityIndicatorView.Style.large
        aiv.center = self.view.center
        aiv.color = UIColor.purple
        aiv.startAnimating()
        return aiv
    }
    
    func getProcessView() -> UIProgressView{
        let uip = UIProgressView(frame: CGRect(x: 50, y: 120, width: 200, height: 50))
        uip.progress = 0.8
        uip.progressTintColor = UIColor.orange
        uip.trackTintColor = UIColor.gray
        uip.trackImage = UIImage(named: "imageN")
        uip.progressImage = UIImage(named: "imageH")
        uip.progressViewStyle = UIProgressView.Style.default
        return uip
    }
    
    func getUIStepView() -> UIStepper{
        let uistep = UIStepper(frame: CGRect(x: 50, y: 130, width: 0, height: 0))
        uistep.isContinuous = true
        uistep.minimumValue = 10
        uistep.maximumValue = 40
        uistep.stepValue = 3
        uistep.tintColor = UIColor.brown
        uistep.autorepeat = true
        uistep.wraps = true
        uistep.setBackgroundImage(UIImage(named: "image"), for: .selected)
        uistep.setDecrementImage(UIImage(named: "image"), for: .normal)
        uistep.setIncrementImage(UIImage(named: "image"), for: .normal)
        uistep.setDividerImage(UIImage(named: "image"), forLeftSegmentState: UIControl.State.normal, rightSegmentState: UIControl.State.normal)
        uistep.addTarget(self, action: #selector(onUIStepper(stepper:)), for: UIControl.Event.valueChanged)
        return uistep
    }
    func getPickView() -> UIPickerView{
        let pickView = UIPickerView(frame: CGRect(x: -100, y: 160, width: 600, height: 150))
        pickView.delegate = self
        pickView.dataSource = self
    
        return pickView
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "第\(component + 1)组,第\(row + 1)行."
    }
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("com:\(component+1),row:\(row+1)")
    }
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        if component == 0{
            return 80.0
        }
        if component == 1{
            return 120.0
        }
        if component == 2{
            return 180.0
        }
        return 60.0
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
   
        
        return 20.0
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attri = NSMutableAttributedString(string: "第\(component + 1)组,第行\(row + 1 ).")
        attri.addAttributes([NSMutableAttributedString.Key.foregroundColor: UIColor.orange], range: NSRange(location: 0, length: attri.length))
        return attri
    }
    
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        let view = UIImageView(image: UIImage(named: "image"))
//        view.frame = CGRect(x: 0, y: 0, width: 110, height: 40)
//        return view
//    }
    
    func getDatePickView() -> UIDatePicker{
        let datePicker = UIDatePicker(frame: CGRect(x: 10, y: 170, width: 300, height: 100))
        datePicker.datePickerMode = UIDatePicker.Mode.dateAndTime
        datePicker.addTarget(self, action: #selector(onDatePick(datePick:)), for: .valueChanged)
      
        return datePicker
    }
    
    func getSearchBar() -> UISearchBar{
        
        let uiSearchBar = UISearchBar(frame: CGRect(x: 10, y: 650, width: 300, height: 70))
        uiSearchBar.barTintColor = UIColor.orange
        uiSearchBar.searchBarStyle = UISearchBar.Style.minimal
        uiSearchBar.placeholder = "请输入搜索条件"
        uiSearchBar.prompt = "搜索"
        uiSearchBar.showsCancelButton = true
        //uiSearchBar.showsBookmarkButton = true
        //uiSearchBar.showsSearchResultsButton = true
        uiSearchBar.showsScopeBar = true
        uiSearchBar.scopeButtonTitles = ["男鞋","男装","男包"]
        uiSearchBar.selectedScopeButtonIndex = 2
        uiSearchBar.setScopeBarButtonDividerImage(UIImage(named: "image"), forLeftSegmentState: .normal, rightSegmentState: .normal)
        //uiSearchBar.setScopeBarButtonBackgroundImage(UIImage(named: "image"), for: .normal)
      
        uiSearchBar.setScopeBarButtonTitleTextAttributes([NSMutableAttributedString.Key.foregroundColor: UIColor.purple], for: .normal)
        uiSearchBar.delegate = self
        return uiSearchBar
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        print("searchBarShouldBeginEditing == \(searchBar.selectedScopeButtonIndex)")
        return true
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidBeginEditing == \(searchBar.selectedScopeButtonIndex)")
    }
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        print("searchBarShouldEndEditing == \(searchBar.selectedScopeButtonIndex)")
        return true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        print("searchBarTextDidEndEditing == \(searchBar.selectedScopeButtonIndex)")
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("searchBar === \(searchText)")
    }
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        print("searchBar replacementText === \(text)")
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarSearchButtonClicked === \(searchBar.selectedScopeButtonIndex)")
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarCancelButtonClicked === \(searchBar.selectedScopeButtonIndex)")
    }
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarBookmarkButtonClicked === \(searchBar.selectedScopeButtonIndex)")
    }
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        print("searchBarResultsListButtonClicked === \(searchBar.selectedScopeButtonIndex)")
    }
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        print("searchBar === \(searchBar.selectedScopeButtonIndex),selectedScope: \(selectedScope)")
    }
    
    @objc
    func onDatePick(datePick: UIDatePicker){
        print(datePick.date)
    }
    
    @objc func onUIStepper(stepper: UIStepper){
        print(stepper.value)
    }
    
    
    @objc
    func onSliderchanged(slider: UISlider){
        print(slider.value)
    }
    @objc
    func onUISecControl(uisec: UISegmentedControl){
     
        print(uisec.selectedSegmentIndex)
    }
    
    @objc
    func onSwitchValueChanged(swi: UISwitch){
        print(swi.isOn)
        
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing ===")
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing ===")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing ===")
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldBeginEditing ===")
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShouldReturn ===")
        textField.resignFirstResponder()
     
        return true
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection : \(String(describing: textField.text))")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("textField === \(String(describing: textField.text))")
        
        if (textField.text?.count)! >= 11 {
            return false
        }
        if (string.first)! >= "0" && (string.last)! <= "9" {
            return true
        }
        return false
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("textFieldShouldClear === \(String(describing: textField.text))")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("textFieldDidEndEditing === \(String(describing: textField.text))")
    }

}

