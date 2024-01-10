const express = require("express");
const mongoose = require("mongoose");
const User =require('./user');
const app = express();
const mongdb = require("mongodb");
const DB = "mongodb+srv://sangram31200431:Sangram31@cluster1.mmrrxhf.mongodb.net/?retryWrites=true&w=majority";
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

var  sample ;
var respo;

app.post('/task',async(req,res)=>{
     const {task}=  req.body;
    console.log(task);
    // const response = "server recived";
    // res.send(response);
    let StoreinDB= new User({task})
    StoreinDB = await StoreinDB.save();
    console.log(StoreinDB);
    res.json(StoreinDB.task);





});
app.get("/all",async(req,res)=>{
    let user =await  User.find();
    
    console.log(user);
    res.json(user);
 
})

app.get('/countEntries', async (req, res) => {
    try {
      const count = await User.countDocuments({});
      res.json({ count });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });

app.post('/delete',async(req,res)=>{
    
    console.log(condition);
    const item = req.body;
    const sucess = await User.deleteOne(item);
    console.log(sucess.body);
})
app.listen(4000,()=>{
    console.log("connected port");
});
