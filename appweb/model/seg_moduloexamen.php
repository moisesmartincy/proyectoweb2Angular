<?php
include_once "../core/ModeloBasePDO.php";
class Seg_moduloModel extends ModeloBasePDO
{
   public function __construct()
   {
      parent::__construct();
   }

   public function findall()
   {
      $sql = " SELECT id,nombre,descripcion,destino,duracion,precio,cupo,contacto
 FROM promociones_turisticas ";
      $param = array();
      return parent::gselect($sql, $param);
   }


   public function findpaginateall($p_filtro, $p_limit, $p_offset)
   {
      $sql = " SELECT id,nombre,descripcion,destino,duracion,precio,cupo,contacto
      FROM promociones_turisticas
 WHERE upper(concat(IFNULL(id,''),IFNULL(nombre,''),IFNULL(descripcion,''),IFNULL(destino,''),IFNULL(duracion,''),IFNULL(precio,''),IFNULL(cupo,''),IFNULL(contacto,''))) like  CONCAT('%',upper(IFNULL(:p_filtro,'' )), '%') 
 limit :p_limit 
 offset :p_offset  ";
      $param = array();
      array_push($param, [':p_filtro', $p_filtro, PDO::PARAM_STR]);
      array_push($param, [':p_limit', $p_limit, PDO::PARAM_INT]);
      array_push($param, [':p_offset', $p_offset, PDO::PARAM_INT]);
      $var =  parent::gselect($sql, $param);
      $sqlCount = "SELECT count(1) as cant FROM promociones_turisticas 
       WHERE upper(concat(IFNULL(id,''),IFNULL(nombre,''),IFNULL(descripcion,''),IFNULL(destino,''),IFNULL(duracion,''),IFNULL(precio,''),IFNULL(cupo,''),IFNULL(contacto,''))) like  CONCAT('%',upper(IFNULL(:p_filtro,'' )), '%')";
      $param = array();
      array_push($param, [':p_filtro', $p_filtro, PDO::PARAM_STR]);
      $var1 =  parent::gselect($sqlCount, $param);
      $var['LENGTH'] = $var1['DATA'][0]['cant'];
      return $var;
   }
   function findId($p_id)
   {
      $sql = "SELECT id,nombre,descripcion,destino,duracion,precio,cupo,contacto
      FROM promociones_turisticas
   WHERE id = :p_id; ";
      $param = array();
      array_push($param, [':p_id', $p_id, PDO::PARAM_STR]);
      $var = parent::gselect($sql, $param);
      return $var;
   }
   public function insert($p_id, $p_nombre, $p_descripcion, $p_destino,$p_duracion,$p_precio,$p_cupo,
   $p_contacto)
   {
      $sql = "INSERT INTO promociones_turisticas(id,nombre,descripcion,destino,duracion,precio,cupo,contacto) 
      VALUES (:p_id, :p_nombre, :p_descripcion, :p_destino, :p_destino, :p_duracion, :p_precio, :p_cupo, :p_contacto, now()); ";
      $param = array();
      array_push($param, [':p_id', $p_id, PDO::PARAM_STR]);
      array_push($param, [':p_nombre', $p_nombre, PDO::PARAM_STR]);
      array_push($param, [':p_descripcion', $p_descripcion, PDO::PARAM_STR]);
      array_push($param, [':p_destino', $p_destino, PDO::PARAM_STR]);
      array_push($param, [':p_duracion', $p_duracion, PDO::PARAM_STR]);
      array_push($param, [':p_precio', $p_precio, PDO::PARAM_STR]);
      array_push($param, [':p_cupo', $p_cupo, PDO::PARAM_STR]);
      array_push($param, [':p_contacto', $p_contacto, PDO::PARAM_STR]);
      $var = parent::ginsert($sql, $param);
      return $var;
   }
   public function update($p_id, $p_nombre, $p_descripcion, $p_destino,$p_duracion,$p_precio,$p_cupo,
   $p_contacto)
   {
      $sql = "UPDATE promociones_turisticas 
     SET id=:p_id, 
     descripcion=:p_descripcion, 
     destino=:p_destino,
     duracion=:p_duracion,
     precio=:p_precio,
     cupo=:p_cupo, 
     contacto=now()
      WHERE id=:p_id; ";
      $param = array();
      array_push($param, [':p_id', $p_id, PDO::PARAM_STR]);
      array_push($param, [':p_nombre', $p_nombre, PDO::PARAM_STR]);
      array_push($param, [':p_descripcion', $p_descripcion, PDO::PARAM_STR]);
      array_push($param, [':p_destino', $p_destino, PDO::PARAM_STR]);
      array_push($param, [':p_duracion', $p_duracion, PDO::PARAM_STR]);
      array_push($param, [':p_precio', $p_precio, PDO::PARAM_STR]);
      array_push($param, [':p_cupo', $p_cupo, PDO::PARAM_STR]);
      array_push($param, [':p_contacto', $p_contacto, PDO::PARAM_STR]);
      $var = parent::gupdate($sql, $param);
      return $var;
   }
   function delete($p_id)
   {

      $sql = "DELETE FROM promociones_turisticas WHERE id=:p_id ";
      $param = array();
      array_push($param, [':p_id', $p_id, PDO::PARAM_STR]);
      $var = parent::gdelete($sql, $param);
      return $var;
   }
}
