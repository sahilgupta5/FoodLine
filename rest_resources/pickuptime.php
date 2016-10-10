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
	$timeSlot = $_GET["timeslot"];
	$con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
   
	$query = sprintf("SELECT COUNT(orderID) FROM orders WHERE restaurantID='%s' && timeslot='%s'",mysql_real_escape_string($restaurantID),mysql_real_escape_string($timeSlot));
	$result = mysql_query($query, $con);
	$row = mysql_fetch_assoc($result);
	//print_r ($row);
	$count = $row['COUNT(orderID)'];
	//echo $count;
	
	$query = sprintf("SELECT timeslots, limits FROM restaurants WHERE restaurantID='%s'",mysql_real_escape_string($restaurantID));
	$result = mysql_query($query, $con);
	$row = mysql_fetch_assoc($result);
	//print_r ($row);
	$limits = $row['limits'];
	$ts = $row['timeslots'];
	//echo $limits;
	//echo $ts;
	//$count =15;
	//echo $timeSlot;
	if(($count<$limits)==1)
	{
		$session["status"]=1;
		$session["session"]=1;
		$session["data"]=1;
	}
	
	else
	{
		$session["status"]=1;
		$session["session"]=1;
		$session["data"]=0;
		$i = $timeSlot;
		//echo ($i);
		while($i < $ts)
		{
			$i=$i+1;
			$query = sprintf("SELECT COUNT(orderID) FROM orders WHERE restaurantID='%s' && timeslot='%s'",mysql_real_escape_string($restaurantID),mysql_real_escape_string($i));
			$result = mysql_query($query, $con);
			$row = mysql_fetch_assoc($result);
			$ct = $row['COUNT(orderID)'];
			if($ct<$limits)
			{
				if($session["value"] == null)
				{
					$session["value"] = $i;			
				}
				else
				{
					$session["value"] = $session["value"] . ', ' . $i;
				}
			}
			
		}
	}
	//echo mysql_num_rows($result);
	echo json_encode($session);
?>