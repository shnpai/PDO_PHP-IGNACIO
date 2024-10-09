<?php require_once 'core/dbConfig.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<style>
        body {
            font-family: Arial, sans-serif;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 70%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

    </style>
<body>
    <?php 



   
// 3. Selecting rentals with customer details and vehicle information
//$stmt = $pdo->prepare("
//    SELECT 
//        customers.first_name AS customer_first_name, 
 //       customers.last_name AS customer_last_name, 
//        rentals.rental_start_date AS start_date, 
//        rentals.rental_end_date AS end_date, 
//        vehicles.model_name AS vehicle_model, 
//        rental_location.branch_name AS rental_branch, 
//        rentals.rental_cost AS cost
//    FROM 
//        rentals
//    INNER JOIN customers ON rentals.customer_id = customers.customer_id
//    INNER JOIN vehicles ON rentals.vehicle_id = vehicles.vehicle_id
//    INNER JOIN rental_location ON rentals.rental_location_id = rental_location.rental_location_id
 //   INNER JOIN payments ON rentals.rental_id = payments.rental_id
//    WHERE 
//        payments.rental_is_paid = FALSE
//");

// Execute and fetch the results
//if ($stmt->execute()) {
 //   echo "<pre>";
  //  print_r($stmt->fetchAll());
  //  echo "</pre>";
//}



    // 4. Calculate and display the total amount paid by each customer.

//$query = "
//    SELECT 
//        customers.first_name AS customer_first_name,
//        customers.last_name AS customer_last_name,
//        SUM(payments.amount_paid) AS total_paid
//    FROM 
//        customers
//    INNER JOIN rentals ON customers.customer_id = rentals.customer_id
//    INNER JOIN payments ON rentals.rental_id = payments.rental_id
//    GROUP BY 
//        customers.customer_id
//";

//$stmt = $pdo->prepare($query);

//if ($stmt->execute()) {
//    $total_paid = $stmt->fetchAll();
//    echo "<pre>";
//    print_r($total_paid);
 //   echo "</pre>";
//}

    // 5. Insert a new vehicle into the vehicle table
  //  $query = "INSERT INTO vehicles (manufacturer_name, model_name, year_of_manufacture, licence_plate, vehicle_type, 
  //  rental_price_per_day, mileage, vehicle_is_available) 
  //  VALUES (?,?,?,?,?,?,?,?)";

  //  $stmt = $pdo->prepare($query);
    
    // Execute the insertion with values
 //   $executeQuery = $stmt->execute([
 //       'Nissan',         
 //       'Altima',        
 //       2023,            
 //       'XYZ9876',       
 //       'Sedan',         
 //       55.00,           
 //       10890,           
 //      TRUE              
 //   ]);
    
    // Check if the query was successful
 //   if ($executeQuery) {
 //       echo "Query successful!";
 //   } else {
//      echo "Query failed";
 //   }

    // 6. Delete a rental record with a rental id = 3
 //   $query = "DELETE FROM rentals 
 //   WHERE rental_id = 3
 //   ";

//$stmt = $pdo->prepare($query);

// Execute the deletion
//$executeQuery = $stmt->execute();

//if ($executeQuery) {
//echo "Deletion successful!";
//} else {
//echo "Query failed";
//}

    // 7. Update the rental cost for a rental record with a rental id = 4

//$query = "UPDATE rentals 
//SET rental_cost = ?
//WHERE rental_id = 4
//";

//$stmt = $pdo->prepare($query);

// Execute the update with the new rental cost
//$executeQuery = $stmt->execute([400.00]); // new rental cost

//if ($executeQuery) {
//echo "Update successful!";
//} else {
//echo "Query failed";
//}


//8. Retrieve the count of rentals per vehicle type

// Prepare the SQL query
$query = "SELECT
           CASE 
                WHEN vehicle_type = 'Sedan' THEN 'Sedan Vehicles'
                WHEN vehicle_type = 'SUV' THEN 'Sport Utility Vehicles'
                WHEN vehicle_type = 'Truck' THEN 'Trucks'
                WHEN vehicle_type = 'Van' THEN 'Vans'
                ELSE 'Other Vehicles'
            END AS vehicle_type_description,
           COUNT(*) AS rentalCount
          FROM rentals
          JOIN vehicles ON rentals.vehicle_id = vehicles.vehicle_id
          GROUP BY vehicle_type_description  -- Changed from vehicle_type to vehicle_type_description
          ORDER BY rentalCount DESC;";

$stmt = $pdo->prepare($query);

// Execute the query
$executeQuery = $stmt->execute();

if ($executeQuery) {
    $rentalCounts = $stmt->fetchAll();
} else {  // Fixed the syntax error here
     echo "Query failed";
}
?>

<table border="1">
  <tr>
        <th>Vehicle Type</th>
        <th>Rental Count</th>
    </tr>
    <?php foreach ($rentalCounts as $row) { ?>
    <tr>
        <td><?php echo htmlspecialchars($row['vehicle_type_description']); ?></td> <!-- Used htmlspecialchars for safety -->
        <td><?php echo htmlspecialchars($row['rentalCount']); ?></td> <!-- Used htmlspecialchars for safety -->
    </tr>
    <?php } ?>
</table>

</body>
</html>