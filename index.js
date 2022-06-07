const express = require("express");
const app = express();
const port = 3000;
const pool = require("./db");

app.use(express.json());

app.get('/car/:id', async(req, res) => {
    const {id} = req.params
    try {
        const car = await pool.query("SELECT car_list.car_id, car_list.brand_name, car_model.model_group_name, car_list.car_year, car_list.price, car_list.credit_price, seller_profile.user_id, seller_profile.username, seller_profile.phone, car_list.posting_at FROM car_list INNER JOIN seller_profile ON car_list.user_id = seller_profile.user_id INNER JOIN car_model ON car_list.model_id = car_model.model_id WHERE car_list.car_id = $1;", [id]);
        
        res.json(car.rows[0]);
    } catch (err) {
        console.log(err);
    }
})

app.get('/car_credit/:id', async(req, res) => {
    const {id} = req.params
    try {
        const credit_list = await pool.query("SELECT car_list.car_id, car_list.brand_name, dp, tenor, installment_per_month FROM kredit INNER JOIN car_list ON car_list.car_id = kredit.car_id WHERE car_list.car_id = $1", [id]);
        
        res.json(credit_list.rows);
    } catch (err) {
        console.log(err);
    }
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
