<?php
    include "config.php";

    // needed to see error messages
    ini_set('display_errors', 1);

    // Receive the RAW post data.
    $content = trim(file_get_contents("php://input"));

    // Attempt to decode the incoming RAW post data from JSON.
    // second parameter is whether it is decoded into associative arrays (true) or objects
    $json = json_decode($content, false);

    // pull out content
    $photoId = $json->photoId;
    $comment = $json->comment;
    $author = $json->author;

    try {
        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
    
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        } 

        // using PHP prepared statements to avoid SQL Injection errors (parameterized queries)
        $command = $conn->prepare("INSERT INTO tblComments (photoId,comment,author) VALUES (?,?,?)");
        // parameterized query
        $command->bind_param("iss",$photoId,$comment,$author);
    
        // make it happen!
        $command->execute();
        $command->close();
        
    } finally {
        // php will automatically close the connection when the script ends
        $conn->close();
    } 

    // redirect to the retrieve PHP page to get all data
    //header("Location: retrieveAlbum.php", true, 301);
    //exit();
?>