<?php
class Get {
  private $pdo;

  public function __construct(\PDO $pdo) {
    $this->pdo = $pdo;
  }

  public function getStudents($param) {
    $sql = "SELECT * FROM students";
    if ($param) {
      $sql.=" WHERE studno=?";
    }
    $res = [];
    try {
      $stmt = $this->pdo->prepare($sql); 
      $stmt->execute($param ? [$param] : null);
      $res = $stmt->fetchAll();
    } catch (\PDOException $er) {
      $res = array(
        "msg"=>"Unable to fetch data", 
        "error"=>$er->getMessage(),
        "code"=>$er->getCode()
      );
    }
    return $res;
  }
}