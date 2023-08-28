import ProjectDescription

let nameAttribute: Template.Attribute = .required("name")

let template = Template(
    description: "Framework template",
    attributes: [
        nameAttribute
    ], items: [
        .file(
            path: "Modules/\(nameAttribute)/Project.swift",
            templatePath: "project.stencil"
        ),
        .string(path: "Modules/\(nameAttribute)/Sources/implementation.swift", contents: "// Module \(nameAttribute)\nimport Foundation"),
        .string(path: "Modules/\(nameAttribute)/Interface/interface.swift", contents: "// Module \(nameAttribute)\nimport Foundation")
    ]
)
