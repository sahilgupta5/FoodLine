
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
        //echo "Failed to connect to MySQL: " . mysqli_connect_error();
        $status["status"] = "-1";
    }
    elseif(!$con)
    {
        //echo "Database fail lol.";
        $status["status"] = "-1";
    }
    else
    {
        //echo "Connection Success!";
        $status["status"] = "0";
    }
    $sid = $_GET["sid"];
    $status["status"]="0";
   if(!isUser($sid))
    {
        echo "Not a user. Session not found.";
        goto endRequest;
    }
   
    //echo json_encode(array("status"=>1,"info"=>"asdasd","asd"=>"xxxxx"))."<br/>";
    
    $con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
    
    
    // session found, return infoz
    
    
    // Formulate Query
    // This is the best way to perform an SQL query
    // For more examples, see mysql_real_escape_string()
//    $query = sprintf("SELECT userID, password, firstname, lastname, phonenumber, photofilename FROM users WHERE email='%s'",
  //                   mysql_real_escape_string($username));
    //echo $query . "<br/>";
    // Perform Query
    	$query = "SELECT * FROM restaurants";
 //echo $query;
	$result = mysql_query($query, $con);      //returns userID
	//echo $row["name"];                
     // Check result
     // This shows the actual query sent to MySQL, and the error. Useful for debugging.
     if (!$result) {
	     $message  = 'Invalid query: ' . mysql_error() . "\n";
         $message .= 'Whole query: ' . $query;
         goto endRequest;
     }
     // Use result
     // Attempting to print $result won't allow access to information in the resource
     // One of the mysql result functions must be used
     // See also mysql_result(), mysql_fetch_array(), mysql_fetch_row(), etc.
    $dataset = array();
    while ($row = mysql_fetch_assoc($result)) {
        $datarow = array();
        $datarow["restaurantID"] = $row["restaurantID"];
        $datarow["name"] = $row["name"];
        $datarow["address"] = $row["address"];
        $datarow["gps_lat"] = $row["gps_lat"];
        $datarow["gps_lon"] = $row["gps_lon"];
        $datarow["description"] = $row["description"];
        $datarow["timeslots"] = $row["timeslots"];
        $datarow["limits"] = $row["limits"];
        $datarow["openTime"] = $row["openTime"];
        $datarow["closeTime"] = $row["closeTime"];
        //print_r($row);
        array_push($dataset, $datarow);
    }
	
	
    
	mysql_free_result($result);
    $status["data"]=$dataset;
    function isUser($sid)
    {
	
        $con=mysql_connect("localhost","root","");
        $db = mysql_select_db("mydb", $con);
        //now connected and sent correct credentials, check to see if a session already exists
        $query = sprintf("SELECT sessionID, userID FROM sessions WHERE sessionID='%s'",
                         mysql_real_escape_string($sid) );
                         // Perform Query
        $result = mysql_query($query, $con);      //returns userID
        $count = 0;
		if($result)
        {
			
            while ($row = mysql_fetch_assoc($result)) {
               $count = $count+1;
            }
        }
      //  echo ($count == 1);
        mysql_free_result($result);
        mysql_close($con);
        
        return $count == 1;
     }
    
    mysql_close($con);
	endRequest:
    echo json_encode($status);
    
    ?>