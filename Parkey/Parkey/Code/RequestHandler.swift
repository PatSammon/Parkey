import Foundation
import UIKit
	
class RequestHandler
{
    
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
    }
    /*
     Function that will be used when they are trying to sign in
     */
    static func sign_in(userName: String, password: String){
        //create the URL request
        let url = URL(string: "http://127.0.0.1:8080/loginUser")!
        //create the encoder that will be used
        //let encoder = JSONEncoder()
        
        //make a POST request to the database so it is more secure
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue(userName, forHTTPHeaderField: "userName")
        request.addValue(password, forHTTPHeaderField: "password")
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data
            {
                
                let decoder = JSONDecoder()
                
                if let user = try? decoder.decode(User.self, from: data)
                {
                    print(user.name + " logged in to DB")
                }
            }
        }.resume()
        print("completed")
    }
    
}
