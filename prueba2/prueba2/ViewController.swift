//
//  ViewController.swift
//  prueba2
//
//  Created by Pablo Perpinan on 9/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: LifeCicle
    
    
    
    
    override func loadView() {
        super.loadView()
        //This function is called when view is nil (=null)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Here you can call to api calls or setup view object with external data
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //This function is called before screen appear
        //Sizes and positions of objects, are not calculated
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        //This function is called before calculate sub views sizes and positions
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //This function is called after calculate sub views sizes and positions
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //This function is called after screen appear
        //Sizes and positions of objects, are calculated
        
    }
    deinit{
        
    }
    
    
    //MARK: FUNCTIONS
    
    
    func defineFunctionTest(varName: Int /*Type*/) -> Int /*Returdend Value*/{
        
        
        return 0
    }
    
    @discardableResult
    func defineFunctionNoWarning(varName: Int /*Type*/) -> Int /*Returdend Value*/{
        
        
        return 0
    }
    
    
    //MARK: VarTypes
    
    func testVariables(){
        var a: Int = 0
        
        a += 1
        
        let b:Int = 0
        //Left side of mutating operator isn't mutable: 'b' is a 'let' constant
        //∫b += 2
        
        
        
    }
    
    
    
    //MARK: Optionals
    
    
    func testOptionals(){
        var a:Int
        //Variable 'a' passed by reference before being initialized
        //a += 1
        var b:Int = 0
        b += 1
        
        var c: Int?
        // Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
        //b = c
        
        if var c = c{
            b = c
        }
        
        //La b no puede asignarse a tipo int
        //b=nil
        c=nil
        
        b = c ?? 0
        
        guard var c = c else {
            return
        }
        
        b = c
        
        
    }
    
    //MARK: Clases, protocolos y cositas
    
    class TestObject {
        
        var a: Int
        let b: Int
        var c: Int?
        
        init(){
            a = 0
            b = 0
        }
        
        init(a: Int, b: Int, c: Int? = nil) {
            self.a = a
            self.b = b
            self.c = c
        }
        
        func addOneToAll(){
            
            self.a += 1
            //Left side of mutating operator isn't mutable: 'b' is a 'let' constant
            // self.b += 1
            
            // self.c += 1
            
            //NO HACER ESTO, TA MAL
            self.c! += 1
            
            
        }
        
    }
    
    func testClass(){
        var nonOptionalClass = TestObject()
        
        //var optionalClass = nil
        var optionalClass:TestObject? = nil
        nonOptionalClass.addOneToAll()
        
        //Si la clase es nill no llamara a la funcion y tampoco da error
        optionalClass?.addOneToAll()
        
        nonOptionalClass.a = optionalClass?.a ?? 1
        
        
        if let optionalClass = optionalClass{
            nonOptionalClass.a = optionalClass.a
        }
        
        guard let optionalClass = optionalClass else{
            return
        }
        
        nonOptionalClass.a = optionalClass.a
        
    }

    
    
   
    
}

extension ViewController.TestObject{
    
    //var d: Int     no se puede extender variables
    
    func substractToAll(){
        
        a -= 1
        
        c = (c ?? 0) - 1
        
        
    }
    
    
}
extension ViewController {
    
    func testExtension() {
        var extendedObject = TestObject()
        extendedObject.substractToAll()
        
    }
}

protocol ReadableAsText{
    
    var Text: String { get }

    func toText() -> String
    
    
}
extension ViewController.TestObject:ReadableAsText {
   
    var Text: String {
        return toText()
    }
    
    func toText() -> String {
        
        var s = " "
        
        s += "La variable A es \(a) \n"
        s += "La variable B es " + b.formatted() + "\n"
        s += "La variable C es \(c)"
        
        return s
        
    }
    
}

extension ViewController {
    
    func testProtocol (){
        var extendedObject = TestObject()
        var aString = extendedObject.Text
        var bString = extendedObject.toText()
    }
}

//MARK: ITERATIONS

extension ViewController {
    
    func testIterations (){
        
        var list: [Int] = []
        
        list.append(0)
        list.append(1)
        list.append(2)
        list.append(3)
        
        list.forEach { Item in
            print(Item)
            debugPrint(Item)
        }
        
        print(list)
        debugPrint(list)

        
        for item in list {
            print(item)
        
        }
        
        for i in 0...list.count {
            print(list[i])
            
        }
        
        
        var otherList = [Int](0...100)
        
        for number in otherList where number % 2 == 0 {
            print(number)
        }
        
        var objectsClass:[TestObject] = []
        objectsClass.append(TestObject(a:1, b:1, c:1))
        objectsClass.append(TestObject(a:2, b:2, c:nil))
        objectsClass.append(TestObject(a:3, b:3, c:3))
        objectsClass.append(TestObject(a:4, b:4, c:nil))
        objectsClass.append(TestObject(a:5, b:5, c:5))
        
        
        for item in objectsClass where item.c != nil{
            print(item.c)
        }
        
        
        var i = 0
        
        while (i < 5) {
            i += 1
        }
    }
    
    
    
    
}
