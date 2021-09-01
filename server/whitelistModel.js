const {model, Schema} = require('mongoose')

const schema = new Schema({
    DiscordID: String,
    AuthKey: String
})

module.exports = model('whitelistedUsers', schema, 'users')