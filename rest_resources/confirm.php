<?php
    
    error_reporting(E_ERROR);
    
    // Create connection
    //hostname: localhost
    //username: root
    //password:
    //dbname: mydb
	if (!$con=mysql_connect("localhost","root","")) 
	{
		die("Could not connect: ".mysql_error());
	}
    $con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
    
    $status = array("status"=>"-1",
                    "session"=>"0",
                    "data"=>"{}");
    
    // Check connection
    if (mysqli_connect_errno())
    {
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
        $status["status"] = "-1";
    }
    elseif(!$con)
    {
        echo "Database fail lol.";
        $status["status"] = "-1";
    }
    else
    {
 //       echo "Connection Success!";
        $status["status"] = "0";
	}
	
	$restaurantID = $_GET["rid"];   
	$userID = $_GET["email"];
	$con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
   
	$query = sprintf("SELECT orderID, description FROM orders WHERE restaurantID='%s' && email='%s' ORDER BY timeCreated DESC LIMIT 1",mysql_real_escape_string($restaurantID),mysql_real_escape_string($userID));
	//echo $query;
	$result = mysql_query($query, $con);
	$row = mysql_fetch_assoc($result);
	$desc = $row['description'];
	$session["status"]=1;
	$session["session"]=1;
	$session["data"]=$desc;
	
	echo json_encode($session);
		
?>