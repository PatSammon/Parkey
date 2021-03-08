import Fluent
import Vapor

struct PlacesController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let payments = routes.grouped("places")
        payments.get(use: index)
        payments.post(use: create)
        payments.group(":placesID") { payment in
            payment.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Places]> {
        return Places.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Places> {
        let places = try req.content.decode(Places.self)
        return places.save(on: req.db).map {places}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Places.find(req.parameters.get("placeID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
