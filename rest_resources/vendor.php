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
	$con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
   
	$query = sprintf("SELECT description, timeslot, timeCreated, timeClosed FROM orders WHERE restaurantID='%s'",mysql_real_escape_string($restaurantID));
	$result = mysql_query($query, $con);
//	$ord["description"] = $row['description'];
	//$ord["timeslot"] = $row['timeslot'];
	//$ord["timeCreated"] = $row['timeCreated'];
	//$ord["timeClosed"] = $row['timeClosed'];
	 $dataset = array();
   
 while ($row = mysql_fetch_assoc($result)) 
 {
        $datarow = array();
        $datarow['description'] = $row['description'];
        $datarow['timeslot'] = $row['timeslot'];
		$datarow['timeCreated'] = $row['timeCreated'];
	$datarow['timeClosed'] = $row['timeClosed'];
	array_push($dataset, $datarow);
 }
 mysql_free_result($result);
  
 $status["data"]=$dataset;  
		
	
	$status["status"]=1;
	$status["session"]=1;
	
	echo json_encode($status);
		
?>