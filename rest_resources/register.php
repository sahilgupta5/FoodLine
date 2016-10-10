
<?php
    
    error_reporting(E_ERROR);
    
    // Create connection
    //hostname: localhost
    //username: root
    //password:
    //dbname: mydb
    $con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
    
    $status = array("status"=>"-1");
    
    // Check connection
    if (mysqli_connect_errno())
    {
      //  echo "Failed to connect to MySQL: " . mysqli_connect_error();
        $status["status"] = "-1";
    }
    elseif(!$con)
    {
        //echo "Database fail lol.";
        $status["status"] = "-1";
    }
    else
    {
      //  echo "Connection Success!";
        $status["status"] = "0";
    }
    
    //echo json_encode(array("status"=>1,"info"=>"asdasd","asd"=>"xxxxx"))."<br/>";
    
    // take user and pass values from login page
    $user_email = $_POST["email"];   // is the email
    $user_pass = $_POST["pass"];
    $user_fname = $_POST["fname"];
    $user_lname = $_POST["lname"];
    $user_phone = $_POST["phone"];
    
	if(strlen($user_email) == 0)
    {
        $user_email = $_GET["email"];   // is the email
        $user_pass = $_GET["pass"];
        $user_fname = $_GET["fname"];
        $user_lname = $_GET["lname"];
        $user_phone = $_GET["phone"];
		$vendorID = 0;
    }
    
    if(isUser($user_email))
    {
        //echo "Already a user.";
        $status["status"]="2";
        goto endRequest;
    }
    
    $con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
    
    // Formulate Query
    // This is the best way to perform an SQL query
    // For more examples, see mysql_real_escape_string()
    $query = sprintf("INSERT INTO users (firstname, lastname, phonenumber, email, password, vendorID) VALUES ('%s','%s','%s','%s','%s', '%s');",
                     mysql_real_escape_string($user_fname),
                     mysql_real_escape_string($user_lname),
                     mysql_real_escape_string($user_phone),
                     mysql_real_escape_string($user_email),
                     mysql_real_escape_string($user_pass),
					 mysql_real_escape_string($vendorID)
					 );
    //echo $query . "<br/>";
    // Perform Query
	//echo $query;
    $result = mysql_query($query, $con);      //returns userID
    //echo $result;                 
     // Check result
     // This shows the actual query sent to MySQL, and the error. Useful for debugging.
     if (!$result) {
         $message  = 'Invalid query: ' . mysql_error() . "\n";
         $message .= 'Whole query: ' . $query;
         //echo $message;
         $status["status"] = "-1";
         loginFailed($message);
         goto endRequest;
     }
    
    $status["status"] = "1";
    
    mysql_free_result($result);
    
    
    // Free the resources associated with the result set
    // This is done automatically at the end of the script
    mysql_close($con);
                     
    function loginOK($sts)
    {
        //echo "{session:" . $sessid . "}";
        
    }
    function loginFailed($msg)
    {
        //die("<span style=\"color: red;\">Login Failed! " . $msg ."</span>");
        
        //die();
    }
    
    function isUser($email)
    {
        $con=mysql_connect("localhost","root","");
        $db = mysql_select_db("mydb", $con);
        //now connected and sent correct credentials, check to see if a session already exists
        $query = sprintf("SELECT userID FROM users WHERE email='%s'",
                         mysql_real_escape_string($email) );
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
    
endRequest:
    echo json_encode($status);
    
    ?>