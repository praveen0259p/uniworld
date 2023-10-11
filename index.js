const express = require('express')
const bodyParser = require('body-parser');
const app = express()
const port = 3000;
const mysql = require('mysql')
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'uniworld'
})

connection.connect()
app.use(bodyParser.json());

app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.post('/createOrder',(req,res)=>{
   const name= req.body.customer_name;
   const email=req.body.customer_email;
   const items=req.body.items;
   items.forEach((element,index, array) => {
      //console.log("index===",index);
      connection.query('SELECT * FROM products_table where product_id= ?',[element.product_id],(err, rows, fields) => {
         if (err) throw err; 
         if(rows.length >0)
         {  
            //console.warn(rows[0]['stock_quantity']);
            if(element.quantity<=rows[0]['stock_quantity'])
            {  //insert query code will be written here 
               console.log('Requested Product Quantity is available in stock and requested quantity is: ', element.quantity);
            }   
            else{
               console.log('Requested Product Quantity is unavailable in stock and requested quantity is: ', element.quantity);
            }
         }else{
            console.log('Product id not Found:'); 
         }
        
       })
  });
   res.send('create order function called');
})

app.get('/calculatesquare',(req,res)=>{
   const numbers = [1,2,3,4,5,6,7,8,9,10];
   const squaredNumbers =numbers.map((num)=>num*2);
   const sumOfSquaredEvennumbers=squaredNumbers.reduce((acc,num)=>{
      if((num/2) % 2 === 0)
      {  return acc+(num/2*num/2);}
      return acc;
   },0);
   console.warn("Sum of even numbers=====:",sumOfSquaredEvennumbers);
   res.send('Sum of Given Array='+sumOfSquaredEvennumbers);
})
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
//first point answer
/*SELECT username,email,products_table.price*order_items_table.quantity AS total_amount_spent FROM `users_table` INNER join orders_table on users_table.user_id=orders_table.user_id INNER join order_items_table on order_items_table.order_id=orders_table.order_id INNER join products_table on products_table.product_id=order_items_table.product_id;*/
// for second point pls check route /calculate square

// for third point pls check the route /createOrder with postman as raw json data
/*for ex {
   "customer_name":"Praveen Kumar",
   "customer_email":"raveenkumar7272@gmail.com",
   "items":[{
       "product_id":"112233403384",
       "quantity": "40"
   },
   {"product_id":"112233403382",
       "quantity": "16"
   }]
}*/