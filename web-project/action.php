<?php

require_once 'vendor/autoload.php';

use App\classes\ProductUpload;
use App\classes\Auth;
use App\classes\Registration;

if (!isset($_COOKIE['u_id'])) {
    $u_id = uniqid('chaldal') . "_" . date('Y_m_d_h_m_s_a');
    setcookie('u_id', $u_id, time() + 60 * 60 * 24);
}

//locale_set_default('Asia/Dhaka');
if (isset($_GET["pages"])) {
    if ($_GET["pages"] == "view-products") {
        $product = new \DB\model\product();
        $products = $product->index();
        include 'pages/viewProducts.php';
    } elseif ($_GET["pages"] == 'add_product') {
        include 'pages/productsUpload.php';
    } elseif ($_GET["pages"] == 'home') {
        $product = new \DB\model\product();
        $products = $product->index();
        include 'pages/home.php';
    } elseif ($_GET["pages"] == 'cart') {
        $cart = new \DB\model\Cart();
        $carts = $cart->cart_list();
        include 'pages/cart.php';
    } elseif ($_GET["pages"] == 'admin_order') {
        $order = new \DB\model\Order();
        $orders = $order->total_order();
        include 'pages/admin_order.php';
    } elseif ($_GET["pages"] == 'login') {
        include 'pages/login.php';
    } elseif ($_GET["pages"] == 'registration') {

        include 'pages/register.php';
    } elseif ($_GET["pages"] == 'logout') {
        $auth = new Auth();
        $auth->logout();
    } else {
        include 'pages/home.php';
    }
} else if (isset($_POST)) {
    if (isset($_POST['btn'])) {
        if (strlen($_POST['name']) > 0 && strlen($_POST['description']) > 0 && strlen($_POST['price']) > 0 && ($_FILES['image'] && strlen($_FILES['image']['name']) > 0)) {
            $fileUpload = new ProductUpload($_POST, $_FILES);
            $message = $fileUpload->addProduct();
        } else {
            $errorMessage = "Please fill all the fields";
        }

        include 'pages/productsUpload.php';
    } elseif (isset($_POST['registerBtn'])) {
        $register = new Registration();
        $register->createUser($_POST);
        include 'pages/login.php';
    } elseif (isset($_POST['add_to_cart'])) {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST['cart_id']) {
            $cart = new \DB\model\Cart();
            $cart->add_to_cart($_POST['cart_id']);
            echo '<div class="alert alert-info alert-dismissible fade show" role="alert">
                <strong>Added to Cart Successfully!</strong>
            </div>';
        }
        $product = new \DB\model\product();
        $products = $product->index();
        include 'pages/home.php';
    } elseif (isset($_POST['delete_product_by_admin'])) {
        if ($_SERVER["REQUEST_METHOD"] == "POST" && $_POST['pid']) {
            $cart = new \DB\model\product();
            $cart->delete($_POST['pid']);
            echo '<div class="alert alert-info alert-dismissible fade show" role="alert">
                 <strong>Product Deleted Successfully</strong>
            </div>';
        }

        $product = new \DB\model\product();
        $products = $product->index();
        include 'pages/viewProducts.php';
    } elseif (isset($_POST['oder_now'])) {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $order = new \DB\model\Order();
            $info = (object) $_POST;
            if (
                isset($info->first_name) && isset($info->last_name) && isset($info->email) &&
                isset($info->division) &&
                isset($info->city) &&
                isset($info->zip) &&
                isset($info->address) &&
                isset($info->terms)
            ) {
                $status = $order->make_order($info->first_name, $info->last_name, $info->email, $info->division, $info->city, $info->zip, $info->address, $info->terms == "on" ? true : false);
            } else {
                $errorMessage = "Please fill all the fields";
            }
            include 'pages/cart.php';
        }
    } elseif (isset($_POST['loginBtn'])) {

        $auth = new Auth($_POST);

        $message = $auth->login();

        include 'pages/login.php';
    } else {
        $home = new \App\classes\Home();
        $home->index();
    }
}
