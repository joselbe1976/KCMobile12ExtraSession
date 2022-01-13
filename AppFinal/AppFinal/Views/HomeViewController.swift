//
//  HomeViewController.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import UIKit
import MapKit //añadir
import Combine //añadir
import CoreLocation

class HomeViewController: UIViewController {
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    var rootVM: RootViewModel?
    var herosVM: HerosViewModel?
    var suscriptors = Set<AnyCancellable>() //Combine
    
    
    let locationMAnager = CLLocationManager() // localizacion del usuario conectado..
    
    
    
    init(vm:RootViewModel, heroVM : HerosViewModel = HerosViewModel()){
        super.init(nibName: nil, bundle: nil)
        self.rootVM = vm
        self.herosVM = heroVM
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func LogOut(_ sender: Any) {
        self.rootVM?.viewActive = .Login
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //localizamos el mapa en madrid, en el mejor sitio...
        
        let initiaLocation = CLLocation(latitude: 40.45064838408302, longitude: -3.6878562736371205)
        mapa.centerToLocation(initiaLocation)
        
        
        //Combine: Binding....
        // Creamos el suscriptor del publicador del ViewModelo
        self.herosVM?.locations
            .sink(receiveValue: { data in
                //Nos llegan las localizaciones del heroe...
                print("Localizacions Tenemos \(data.count)")
                
                //recorremos cada Localizacion del heroe
                data.forEach { locat in
                    let modelMapKit = self.herosVM?.convertModelToMaps(model: locat)
                    
                    if let model = modelMapKit {
                        self.mapa.addAnnotation(model)
                    }
                }
            })
            .store(in: &suscriptors)
        
        
        //Lanzo la carga de las localizaciones...
        self.herosVM?.loadLocations()
        
        
        //inicializamos la localizacion
        UserLocation()
    }

}


// COre Locations.....

extension HomeViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    //localizar al usuario del dispositivo...
    func UserLocation() {
        self.locationMAnager.requestAlwaysAuthorization()
        self.locationMAnager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            //Usuario ha dado el OK....
            locationMAnager.delegate = self //Asigno el delegado a mi mismo...
            locationMAnager.desiredAccuracy = kCLLocationAccuracyBest
            locationMAnager.startUpdatingLocation()
        }

        //delegados de los Maps
        mapa.delegate = self
        mapa.mapType = .standard
        mapa.isZoomEnabled = true
        mapa.isScrollEnabled = true
        
        if let coor = mapa.userLocation.location?.coordinate {
            mapa.setCenter(coor, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue : CLLocationCoordinate2D = manager.location!.coordinate
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        mapa.setRegion(region, animated: true)
        
        //añadimos nuestra pocision en el mapa
        let anotacion = MKPointAnnotation()
        anotacion.coordinate = locValue
        anotacion.title = "Estas AQUIIII"
        mapa.addAnnotation(anotacion)
        
    }
}
