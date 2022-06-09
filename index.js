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

app.put('/car/:id', async (req, res) => {
    try {
        const { id } = req.params;
        const car = await pool.query("SELECT car_list.car_id, car_list.brand_name, car_model.model_group_name, car_list.car_year, car_list.price, car_list.credit_price, seller_profile.user_id, seller_profile.username, seller_profile.phone, car_list.posting_at FROM car_list INNER JOIN seller_profile ON car_list.user_id = seller_profile.user_id INNER JOIN car_model ON car_list.model_id = car_model.model_id WHERE car_list.car_id = $1;", [id]);
        
        var { brand_name, car_year } = req.body;
        if(brand_name == "") {
            brand_name = car.rows[0].brand_name;
        } else if(car_year == "") {
            car_year = parseInt(car.rows[0].car_year);
        }
        
        const updateCar = await pool.query("UPDATE car_list SET brand_name = $1, car_year = $3 WHERE car_id = $2", [brand_name, id, car_year]);
        res.json("Car was updated");
    } catch (err) {
        console.error(err.message);
    }
})

app.delete('/car/:id', async (req, res) => {
    try {
        const { id } = req.params;
        
        const deleteCar = await pool.query("DELETE FROM car_list WHERE car_id = $1", [id]);
        res.json("Car was deleted");
    } catch (err) {
        console.error(err.message);
    }
})

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})
