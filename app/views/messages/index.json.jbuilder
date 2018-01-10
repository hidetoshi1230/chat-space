json.name     @last_message.user.name
json.date     @last_message.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.body     @last_message.body
json.image    @last_message.image
json.id       @last_message.id
