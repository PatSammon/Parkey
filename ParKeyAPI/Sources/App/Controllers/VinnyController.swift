import Fluent
import Vapor

struct VinnyController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let requests = routes.grouped("vinny")
        requests.get(use: index)
        requests.post(use: create)
        requests.group(":requestID") { request in
            request.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Vinny]> {
        return Vinny.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Vinny> {
        let request = try req.content.decode(Vinny.self)
        return request.save(on: req.db).map {request}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Vinny.find(req.parameters.get("requestID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

