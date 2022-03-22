<?php include 'pages/includes/header.php'; ?>
<?php include 'pages/middleware/authMiddleware.php'; ?>
<section class="py-5">
  <div class="container overflow-auto">
    <table id="table_id" class="table table-striped table-responsive-sm">
      <thead class="">
        <tr>
          <th>Customer Name</th>
          <th>Product Item Quantity</th>
          <th>Total Price</th>
          <th>Product Discount</th>
          <th>Order Date</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>

        <?php
                if (count($orders) > 0) {
                    foreach ($orders as $order) { ?>
        <tr>
          <td><?= $order->first_name; ?></td>
          <td><?= $order->total_quantity; ?></td>
          <td><?= $order->total; ?></td>
          <td><?= $order->discount; ?></td>
          <td><?= date_format(date_create($order->created_at), "d/m/Y | h-m-s:a"); ?></td>
          <td>
            <div class="d-md-flex d-block justify-content-between align-items-center">
              <a href="action.php?action=view_<?= $order->id ?>" class="btn btn-sm btn-secondary">View</a>
              <a href="action.php?action=pending_<?= $order->id ?>" class="btn btn-sm btn-info">Pending</a>
              <a href="action.php?action=delivered_<?= $order->id ?>" class="btn btn-sm btn-primary">Delivered</a>
              <a href="action.php?action=delete_<?= $order->id ?>" class="btn btn-sm btn-danger">Delete</a>
            </div>
          </td>
        </tr>
        <?php }
                } else {
                } ?>

      </tbody>
    </table>
  </div>
</section>
<?php include "pages/includes/footer.php"; ?>
