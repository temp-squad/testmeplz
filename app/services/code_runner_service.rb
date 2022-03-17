require 'net/http'

class CodeRunnerService
  attr_accessor :test_answer
  
  def initialize(test_answer)
    @test_answer = test_answer
  end

  def run
    url = URI("https://onecompiler.com/api/code/exec")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Post.new(url)
    request["authority"] = "onecompiler.com"
    request["sec-ch-ua"] = "\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\""
    request["authorization"] = "Bearer undefined"
    request["content-type"] = "application/json"
    request["sec-ch-ua-mobile"] = "?0"
    request["user-agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36"
    request["sec-ch-ua-platform"] = "\"macOS\""
    request["accept"] = "*/*"
    request["origin"] = "https://onecompiler.com"
    request["sec-fetch-site"] = "same-origin"
    request["sec-fetch-mode"] = "cors"
    request["sec-fetch-dest"] = "empty"
    request["referer"] = "https://onecompiler.com/ruby/3xvmmne9p"
    request["accept-language"] = "en-US,en;q=0.9,th;q=0.8,fr;q=0.7,ja;q=0.6,la;q=0.5"
    request.body = JSON.dump({
      "name": "Ruby",
      "title": "3xvmmne9p",
      "mode": "javascript",
      "description": nil,
      "extension": "rb",
      "languageType": "programming",
      "active": true,
      "properties": {
        "language": "javascript",
        "docs": true,
        "tutorials": true,
        "cheatsheets": true,
        "files": [
          {
            "name": "javascript.js",
            "content": test_answer.answer
          }
        ]
      },
      "visibility": "public",
      "_id": "3xvmmne9p",
      "user": nil
    })
    
    response = https.request(request)
    result = OpenStruct.new(JSON.parse(response.body))

    @test_answer.broadcast_append_to(@test_answer, target: "code-runner-output", html: "<p>#{result.exception || result.stdout}</p>".html_safe)
  end
end
