import UIKit

/// Vehicle
enum VehicleType {
    case Compact
    case Regular
    case Large
}

protocol Vehicle {
    var type: VehicleType { get set }
    var plateNo: String {get set}
}

struct Car: Vehicle {
    var type: VehicleType
    var plateNo: String
    var handicap: Bool
}

///parkingSoptType
enum ParkingSpotType {
    case Compact
    case Large
    case Regular
    case Handicap
}

struct ParkingSpot {
    private(set) var parkingSpotType: ParkingSpotType
    private(set) var parkingSpotID: String
    var car: Car?
    
    init(parkingSpotType: ParkingSpotType, parkingSpotID: String) {
        self.parkingSpotType = parkingSpotType
        self.parkingSpotID = parkingSpotID
    }
}

///Ticket
struct Ticket {
    private(set) var car: Car
    private(set) var enterTime: TimeInterval
    private(set) var exitTime: TimeInterval?
    private(set) var parkingSpotType: ParkingSpotType
    
    private var hourlyRate: Double {
        switch parkingSpotType {
        case .Compact: return 3.00
        case .Large: return 5.00
        case .Regular: return 7.00
        case .Handicap: return 2.00
        }
    }
    
    private var chargeAmount: Double? {
        guard let exitTime = exitTime else { return nil }
        return (exitTime - enterTime) / 3600 * hourlyRate
    }
    
    init(car: Car, parkingSpotType: ParkingSpotType) {
        self.car = car
        self.parkingSpotType = parkingSpotType
        self.enterTime = Date().timeIntervalSince1970
    }
    
    mutating func goExit() {
        exitTime = Date().timeIntervalSince1970
    }
    
    func getHourlyRate() -> Double {
        return hourlyRate
    }
    
    func getChargeAmount() throws -> Double {
        if let chargeAmount = chargeAmount {
            return chargeAmount
        } else {
            throw TicketError.ChargeAmountMissingError
        }
    }
    
    enum TicketError:Error {
        case ChargeAmountMissingError
    }
}


///ParkingLot
final class ParkingLot {
    private(set) var compactSpotCount:Int
    private(set) var regularSpotCount:Int
    private(set) var largeSpotCount:Int
    private(set) var handicapSpotCount:Int
    
    init(compactSpotCount: Int, regularSpotCount: Int, largeSpotCount: Int, handicapSpotCount: Int) {
        self.compactSpotCount = compactSpotCount
        self.regularSpotCount = regularSpotCount
        self.largeSpotCount = largeSpotCount
        self.handicapSpotCount = handicapSpotCount
    }
    
    private func isFull(parkingSpotType: ParkingSpotType) -> Bool{

        switch parkingSpotType {
        case .Compact:
            return compactSpotCount == 0
        case .Large:
            return largeSpotCount == 0
        case .Regular:
            return regularSpotCount == 0
        case .Handicap:
            return handicapSpotCount == 0
        }
    }
    
    private func isAvailable(car: Car, parkingSpotType: ParkingSpotType) -> Bool {
        let carType = car.type
        switch parkingSpotType {
        case .Compact:
            return carType == .Compact || car.handicap
        case .Large:
            return carType == .Compact || carType == .Large || carType == .Regular || car.handicap
        case .Regular:
            return carType == .Compact || carType == .Regular || car.handicap
        case .Handicap:
            return car.handicap
        }
    }
    
    func carParking(car: Car,parkingSpotType: ParkingSpotType) throws -> Ticket {
        if !isAvailable(car: car, parkingSpotType: parkingSpotType) {
            throw ParkingLotError.ParkWrongSpotError
        }
            
        if isFull(parkingSpotType: parkingSpotType) {
            throw ParkingLotError.LotIsFullError
        }
        
        switch parkingSpotType {
        case .Compact:
            compactSpotCount -= 1
        case .Large:
            largeSpotCount -= 1
        case .Regular:
            regularSpotCount -= 1
        case .Handicap:
            handicapSpotCount -= 1
        }
        
        return Ticket(car: car, parkingSpotType: parkingSpotType)
    }
    
    func carExit(ticket:Ticket) -> Ticket {
        var ticket = ticket
        ticket.goExit()
        
        switch ticket.parkingSpotType {
        case .Compact:
            compactSpotCount -= 1
        case .Large:
            largeSpotCount -= 1
        case .Regular:
            regularSpotCount -= 1
        case .Handicap:
            handicapSpotCount -= 1
        }
        
        return ticket
    }
    
    enum ParkingLotError:Error {
        case LotIsFullError
        case ParkWrongSpotError
    }
}


let myNissan = Car(type: .Compact, plateNo: "XA323", handicap: true)
let myToyota = Car(type: .Compact, plateNo: "TO323", handicap: true)
let myBenz = Car(type: .Compact, plateNo: "TO323", handicap: true)

let parkingLot = ParkingLot(compactSpotCount: 3, regularSpotCount: 3, largeSpotCount: 3, handicapSpotCount: 2)//compact:3 regular:3 large:3 handicap:2

do {
    let ticket = try parkingLot.carParking(car: myNissan, parkingSpotType: .Handicap)
} catch {
    print(error.localizedDescription)
}


do {
    let ticket = try parkingLot.carParking(car: myToyota, parkingSpotType: .Handicap)
    let exitTicket = parkingLot.carExit(ticket: ticket)
    dump(exitTicket)
} catch {
    print(error.localizedDescription)
}


do {
    let ticket = try parkingLot.carParking(car: myBenz, parkingSpotType: .Handicap)
} catch {
    print(error)
}

