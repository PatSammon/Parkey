import Fluent
import Vapor

struct PaymentInfoController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let payments = routes.grouped("payment")
        payments.get(use: index)
        payments.post(use: create)
        payments.group(":paymentID") { payment in
            payment.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[PaymentInfo]> {
        return PaymentInfo.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<PaymentInfo> {
        let payment = try req.content.decode(PaymentInfo.self)
        return payment.save(on: req.db).map {payment}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return PaymentInfo.find(req.parameters.get("paymentID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
