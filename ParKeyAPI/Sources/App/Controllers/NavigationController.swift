import Fluent
import Vapor

struct NavigationController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let navigations = routes.grouped("navigation")
        navigations.get(use: index)
        navigations.post(use: create)
        navigations.group(":navigationID") { navigation in
            navigation.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Navigation]> {
        return Navigation.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Navigation> {
        let navigation = try req.content.decode(Navigation.self)
        return navigation.save(on: req.db).map {navigation}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Navigation.find(req.parameters.get("navigationID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}

