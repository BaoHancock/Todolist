const mongoose = require("mongoose");
const DB = "Enter your DB url";

 mongoose.connect(DB).then(()=>{
    console.log("connection succesfful through database");
})

const UserScheme = new mongoose.Schema({
   task:{
        type :String ,
        required :true,
    },
   
},




)
const UserModel = mongoose.model('Data',UserScheme);
module.exports = UserModel;

