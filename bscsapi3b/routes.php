<?php
 require_once("./config/Connection.php");
 require_once("./modules/Get.php");
 require_once("./modules/Post.php");
 require_once("./modules/Auth.php");

 $db = new Connection();
 $pdo = $db->connect();
 $get = new Get($pdo);
 $post = new Post($pdo);
 $auth = new Auth($pdo);

 $req=[];
 if(isset($_REQUEST['request'])) {
  $req = explode('/', rtrim($_REQUEST['request'], '/'));
 } else {
  $req = array("errorcatcher");
 }

 switch($_SERVER['REQUEST_METHOD']) {
  case 'GET':
    echo "No public API available";
  break;

  case 'POST':
    $d = $auth->decryptData(file_get_contents("php://input"));
    // $d = json_decode(file_get_contents("php://input"));
    switch($req[0]) {
      case 'getstudents':
        echo $auth->encryptData($get->getStudents($req[1]));
        // echo json_encode($get->getStudents($req[1]));
      break;

      case 'addstudent':
        echo json_encode($post->insertRecord($d));
      break;

      case 'updatestudent':
        echo json_encode($post->updateRecord($d));
      break;

      case 'deletestudent':
        echo json_encode($post->deleteRecord($d));
      break;

      //sample
      case 'encryptpword':
        echo json_encode($auth->encryptPassword("Sample Password"));
      break;

      case 'checkpword':
        echo json_encode($auth->checkPassword('Sample Password', '$2y$10$ZGE2ZTM1YWVjNDBhNjYwZeJzuZjiES2I5mj2u8gbOVvn67AdUxLq6'));
      break;

      case 'encryptdata':
        echo json_encode($auth->encryptData(array("data"=>"Hello World")));
      break;

      case 'decryptdata':
        echo json_encode($auth->decryptData("eyJkYXRhIjoiXC9KUWE5UlVQaVQxVEdoY2p6amRhVWp6TTVKTHZHWVdROGxzM1lMc2lwV0k9IiwiaXYiOiJNakptWkRReU5ESmlaVGN3WXpjME1EYzBOek5oWXpJNE1XWTRZall3TldJPSJ9"));
      break;


      default:
        echo "Invalid endpoint";
    }
  break;

  default:
    echo "here in default";
 }