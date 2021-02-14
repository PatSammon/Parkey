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
    
}
