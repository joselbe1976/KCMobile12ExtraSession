//
//  HerosViewModel.swift
//  AppFinal
//
//  Created by JOSE LUIS BUSTOS ESTEBAN on 13/1/22.
//

import Foundation
import Combine
import MapKit

final class HerosViewModel: ObservableObject {
    //Creamos un publicador de las localizaciones
   // @Published var locations : [HeroLocationsResponse]? //SwiftUI
    var locations = PassthroughSubject<[HeroLocationsResponse], Never>() //publicador sin valor por defecto.
    
    var suscriptors = Set<AnyCancellable>()
    
    func loadLocations(idHeroFilter:String = "98CF0A0D-85AF-44E3-8146-45AA222DF9C3") {
        //se podría hacer solo con URLSession normal...
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSessionHeroLocations(idHero: idHeroFilter))
            .tryMap{
                guard let response = $0.response as?  HTTPURLResponse,
                      response.statusCode == 200 else {
                          throw URLError(.badServerResponse)
                      }
                return $0.data
            }
            .decode(type: [HeroLocationsResponse].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                //evaluamos
                switch completion{
                case .failure(let error):
                    print("Error localizacion: \(error)")
                case .finished:
                    print("Finalizado OK localizacion puntos heroe")
                }
                
            } receiveValue: { data in
                self.locations.send(data) //Envio al observador
            }
            .store(in: &suscriptors)

    }
    
    
    
    func convertModelToMaps(model: HeroLocationsResponse) -> HeroMap {
        HeroMap(name: "Capitan America", coordinate: CLLocationCoordinate2D(latitude: model.latitud.toDouble(), longitude:  model.longitud.toDouble()))
    }
    
}
