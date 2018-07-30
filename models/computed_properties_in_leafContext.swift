struct Stuff: Encodable {
    var foo: String { return "bar" }

    func encode(to encoder: Encoder) throws {
        var kvc = encoder.container(keyedBy: CodingKeys.self)
        try kvc.encode(foo, forKey: .foo)
    }

    private enum CodingKeys: String, CodingKey {
        case foo
    }
}
