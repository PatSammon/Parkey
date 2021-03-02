import Fluent
import Vapor

struct RewardController: RouteCollection
{
    func boot(routes: RoutesBuilder) throws
    {
        let rewards = routes.grouped("reward")
        rewards.get(use: index)
        rewards.post(use: create)
        rewards.group(":rewardID") { reward in
            reward.delete(use: delete)
        }
    }

    func index(req: Request) throws -> EventLoopFuture<[Reward]> {
        return Reward.query(on: req.db).all()
    }

    func create(req: Request) throws -> EventLoopFuture<Reward> {
        let reward = try req.content.decode(Reward.self)
        return reward.save(on: req.db).map {reward}
    }

    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        return Reward.find(req.parameters.get("rewardID"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap { $0.delete(on: req.db) }
            .transform(to: .ok)
    }
}
