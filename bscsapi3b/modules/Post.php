<?php
class Post {
  private $pdo;

  public function __construct(\PDO $pdo) {
    $this->pdo = $pdo;
  }

  public function insertRecord($param) {
    $dt = $param->payload[0];
    $sql = "INSERT INTO students (studno, fname, mname, lname, birthdate, email) VALUES (?,?,?,?,?,?)";
 
    try {
      $stmt = $this->pdo->prepare($sql); 
      $stmt->execute([
        $dt->studno,
        $dt->fname,
        $dt->mname,
        $dt->lname,
        $dt->birthdate,
        $dt->email
      ]);
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

  public function updateRecord($param) {
    $dt = $param->payload[0];
    $sql = "UPDATE students SET fname=?, mname=?, lname=?, birthdate=?, email=? WHERE studno=?";
 
    try {
      $stmt = $this->pdo->prepare($sql); 
      $stmt->execute([
        $dt->fname,
        $dt->mname,
        $dt->lname,
        $dt->birthdate,
        $dt->email,
        $dt->studno
      ]);
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

  public function deleteRecord($param) {
    $dt = $param->payload[0];
    $sql = "DELETE FROM students WHERE studno=?";
 
    try {
      $stmt = $this->pdo->prepare($sql); 
      $stmt->execute([
        $dt->studno
      ]);
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