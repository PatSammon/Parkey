import Foundation
import UIKit
	
class RequestHandler
{
    
    static func getRewards(userId: String) -> [Reward]
    {
        var done = false
        var returnArray: [Reward] = []
        let url = URL(string: "http://127.0.0.1:8080/userRewards")!
        
    
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
    
    static func register(name: String, userName: String, password: String, email: String, phoneNum: Int, completion: @escaping (Result<(Data, [String:Any]?), Error>) -> Void){
        //grab the URL for the database (currently set to local)
        let url = URL(string: "http://127.0.0.1:8080/user/signup")!
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
            
            
            /*data, response, error in
            guard let data = data, error == nil else{
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String:Any]{
                print(responseJSON)
            }*/
        }
        task.resume()
    }
    
    static func sign_in(userName: String, password: String, _ completion: @escaping (Result<(Data, [String:Any]?), Error>) -> Void){
        //grab the URL for the database (currently set to local)
        let url = URL(string: "http://127.0.0.1:8080/user/login")!
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
                print(responseJSON)
                completion(.success((data,responseJSON)))
            }
            /*
            guard let data = data, error == nil else{
                print(error?.localizedDescription ?? "No data")
                return
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String:Any]{
                print(responseJSON)
            }*/
            //NotificationCenter.default.post(NSNotification(name: NSNotification.Name(rawValue: "LoginSegue"), object: nil) as Notification)
        }
        task.resume()
    }
    /*
    static func register(name: String, userName: String, password: String, email: String, phoneNum: Int)
    {
        //grab the URL for the database (currently set to local)
        let url = URL(string: "http://127.0.0.1:8080/newUser")!
        //create the encoder that will be used
        let encoder = JSONEncoder()
        
        //make a POST request to the database so it is more secure
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        let newUser = User(name: name, userName: userName, password: password, email: email, phoneNum: phoneNum)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //try to encode the body with the user data
        request.httpBody = try? encoder.encode(newUser)
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data
            {
                
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data)
                {
                    print(user.name + " Added to DB")
                }
            }
        }.resume()
    }*/
    /*
     Function that will be used when they are trying to sign in
     */
    /*static func sign_in(userName: String, password: String){
        //create the URL request
        let url = URL(string: "http://127.0.0.1:8080/User/login")!
        //create the encoder that will be used
        //let encoder = JSONEncoder()
        
        //make a POST request to the database so it is more secure
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        request.addValue(userName, forHTTPHeaderField: "userName")
        request.addValue(password, forHTTPHeaderField: "password")
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data, let dataString = String(data:data,encoding: .utf8)
            {
                print("Completed: \(dataString)")
                //now check to see if it equals "Yes" or "No"
                if dataString == "Yes" {
                    //then reposition to "Home" screen
                }
                else{
                    //display the error message
                }
            }
            }.resume()
        print("completed")
    }*/
    
}
