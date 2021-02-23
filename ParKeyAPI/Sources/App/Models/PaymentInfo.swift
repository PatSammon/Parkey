import Fluent
import Vapor
import FluentMongoDriver

final class PaymentInfo: Model, Content
{
    init() {}
    
    static let schema = "paymentInfo"
    
    @ID(custom: .id)
    var id: ObjectId?
    
    @Field(key: "userId")
    var userId: String
    
    @Field(key: "cardNumber")
    var cardNumber: Int
    
    @Field(key: "cardType")
    var cardType: String
    
    @Field(key: "expirationDate")
    var expirationDate: String
    
    @Field(key: "CVV")
    var CVV: Int
    
    @Field(key: "postalCode")
    var postalCode: Int
    
    @Field(key: "city")
    var city: String
    
    @Field(key: "state")
    var state: String
    
    @Field(key: "address")
    var address: String
    
    @Field(key: "address2")
    var address2: String
    
    @Field(key: "nameOnCard")
    var nameOnCard: String
    
    
    init(userId: String, cardNumber: Int, cardType: String, expirationDate: String, CVV: Int, postalCode: Int, city: String, state: String, address: String, address2: String, nameOnCard: String)
    {
        self.id = ObjectId()
        self.userId = userId
        self.cardNumber = cardNumber
        self.cardType = cardType
        self.expirationDate = expirationDate
        self.CVV = CVV
        self.postalCode = postalCode
        self.city = city
        self.state = state
        self.address = address
        self.address2 = address2
        self.nameOnCard = nameOnCard
    }
}

