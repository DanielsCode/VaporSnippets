router.get("testForm") { req -> Future<Response> in
  let client = try req.make(Client.self)
  let bodyForm: [String: String] = ["foo": "bar", "baz": "qux"]
        
  let httpReq = HTTPRequest(method: .POST, url: "https://httpbin.org/post")
  let postReq = Request(http: httpReq, using: req)
  try postReq.content.encode(bodyForm, as: .urlEncodedForm)
  try postReq.query.encode(bodyForm)
        
  return client.send(postReq)
}
