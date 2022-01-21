import Fluent
import FluentPostgresDriver
import Leaf
import Vapor
import JWT

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    app.jwt.signers.use(.hs256(key: "secret"))
    try routes(app)
}
