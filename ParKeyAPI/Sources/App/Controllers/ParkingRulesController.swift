import Fluent
import Vapor

struct ParkingRulesController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let rules = routes.grouped("parkingRules")
        rules.get(use: index)
        rules.post(use: create)
        rules.group(":ruleID") { rule in
            rule.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[ParkingRules]> {
        return ParkingRules.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<ParkingRules> {
        let rule = try req.content.decode(ParkingRules.self)
        return rule.save(on: req.db).map {rule}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return ParkingRules.find(req.parameters.get("ruleID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

