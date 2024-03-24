
<?php
session_start();
include("../db.php");

error_reporting(0);
if(isset($_GET['action']) && $_GET['action']!="" && $_GET['action']=='delete')
{
$order_id=$_GET['order_id'];

/*this is delet query*/
mysqli_query($con,"delete from orders where order_id='$order_id'")or die("delete query is incorrect...");
} 

///pagination
$page=$_GET['page'];

if($page=="" || $page=="1")
{
$page1=0;	
}
else
{
$page1=($page*10)-10;	
}

include "sidenav.php";
include "topheader.php";
?>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <!-- your content here -->
          <div class="col-md-14">
            <div class="card ">
              <div class="card-header card-header-primary">
                <h4 class="card-title">Orders  / Page <?php echo $page;?> </h4>
              </div>
              <div class="card-body">
                <div class="table-responsive ps">
                <table class="table table-hover tablesorter" id="">
    <thead class="text-primary">
        <tr>
            <th>Customer Name</th>
            <th>Products</th>
            <th>Contact | Email</th>
            <th>Address</th>
            <th>Details</th>
            <th>Quantity</th>
            <th>Time</th>
            <th>Action</th> <!-- Added a missing header -->
        </tr>
    </thead>
    <tbody>
        <?php
        $result = mysqli_query($con, "SELECT order_id, product_title, first_name, mobile, email, 
                                      address1,address2, product_price, address2, qty 
                                      FROM orders, products, user_info 
                                      WHERE orders.product_id = products.product_id 
                                      AND user_info.user_id = orders.user_id 
                                      LIMIT $page1, 10") 
                                      or die("query 1 incorrect.....");

        while ($row = mysqli_fetch_assoc($result)) {
            echo "<tr>
                    <td>{$row['first_name']}</td>
                    <td>{$row['product_title']}</td>
                    <td>{$row['email']}<br>{$row['mobile']}</td>
                    <td>{$row['address1']}<br>ZIP: {$row['address2']}<br>{$row['address2']}</td>
                    <td>{$row['product_price']}</td>
                    <td>{$row['qty']}</td>
                    <td>{$row['time']}</td>
                    <td>
                        <a class='btn btn-danger' href='orders.php?order_id={$row['order_id']}&action=delete'>Delete</a>
                    </td>
                </tr>";
        }
        ?>
    </tbody>
</table>

                  
                <div class="ps__rail-x" style="left: 0px; bottom: 0px;"><div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div></div><div class="ps__rail-y" style="top: 0px; right: 0px;"><div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div></div></div>
              </div>
            </div>
          </div>
          
        </div>
      </div>
      <?php
include "footer.php";
?>