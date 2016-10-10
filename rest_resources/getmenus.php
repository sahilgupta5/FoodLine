
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
       // echo "Database fail lol.";
        $status["status"] = "-1";
    }
    else
    {
     //   echo "Connection Success!";
        $status["status"] = "0";
    }
    
    
    // take user and pass values from login page
    $sid = $_GET["sid"];
    $rid = $_GET["rid"];
    
	if(!isUser($sid))
    {
       echo "Not a user. Session not found.";
     goto endRequest;
    }
	   $con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
 	
    // session found, return infoz
    $status["status"]="0";
    // Formulate Query
    // This is the best way to perform an SQL query
    // For more examples, see mysql_real_escape_string()
    $query = sprintf("SELECT menuID, menuJSON, name FROM menus WHERE restaurantID=%s",
                     mysql_real_escape_string($rid) );
    //echo $query . "<br/>";
    // Perform Query
    //echo $query."<br/>";
    //echo $sid."<br/>";
    
    $result = mysql_query($query, $con);      //returns userID
                     
     // Check result
     // This shows the actual query sent to MySQL, and the error. Useful for debugging.
     if (!$result) {
         $message  = 'Invalid query: ' . mysql_error() . "\n";
         $message .= 'Whole query: ' . $query;
         echo $message;
         goto endRequest;
     }
    
    $dataset = array();
    while ($row = mysql_fetch_assoc($result)) {
        $datarow = array();
        $datarow["menuID"] = $row["menuID"];
        $datarow["name"] = $row["name"];
        $datarow["menuJSON"] = $row["menuJSON"];
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