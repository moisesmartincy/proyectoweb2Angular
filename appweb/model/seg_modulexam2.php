<?php
include_once "../core/ModeloBasePDO.php";

class seg_modulexam2 extends ModeloBasePDO
{
    public function __construct()
    {
        parent::__construct();
    }

    public function findAll()
    {
        $sql = "SELECT id, nombre, descripcion, destino, duracion, precio, cupo, contacto FROM promociones_turisticas";
        $param = array();
        return parent::gselect($sql, $param);
    }


    public function findPaginateAll($p_filtro, $p_limit, $p_offset)
    {
        $sql = "SELECT id, nombre, descripcion, destino, duracion, precio, cupo, contacto
                FROM promociones_turisticas
                WHERE UPPER(CONCAT(IFNULL(id,''),IFNULL(nombre,''),IFNULL(descripcion,''),IFNULL(destino,''),IFNULL(duracion,''),IFNULL(precio,''),IFNULL(cupo,''),IFNULL(contacto,''))) 
                LIKE CONCAT('%', UPPER(IFNULL(:p_filtro, '')), '%') 
                LIMIT :p_limit 
                OFFSET :p_offset";
        $param = array(
            ':p_filtro' => $p_filtro,
            ':p_limit' => $p_limit,
            ':p_offset' => $p_offset
        );
        $var = parent::gselect($sql, $param);
        $sqlCount = "SELECT COUNT(1) as cant FROM promociones_turisticas 
                     WHERE UPPER(CONCAT(IFNULL(id,''),IFNULL(nombre,''),IFNULL(descripcion,''),IFNULL(destino,''),IFNULL(duracion,''),IFNULL(precio,''),IFNULL(cupo,''),IFNULL(contacto,''))) 
                     LIKE CONCAT('%', UPPER(IFNULL(:p_filtro, '')), '%')";
        $var1 =  parent::gselect($sqlCount, $param);
        $var['LENGTH'] = $var1['DATA'][0]['cant'];
        return $var;
    }

    public function findId($p_id)
    {
        $sql = "SELECT id, nombre, descripcion, destino, duracion, precio, cupo, contacto
                FROM promociones_turisticas
                WHERE id = :p_id";
        $param = array(':p_id' => $p_id);
        $var = parent::gselect($sql, $param);
        return $var;
    }

    public function insert($p_nombre, $p_descripcion, $p_destino, $p_duracion, $p_precio, $p_cupo, $p_contacto)
    {
        $sql = "INSERT INTO promociones_turisticas(nombre, descripcion, destino, duracion, precio, cupo, contacto, fh_cre) 
                VALUES (:p_nombre, :p_descripcion, :p_destino, :p_duracion, :p_precio, :p_cupo, :p_contacto, now())";
        $param = array(
            ':p_nombre' => $p_nombre,
            ':p_descripcion' => $p_descripcion,
            ':p_destino' => $p_destino,
            ':p_duracion' => $p_duracion,
            ':p_precio' => $p_precio,
            ':p_cupo' => $p_cupo,
            ':p_contacto' => $p_contacto
        );
        $var = parent::ginsert($sql, $param);
        return $var;
    }

    public function update($p_id, $p_nombre, $p_descripcion, $p_destino, $p_duracion, $p_precio, $p_cupo, $p_contacto)
    {
        $sql = "UPDATE promociones_turisticas 
                SET nombre = :p_nombre, descripcion = :p_descripcion, destino = :p_destino, duracion = :p_duracion, precio = :p_precio, cupo = :p_cupo, contacto = :p_contacto, fh_mod = now()
                WHERE id = :p_id";
        $param = array(
            ':p_id' => $p_id,
            ':p_nombre' => $p_nombre,
            ':p_descripcion' => $p_descripcion,
            ':p_destino' => $p_destino,
            ':p_duracion' => $p_duracion,
            ':p_precio' => $p_precio,
            ':p_cupo' => $p_cupo,
            ':p_contacto' => $p_contacto
        );
        $var = parent::gupdate($sql, $param);
        return $var;
    }

    public function delete($p_id)
    {
        $sql = "DELETE FROM promociones_turisticas WHERE id = :p_id";
        $param = array(':p_id' => $p_id);
        $var = parent::gdelete($sql, $param);
        return $var;
    }
}
