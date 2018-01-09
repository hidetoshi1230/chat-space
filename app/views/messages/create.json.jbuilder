json.name @message.user.name
json.date @message.created_at.strftime("%Y-%m-%d %H:%M:%S")
json.image @message.image
json.body @message.body
json.id   @message.id
