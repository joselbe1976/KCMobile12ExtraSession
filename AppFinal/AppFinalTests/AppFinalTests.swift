//
//  AppFinalTests.swift
//  AppFinalTests
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import XCTest
@testable import AppFinal

class AppFinalTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testModelos() throws {
        let model = HeroLocationsResponse(id: "10", longitud: "10,1", latitud: "10,2")
        XCTAssertNotNil(model)
        XCTAssertEqual(model.id, "10")
        
    }
    
    func testModelos2() throws {
        let model = HeroLocationsRequest(id: "hola")
        XCTAssertNotNil(model)
        XCTAssertEqual(model.id, "hola")
        
    }
    
    func testLogin() throws {
       let vm = RootViewModel(interactor: RootInteractorTesting())
       XCTAssertNotNil(vm)
       
        //binding del mensaje
        vm.errorMessage.bind { data in
            if (data != "Haciendo Login... espere..." && data != ""){
                XCTAssertEqual(data, "Conectado")
            }
        }
        
        //lanzmaos el Login
        vm.login(user: "user", pass: "Error")
        
    }
    
    func testLoginReal() throws {
        let expectation = self.expectation(description: "Login Real")
        
        let vm = RootViewModel(interactor: RootInteractor())
        XCTAssertNotNil(vm)
        
        //bindinf del mensaje
        vm.errorMessage.bind { data in
            if (data != "Haciendo Login... espere..." && data != ""){
                XCTAssertEqual(data, "Conectado")
                expectation.fulfill() //le dices que OK.
            }
        }
        
        
        //lanzmaos el Login
        vm.login(user: "bejl@keepcoding.es", pass: "123456")
        
        //Espero el espectation
        self.waitForExpectations(timeout: 20) //esperamos 20 segundos a que termine el login
        
    }

}
