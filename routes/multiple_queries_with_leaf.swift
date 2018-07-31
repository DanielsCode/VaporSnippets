struct AnimalsViewContext: Encodable {
    let cats: Future<[Cat]>
    let dogs: Future<[Dog]>
}

// ...

router.get("animals") { (req: Request) -> Future<View> in
    let renderer = try req.make(ViewRenderer.self)
    let cats: Future<[Cat]> = ... // query 1 goes here
    let dogs: Future<[Dog]> = ... // query 2 goes here

    return renderer.render("animals",
        AnimalsViewContext(cats: cats, dogs: dogs))
}
