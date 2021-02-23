class PaymentInfo: Codable
{
    var id: String?
    var userId: String
    var cardNumber: Int
    var cardType: String //Credit or Debit
    var expirationDate: String
    var CVV: Int
    var postalCode: Int
    var city: String
    var state: String
    var address: String
    var address2: String //Optional: Apt, office, suite
    var nameOnCard: String
    
    init(userId: String, cardNumber: Int, cardType: String, expirationDate: String, CVV: Int, postalCode: Int, city: String, state: String, address: String, address2: String, nameOnCard: String)
    {
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
