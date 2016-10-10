
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
        //echo "Connection Success!";
        $status["status"] = "0";
    }
    
    
    // take user and pass values from login page
    
	$sid = $_GET["sid"];
	$rid = $_GET["rid"];
	$details=$_POST["details"];
	//echo $details;
    $timeslot = $_GET["timeslot"];
	$timeCreated = $_GET["timeCreated"];
	$timeClosed = $_GET["timeClosed"];
	$email = $_GET["email"];
	//echo $sid;
	//echo $rid;
	//echo $details;
	//echo $timeslot;
	//echo $timeCreated;
	//echo $timeClosed;
	//echo $email;
	if($timeClosed)
	{
	
	}
	else
	{
		$timeClosed =0;
	}
//	echo $timeClosed;
	if(!isUser($sid))
    {
        echo "Not a user. Session not found.";
        goto endRequest;
    }
    $status["status"]="0";
    $userid = getUserID($sid);
  //  echo $userid;
    // session found, return infoz
    // Formulate Query
    // This is the best way to perform an SQL query
    // For more examples, see mysql_real_escape_string()
	$con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
    
	$query = sprintf("INSERT INTO orders (email, restaurantID, timeCreated, description, timeClosed, timeslot) VALUES ('%s', '%s', '%s', '%s', '%s', '%s')",mysql_real_escape_string($email),mysql_real_escape_string($rid),mysql_real_escape_string($timeCreated),mysql_real_escape_string($details),mysql_real_escape_string($timeClosed),mysql_real_escape_string($timeslot));
   //echo $query . "<br/>";
    // Perform Query
    //echo $query."<br/>";
    //echo $sid."<br/>";
    $con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
    $result = mysql_query($query, $con);      //returns userID
   //echo $query;
   //echo $result;                 
     // Check result
     // This shows the actual query sent to MySQL, and the error. Useful for debugging.
     if (!$result) {
         $message  = 'Invalid query: ' . mysql_error() . "\n";
         $message .= 'Whole query: ' . $query;
         //echo $message;
         goto endRequest;
     }
    
    
    mysql_free_result($result);
    $status["status"] = "1";
    
    
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
        
        mysql_free_result($result);
        mysql_close($con);
        
        return $count == 1;
     }
    function getUserID($sid)
    {
        $con=mysql_connect("localhost","root","");
        $db = mysql_select_db("mydb", $con);
        //now connected and sent correct credentials, check to see if a session already exists
        $query = sprintf("SELECT userID FROM sessions WHERE sessionID='%s'",
                         mysql_real_escape_string($sid) );
        // Perform Query
        $result = mysql_query($query, $con);      //returns userID
        $uid = "";
        if($result)
        {
            $row = mysql_fetch_assoc($result);
            
			$uid = $row["userID"];
		}
        
        mysql_free_result($result);
        mysql_close($con);
        
        return $uid;
    }
    
    
    
    
    // Free the resources associated with the result set
    // This is done automatically at the end of the script
    mysql_close($con);
                     
    function loginOK($sts)
    {
        //echo "{session:" . $sessid . "}";
        
    }
    /*
    function loginFailed($msg)
    {
        die("<span style=\"color: red;\">Login Failed! " . $msg ."</span>");
        
        //die();
    }
     */
    
endRequest:
    echo json_encode($status);
    
    
    ?>