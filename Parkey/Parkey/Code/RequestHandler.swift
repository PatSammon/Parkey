import Foundation
import UIKit
import CryptoSwift
	
class RequestHandler
{
    static func removeReward(rewardId: String)
    {
        var done = false
        let url = URL(string: "https://parkeyny.herokuapp.com/removeReward")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let postString = "rewardId=\(rewardId)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            done=true
        }.resume()
        
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
        
    }
    static func removeParkingSpot(latitude: Float,longitude: Float)
    {
        var done = false
        let url = URL(string: "https://parkeyny.herokuapp.com/removeParkingSpot")
        var request = URLRequest(url: url!)
        let postString = "latitude=\(latitude)&longitude=\(longitude)";
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            done=true
        }.resume()
        
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
        
    }
    
    static func getLeaderboard() -> [User]
    {
        var done = false
        var returnArray: [User] = []
        
        let url = URL(string: "https://parkeyny.herokuapp.com/leaderboard")

        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request)
        { (data, response, error) in
            
        if error != nil
        {
            print(error!)
            return
        }
    
        if let data = data
        {
            let users = try? JSONDecoder().decode([User].self, from: data)
            returnArray = users!
            done=true
        }
            
        }.resume()
        
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        } while !done
        
        return returnArray
    }
    
    static func addReward(userId: String, name: String, cost: Int)
    {
 
        let url = URL(string: "https://parkeyny.herokuapp.com/newReward")

        let encoder = JSONEncoder()

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newReward = Reward(userId: userId, name: name, cost: cost)
        request.httpBody = try? encoder.encode(newReward)
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            
        }.resume()
    }
    
    static func addPlace(name: String, cost: Int, coordinates: [Float])
    {
        let url = URL(string: "https://parkeyny.herokuapp.com/newPlace")

        let encoder = JSONEncoder()

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let newPlace = Place(name: name, cost: cost, coordinates: coordinates)
        request.httpBody = try? encoder.encode(newPlace)
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            
        }.resume()
    }
    
    static func addParkingSpot(latitude: Float, longitude: Float, date: String){
        
        let url = URL(string: "https://parkeyny.herokuapp.com/newParkingSpot")
        let encoder = JSONEncoder()
        
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
        let newParkingSpot = ParkingSpot(latitude: latitude, longitude: longitude, available: true, timeAvailable: date)
        request.httpBody = try? encoder.encode(newParkingSpot)
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            
        }.resume()
    }
    
    static func updateVehicle(vehicle: Vehicle){
        let url = URL(string: "https://parkeyny.herokuapp.com/api/vehicles/\(vehicle.id!)")
        let encoder = JSONEncoder()
        
        var request = URLRequest(url: url!)
        request.httpMethod = "PUT"
        request.setValue(vehicle.id, forHTTPHeaderField: "vehicleID")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let updatedMake = vehicle.make
        let updatedModel = vehicle.model
        let updatedSize = vehicle.size
        let updatedUserID = vehicle.userId
        let byteText = vehicle.licensePlate.bytes
        let iv = AES.randomIV (AES.blockSize)
            do {
                let aes = try AES (key: [0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00], blockMode: CBC (iv: iv))
                let encrypted = try aes.encrypt (byteText)
                let strEnc = NSData (bytes: encrypted, length: encrypted.count) .base64EncodedString (options: .lineLength64Characters)
                //print(strEnc)
                let updatedVehicle = Vehicle(userId: updatedUserID, licensePlate: strEnc, make: updatedMake, model: updatedModel, size: updatedSize)
                request.httpBody = try? encoder.encode(updatedVehicle)
                                   
                URLSession.shared.dataTask(with: request)
                {(data, response, error) in
                                       
                }.resume()
            } catch {
            }
     }


    static func getVehicles(userId: String) -> [Vehicle]
    {
        var done = false
        var returnArray: [Vehicle] = []
        
        let url = URL(string: "https://parkeyny.herokuapp.com/userVehicles")
        var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        let postString = "userId=\(userId)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request)
        { ( data, response, error ) in
            
            if error != nil
            {
                print (error!)
                return
            }
                
            if let data = data
            {
                let userVehicles = try? JSONDecoder().decode([Vehicle].self, from: data)
                returnArray = userVehicles!
                done = true
                
            }
                
        }.resume()
        
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
        
        return returnArray

    }
    
    static func addVehicle(userId: String, licensePlate: String, make: String, model: String, size: Int)
    {

        let url = URL(string: "https://parkeyny.herokuapp.com/newVehicle")
        let encoder = JSONEncoder()

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let byteText: Array<UInt8> = licensePlate.bytes
        let iv = AES.randomIV (AES.blockSize)
                do {
                    let aes = try AES (key: [0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00], blockMode: CBC (iv: iv))
                    let encrypted = try aes.encrypt (byteText)
                    //let strIV = NSData (bytes: iv, length: iv.count) .base64EncodedString (options: .lineLength64Characters)
                    let strEnc = NSData (bytes: encrypted, length: encrypted.count) .base64EncodedString (options: .lineLength64Characters)
                    print(strEnc)
                    let newVehicle = Vehicle(userId: userId, licensePlate: strEnc, make: make, model: model, size: size)
                    request.httpBody = try? encoder.encode(newVehicle)
                            
                    URLSession.shared.dataTask(with: request)
                    {(data, response, error) in
                                
                    }.resume()
                } catch {
                }
    }
    
    
    static func removeVehicle(vehicleId: String)
    {
        var done = false
        let url = URL(string: "https://parkeyny.herokuapp.com/removeVehicle")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        let postString = "vehicleId=\(vehicleId)";
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request)
        {(data, response, error) in
            done=true
        }.resume()
        
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
        
    }
    
    static func getRewards(userId: String) -> [Reward]
    {
        var done = false
        var returnArray: [Reward] = []
        
        let url = URL(string: "https://parkeyny.herokuapp.com/userRewards")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let postString = "userId=\(userId)"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request)
        { (data, response, error) in
            
            if error != nil
            {
                print(error!)
                return
            }
            
            if let data = data
            {
                let userRewards = try? JSONDecoder().decode([Reward].self, from: data)
               
                returnArray = userRewards!
                done=true
            }
        }.resume()
        
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
        
        return returnArray
    }

    static func getPlaces() -> [Place]{
        var done = false
        var returnArray: [Place] = []

        let url = URL(string: "https://parkeyny.herokuapp.com/places")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request)
        { (data, response, error) in
                
            if error != nil
            {
                print(error!)
                return
            }
                
            if let data = data
            {
                let Places = try? JSONDecoder().decode([Place].self, from: data)
                   
                returnArray = Places!
                done=true
            }
        }.resume()
            
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
            
        return returnArray
    }
    
    static func getParkingSpots() -> [ParkingSpot]{
        var done = false
        var returnArray: [ParkingSpot] = []

        let url = URL(string: "https://parkeyny.herokuapp.com/parkingSpots")!

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request)
        { (data, response, error) in
                
            if error != nil
            {
                print(error!)
                return
            }
                
            if let data = data
            {
                let ParkingSpots = try? JSONDecoder().decode([ParkingSpot].self, from: data)
                   
                returnArray = ParkingSpots!
                done=true
            }
        }.resume()
            
        repeat
        {
            RunLoop.current.run(until: Date(timeIntervalSinceNow: 0.1))
        }while !done
            
        return returnArray
    }
        
    
    static func register(name: String, userName: String, password: String, email: String, phoneNum: Int, completion: @escaping (Result<(Data, [String:Any]?), Error>) -> Void){
        //grab the URL for the database (currently set to local)
        
        let url = URL(string: "https://parkeyny.herokuapp.com/user/signup")!
        
        //create the encoder that will be used
        let encoder = JSONEncoder()
        
        let json = ["username":email,"password":password,"name":name]
        
        let jsondata = try? JSONSerialization.data(withJSONObject:json)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.httpBody = jsondata
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request){
            data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            else if let data = data{
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                print(responseJSON)
                completion(.success((data,responseJSON)))
            }
        }
        task.resume()
    }
    
    static func sign_in(userName: String, password: String, _ completion: @escaping (Result<(Data, [String:Any]?), Error>) -> Void){
        //grab the URL for the database (currently set to local)
        
        let url = URL(string: "https://parkeyny.herokuapp.com/user/login")!

        //create the encoder that will be used
        let encoder = JSONEncoder()
        //the data that you are sending over
        let json = ["username":userName,"password":password]
        //serialie the json data
        let jsondata = try? JSONSerialization.data(withJSONObject:json)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //attach the json data and tell the server it is json data
        request.httpBody = jsondata
        //you have to encode the login information
        let loginString = "\(userName):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else{
            return
        }
        //now encode the string
        let base64LoginString = loginData.base64EncodedString()
        
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            else if let data = data{
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                completion(.success((data,responseJSON)))
            }
        }
        task.resume()
    }
    
    /**
            Request to add specified points to the specified Username
     */
    static func addPoints(userName: String, password: String, points: Int,_ completion: @escaping (Result<(Data, [String:Any]?), Error>) -> Void){
        //grab the URL for the database
        let url = URL(string: "https://parkeyny.herokuapp.com/user/addPoints")!

        //the data that you are sending over
        let json = ["username":userName,"password":password]
        //serialie the json data
        let jsondata = try? JSONSerialization.data(withJSONObject:json)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //attach the json data and tell the server it is json data
        request.httpBody = jsondata
        //you have to encode the login information
        let loginString = "\(userName):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else{
            return
        }
        //now encode the string
        let pointsString:String = String(points)
        let base64LoginString = loginData.base64EncodedString()
        request.addValue(pointsString, forHTTPHeaderField: "Points")
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            else if let data = data{
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                completion(.success((data,responseJSON)))
            }
        }
        task.resume()
    }
    
    /**
            Request to add specified points to the specified Username
     */
    static func spendPoints(userName: String, password: String, points: Int,_ completion: @escaping (Result<(Data, [String:Any]?), Error>) -> Void){
        //grab the URL for the database

        let url = URL(string: "https://parkeyny.herokuapp.com/user/spendPoints")!

        //the data that you are sending over
        let json = ["username":userName,"password":password]
        //serialie the json data
        let jsondata = try? JSONSerialization.data(withJSONObject:json)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //attach the json data and tell the server it is json data
        request.httpBody = jsondata
        //you have to encode the login information
        let loginString = "\(userName):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else{
            return
        }
        //now encode the string
        let pointsString:String = String(points)
        let base64LoginString = loginData.base64EncodedString()
        request.addValue(pointsString, forHTTPHeaderField: "Points")
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            else if let data = data{
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                completion(.success((data,responseJSON)))
            }
        }
        task.resume()
    }
    //method that will be used to get the users available and total points
    static func getPoints(userName: String, password: String,_ completion: @escaping (Result<(Data, User.points), Error>) -> Void){
        //grab the URL for the database
        
        let url = URL(string: "https://parkeyny.herokuapp.com/user/getPoints")!
        
        //the data that you are sending over
        let json = ["username":userName,"password":password]
        //serialie the json data
        let jsondata = try? JSONSerialization.data(withJSONObject:json)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        //attach the json data and tell the server it is json data
        request.httpBody = jsondata
        //you have to encode the login information
        let loginString = "\(userName):\(password)"
        guard let loginData = loginString.data(using: String.Encoding.utf8) else{
            return
        }
        //now encode the string
        let base64LoginString = loginData.base64EncodedString()
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let task = URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error{
                completion(.failure(error))
            }
            else if let data = data{
                do{
                    let responseJSON2 = try JSONDecoder().decode(User.points.self, from: data)
                    completion(.success((data,responseJSON2)))
                }
                catch{
                    print("JSONSerialization error:", error)
                }
            }
        }
        task.resume()
    }
}
