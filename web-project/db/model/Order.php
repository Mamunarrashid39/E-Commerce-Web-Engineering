<?php

namespace DB\model;

use DB\db;
use mysqli;

class Order extends db
{
    public function make_order($first_name, $last_name, $email, $division, $city, $zip, $address, $terms, $discount = 0)
    {
        $uid = $_COOKIE['u_id'];
        try {
            $total_query = "SELECT SUM(products.price) as total from cart INNER JOIN products on products.id=cart.product_id where u_id='$uid'";

            $res = mysqli_query($this->conn, $total_query);

            $total = mysqli_fetch_assoc($res)['total'];

            $query = "INSERT INTO `orders`(`first_name`, `last_name`, `email`, `division`, `city`, `zip`, `address`, `terms`, `total`, `discount`) VALUES ('$first_name','$last_name', '$email', '$division', '$city', '$zip', '$address', $terms, $total, $discount)";
            $status = mysqli_query($this->conn, $query);
            $id = mysqli_insert_id($this->conn);
            if ($status) {
                $cart = new Cart();
                $order_query = '';
                foreach ($cart->cart_list() as $value) {
                    $order_query .= "INSERT INTO `order_product`(`order_id`, `product_id`, `quantity`) VALUES ($id,$value->product_id,$value->quantity);";
                }
                $res = mysqli_multi_query($this->conn, $order_query);
                if ($res) {
                    if ($cart->delete()) {
                        return true;
                    }
                }
            }
        } catch (\Exception $exception) {
            echo "<pre>";
            print_r($exception);
            echo "</pre>";
        }
        return false;
    }

    public function total_order()
    {
        $result = [];
        $total_order_all = "SELECT orders.*, SUM(order_product.quantity) as total_quantity,order_product.order_id FROM `orders` JOIN order_product on orders.id=order_product.order_id group by orders.id order by orders.created_at desc";
        $res = mysqli_query($this->conn, $total_order_all);
        if (mysqli_num_rows($res) > 0) {
            while ($row = mysqli_fetch_assoc($res)) {
                array_push($result, (object)$row);
            }
            return $result;
        }
        return [];
    }
}
