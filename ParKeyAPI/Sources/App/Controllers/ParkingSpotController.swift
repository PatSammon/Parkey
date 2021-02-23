import Fluent
import Vapor

struct ParkingSpotController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let spots = routes.grouped("parkingSpot")
        spots.get(use: index)
        spots.post(use: create)
        spots.group(":spotID") { spot in
            spot.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[ParkingSpot]> {
        return ParkingSpot.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<ParkingSpot> {
        let spot = try req.content.decode(ParkingSpot.self)
        return spot.save(on: req.db).map {spot}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return ParkingSpot.find(req.parameters.get("spotID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

