namespace :test do
  task :init => [:environment] do
    test_data = [
      {
        title: "Recursive Function",
        description: <<-EOF
Please create a function solotion(p1, p2) by using a recursive function. This function must return a node having id that is matched with p2.
```
tree = {
  id: 1,
  tag: 'lobby',
  data: {
    title: 'Main Lobby'
  },
  children: [{
    id: 2,
    tag: 'request_action',
    data: {
      title: 'Fix it'
    },
    children: [{
        id: 3,
        tag: '',
        data: {
          title: 'Light'
        },
        children: []
      },
      {
        id: 4,
        tag: '',
        data: {
          title: 'Fan'
        },
        children: []
      }
    ]
  }]
}

const node = solution(tree, 4)
node.data // { title: 'Fan' }
```
EOF
      },
      {
        title: "Check Available Time",
        description: <<-EOF
Please create a function solotion(p1, p2) to check if the datetime is within startTime and endTime and which day of the week. This function must return either true or false.
```
const node = { 
          id: 1, 
          startTime: "22:00", 
          endTime: "02:00", 
          weekdayFrequency: [0,1,2,6] // available on day of the week, 
                                      // 0 => Sunday, .., 6 => Saturday
}

const datetime = new Date("2020-01-01T01:30:00Z")
const result = solution(node, datetime)
result // true
```
EOF
      }
    ]
    test_data.each do |data|
      
      test = Test.create(data)
      test.test_languages.create(
        language: "javascript", 
        placeholder: <<-EOF
const solution = (p1,p2) => {
  // your code goes here
}
EOF
      )
      test.test_languages.create(
        language: "ruby", 
        placeholder: <<-EOF
def solution(p1,p2)
  # your code goes here
end
EOF
      )      
    end
  end
end
