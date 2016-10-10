
<?php
    // Create connection
    //hostname: localhost
    //username: root
    //password:
    //dbname: mydb
    $con=mysql_connect("localhost","root","");
    $db = mysql_select_db("mydb", $con);
    
    $status = array("status"=>"-1",
                    "session"=>"0");
    
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
    $sessionLogoff = $_POST["sid"];
    
    logoutUser($sessionLogoff, $status);
    
    
    function logoutUser($sid, $sts)
    {
        $con=mysql_connect("localhost","root","");
        $db = mysql_select_db("mydb", $con);
        //now connected and sent correct credentials, check to see if a session already exists
        $query = sprintf("DELETE FROM sessions WHERE sessionID='%s'",
                         mysql_real_escape_string($sid) );
        // Perform Query
        $result = mysql_query($query, $con);      //returns userID
        $sts["session"]="1";
        mysql_close($con);
    }
    
    
    
    // Free the resources associated with the result set
    // This is done automatically at the end of the script
    
    echo json_encode($status);
    
    ?>



















