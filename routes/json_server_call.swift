router.get("testJSON") { req -> Future<Response> in
  let client = try req.make(Client.self)
  let bodyForm: [String: String] = ["foo": "bar", "baz": "qux"]
        
  var httpReq = HTTPRequest(method: .POST, url: "https://httpbin.org/post")
  httpReq.headers.add(name: "X-Foo", value: "Hello World")
  let postReq = Request(http: httpReq, using: req)
  try postReq.content.encode(bodyForm)
        
  return client.send(postReq)
}
