/*
!!YOU MAY NOT USE THIS WITHOUT OPEN SOURCING IT (THIS INCLUDES ANY CODE YOU ADD/MODIFY)!!
This is just for learning, you may not use this in production without open sourcing it.

Inspired by Aztup's open source whitelist
*/

/*
Copyright 2021 0x37

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

const APIKey = 'apikey' // add this to your env and dont leak it yes
const mongodbConnectionString = 'connection str here'

const cryptLib = require('crypto') // For hashing
const mongoose = require('mongoose') // For database, I usually use MySQL but this is for a v3rm post
const express = require('express') // For the http server, so we dont have to use yucky http package
const wlModel = require('./whitelistModel') // Whitelist database

// sha256 hash function
const hash = (str) => {
    return cryptLib.createHash('sha256').update(str).digest('hex')
}

// mongodb stuffs
mongoose.connect(mongodbConnectionString, {
    useUnifiedTopology: true,
    useNewUrlParser: true
}).then(() => {
    console.log('connected to db')
})

// web application
const app = express()

app.get('/checkwl/:rand/:auth', async (req, res) => {
    const rand = req.params.rand
    const authKey = req.params.auth
    const toSend = hash(rand + 'request' + rand + 'table.foreach' + rand + 'FindFirstChild' + authKey)
    if (!rand || !authKey) return res.status(400).send('Invalid Request Params.')
    const authData = await wlModel.findOne({
        AuthKey: authKey
    })
    if (!authData) return res.status(403).send('Invalid Key Provided.')
    return res.status(200).send(toSend)
})

app.get('/addwl/:apiKey/:discordId', async (req, res) => {
    const apiKey = req.params.apiKey
    const discordId = req.params.discordId
    if (!apiKey || !discordId) return res.status(400).send('Invalid Request Params')
    if (apiKey !== APIKey) return res.status(403).send('API key invalid')
    const authData = await wlModel.findOne({
        DiscordID: discordId
    })
    if (authData) return res.status(400).send('User Already Whitelisted')
    new wlModel({
        DiscordID: discordId,
        AuthKey: hash(Math.random().toString(16).substr(2, 14) + Date.now).substr(1, 16)
    }).save()
    return res.status(200).send('Success')
})

app.listen(8080, console.log('app loaded'))