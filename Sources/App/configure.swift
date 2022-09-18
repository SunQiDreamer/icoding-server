import Fluent
import FluentMySQLDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    
//    var hostname = Environment.get("DATABASE_HOST") ?? "localhost"
//    var port = Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? MySQLConfiguration.ianaPortNumber
//    var username = Environment.get("DATABASE_USERNAME") ?? "vapor_username"
//    var password = Environment.get("DATABASE_PASSWORD") ?? "vapor_password"
//    var database = Environment.get("DATABASE_NAME") ?? "vapor_database"
//
//
//    let foo = Environment.process.FOO
//
//    let bar = Environment.process.BAR
//
//
//
//    switch app.environment {
//    case .production:
//        hostname = "prd"
//    case .development:
//        hostname = "dev"
//    case .testing:
//        hostname = "test"
//    default:
//        break
//    }
    
    var tls = TLSConfiguration.makeClientConfiguration()
    tls.certificateVerification = .none
    
    let hostname = "localhost"
    let username = "root"
    let password = "lumia0812"
    let database = "Vaporschool"

    app.databases.use(.mysql(
        hostname: hostname,
        username: username,
        password: password,
        database: database,
        tlsConfiguration: tls
    ), as: .mysql)

    app.migrations.add(CreateStudent())
    app.migrations.add(CreateGrade())
    app.migrations.add(CreateHobby())
    app.migrations.add(CreateStudentHobby())
    
    app.routes.caseInsensitive = true
    
//    let encode = JSONEncoder()
//    encode.dateEncodingStrategy = .secondsSince1970
//    ContentConfiguration.global.use(encoder: encode, for: .json)

    // register routes
    try routes(app)
}
