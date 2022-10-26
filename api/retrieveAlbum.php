<?php
    include "config.php";

    // needed to see error messages
    ini_set('display_errors', 1);

    $count = $_GET["count"];
    if (preg_match('/^([0-9]|10|11)$/', $count) != 1) {
        die("ERROR : photo count must be provided and be in the range of 0-11");
    }

    try {
        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        } 

        // query the data
        $sql = "SELECT * FROM tblPhotos LIMIT " . $count;
        $result = $conn->query($sql);

        // construct an empty array
        $photos = [];
        while($row = $result->fetch_assoc()) {
            // construct an empty generic object
            $newPhoto = new stdClass();
            $newPhoto->id = htmlspecialchars($row["id"]);
            $newPhoto->title = htmlspecialchars($row["title"]);
            $newPhoto->caption = htmlspecialchars($row["caption"]);
            $newPhoto->source = htmlspecialchars($row["source"]);
            $newPhoto->comments = [];

            $sql = "SELECT * FROM tblComments WHERE photoId=" . $newPhoto->id . " ORDER BY id DESC";

            $commentResult = $conn->query($sql);
            while($commentRow = $commentResult->fetch_assoc()) {
                $newComment = new stdClass();
                $newComment->comment = htmlspecialchars($commentRow["comment"]);
                $newComment->author = htmlspecialchars($commentRow["author"]);
                $newPhoto->comments[] = $newComment;
            }

            // this is a push in PHP
            $photos[] = $newPhoto;
        }

        header("Content-type: application/json");
        // put photos array into a root object (JSON requires root object)
        $root = new stdClass();
        $root->photos = $photos;
        // encode into a JSON string as response
        echo json_encode($root);

    } finally {
        $conn->close();
    }
?>