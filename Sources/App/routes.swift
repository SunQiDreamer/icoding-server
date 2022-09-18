import Fluent
import Vapor

func routes(_ app: Application) throws {

    try app.register(collection: StudentController())
    try app.register(collection: GradeController())
    try app.register(collection: HobbyController())
}
