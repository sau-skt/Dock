const express = require("express")
const app = express();

app.get("/", (req, res)=> {
    res.json([
        {
            id:1,
            name: "Saurabh",
            age: 28
        }
    ])
})

app.listen(3000,()=>{
    console.log("app is running on 3000 port")
})