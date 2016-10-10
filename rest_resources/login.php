
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
    
    //echo json_encode(array("status"=>1,"info"=>"asdasd","asd"=>"xxxxx"))."<br/>";
    
    // take user and pass values from login page
    $username = $_POST["email"];   // is the email
    $passhash = $_POST["pass"];
    //echo "before";
    if(strlen($username) == 0)
    {
        $username = $_GET["email"];   // is the email
        $passhash = $_GET["pass"];
    }
    
    if(strlen($username) == 0 || strlen($passhash) == 0)
    {
       loginFailed("no credentials.");
        goto endRequest;
    }

    
    // Formulate Query
    // This is the best way to perform an SQL query
    // For more examples, see mysql_real_escape_string()
   $query = sprintf("SELECT userID, password, firstname, lastname, phonenumber, photofilename, vendorID FROM users WHERE email='%s'",
                   mysql_real_escape_string($username));
    //echo $query . "<br/>";
    // Perform Query
  //  	$query = "SELECT * FROM restaurants";
 //echo $query;
	$result = mysql_query($query, $con);      //returns userID
//	$row = mysql_fetch_assoc($result);
	//echo $row["name"];                
     // Check result
     // This shows the actual query sent to MySQL, and the error. Useful for debugging.
     if (!$result) {
	     $message  = 'Invalid query: ' . mysql_error() . "\n";
       //  $message .= 'Whole query: ' . $query;
     	 loginFailed($message);
		      $staus["status"]=0;
	
     }
    
     // Use result
     // Attempting to print $result won't allow access to information in the resource
     // One of the mysql result functions must be used
     // See also mysql_result(), mysql_fetch_array(), mysql_fetch_row(), etc.
    $row = mysql_fetch_row($result);
    if(!$row)
    {
	     $staus["status"]=0;
	
        loginFailed();
        goto endRequest;
    }
    
    $uid = $row[0];  //userID
    $pass = $row[1]; //password
    $user_data = array();
    mysql_free_result($result);
    
    //echo "{userID:".$uid.", <br/>password:".$pass."}";
    
    // query OK...
    //userID found
    $userOK = false;
    if($passhash == $pass)
    {
        //echo "<span style=\"color: green\">SUCCESS!</span>";
        $userOK = true;
        
        $user_data["userID"] = $row[0];
        $user_data["firstname"] = $row[2];
        $user_data["lastname"] = $row[3];
        $user_data["phonenumber"] = $row[4];
        $user_data["email"] = $username;
        $user_data["photoURL"] = $row[5];
        $user_data["vendorID"] = $row[6];
        
        $status["data"] = $user_data;
    }
    else{
        //user not found, login FAIL
        //loginFailed("Passfail. entered: ".$passhash." DB:".$pass);
        goto endRequest;
    }
    
    
    
    //now connected and sent correct credentials, check to see if a session already exists
    $query = sprintf("SELECT sessionID, startTime, lastActivityTime FROM sessions WHERE userID='%s'",
     mysql_real_escape_string($uid));
     // Perform Query
     $result = mysql_query($query, $con);      //returns userID
	//echo mysql_fetch_row($result);
                     
    $sessid = uniqid();
     // Check result
     // session not found, new session.
     $row = mysql_fetch_row($result);
    if(!$row){
		
	  createSession($sessid,$uid, $status);
        //echo "<br/>session created: " . $sessid . "<br/>";
        $status["session"]=$sessid;
        $status["status"] = "1";
     }
    else
     {
		
            //session found, check if expired.
         //print_r($row);
         $lat = strtotime($row[2]); //last activity time
     
		 //echo "<br/>lat: " . date($lat) . "<br/>";
         if( (time()-(60*60*24)) < $lat )  //if last active within last day
         {
			
			// already logged in...
             //get sessionID and return it
             //echo "<br/>session found: ".$row[0]."<br/>";  //sessionID
             $status["session"]=$row[0];
             $status["status"] = "1";
         }
         else
         {
             // session was expired, create new one
             $sessid = $row[0];  //sessionID
            
			updateSession($sessid, $uid, $status);
             $status["status"] = "1";
				
             //echo "<br/>session refreshed: " . $sessid . "<br/>";
         }
     }
    mysql_free_result($result);
    
    function updateSession($sid, $uid, $sts)
    {
        $con=mysql_connect("localhost","root","");
        $db = mysql_select_db("mydb", $con);
        //now connected and sent correct credentials, check to see if a session already exists
        $query = sprintf("UPDATE sessions SET sessionID='%s', startTime='%s', lastActivityTime='%s' WHERE userID='%s'",
                         mysql_real_escape_string($sid),
                         /*insert both dates as now*/
                         mysql_real_escape_string(date("Y-m-d H:i:s")),
                         mysql_real_escape_string(date("Y-m-d H:i:s")),mysql_real_escape_string($uid));
                         // Perform Query
        $result = mysql_query($query, $con);      //returns userID
        //echo $result;
		mysql_close($con);
        
        $sts["session"]=$sid;
     }
     function createSession($sid, $uid, $sts)
     {
         $con=mysql_connect("localhost","root","");
         $db = mysql_select_db("mydb", $con);
                     //now connected and sent correct credentials, check to see if a session already exists
         $query = sprintf("INSERT INTO sessions (sessionID, userID, startTime, lastActivityTime) VALUES ('%s', '%s', '%s', '%s')",
                          mysql_real_escape_string($sid),
                          mysql_real_escape_string($uid),
                          /*insert both dates as now*/
                          mysql_real_escape_string(date("Y-m-d H:i:s")),
                          mysql_real_escape_string(date("Y-m-d H:i:s")) );
          // Perform Query
         $result = mysql_query($query, $con);      //returns userID
         mysql_close($con);
         $sts["session"]=$sid;
      }
    
    
    
    // Free the resources associated with the result set
    // This is done automatically at the end of the script
    mysql_close($con);
                     
    function loginOK($sts)
    {
        //echo "{session:" . $sessid . "}";
        
    }
    function loginFailed($msg)
    {
       // die("<span style=\"color: red;\">Login Failed! " . $msg ."</span>");
        
        //die();
    }
    
endRequest:
    echo json_encode($status);
    
    ?>