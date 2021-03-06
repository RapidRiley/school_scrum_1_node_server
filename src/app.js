// Author: Riley Warps

const express = require("express")
const fs = require("fs")

const PORT = process.env.PORT
const data_dir = "/data/"

app = express()

app.get("/", (req, res) => {
    res.send("Test!")
})

app.get("/get-batch/:batch_id", (req, res) =>{
    fs.readFile(data_dir + req.params.batch_id + ".csv", 'utf8' , (err, data) => 
    {
        if (err) {
            res.sendStatus(404)
            return
        }
        res.send(data)
        return
    })
})

app.get("/get-hash/:batch_id", (req, res) =>{
    fs.readFile(data_dir + req.params.batch_id + ".md5", 'utf8' , (err, data) => 
    {
        if (err) {
            res.sendStatus(404)
            return
        }
        res.send(data)
        return
    })
})

app.get("/get-manifest", (req, res) => {
    fs.readFile(data_dir + "manifest.json", 'utf8' , (err, data) => 
    {
        if (err) {
            res.sendStatus(404)
            return
        }
        res.send(JSON.parse(data))
        return
    })
})

app.listen(PORT, () => {
    console.log("Listening on port " + PORT)
})