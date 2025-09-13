<?php
class Database {
    private $serverName;
    private $username;
    private $password;
    private $dbname;
    private $isActive;

    public function __construct() {
        $this->serverName = null; 
        $this->username = null;   
        $this->password = null;   
        $this->dbname = "/var/www/html/data/laboratorio2.db"; 
        $this->isActive = false;
    }

    public function conectar() {
        try {
            $dir = dirname($this->dbname);
            if (!file_exists($dir)) {
                mkdir($dir, 0755, true);
            }

            $con = new PDO("sqlite:" . $this->dbname);
            $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            
            $con->exec("CREATE TABLE IF NOT EXISTS tbadministrador (
                tbadministradorid INTEGER PRIMARY KEY,
                tbadministradoremail TEXT NOT NULL,
                tbadministradornombre TEXT NOT NULL,
                tbadministradorestadocuenta INTEGER NOT NULL DEFAULT 1
            )");

            $con->exec("CREATE TABLE IF NOT EXISTS tbservicio (
                tbservicioid INTEGER PRIMARY KEY,
                tbserviciocodigo TEXT NOT NULL,
                tbservicionombre TEXT NOT NULL,
                tbserviciodescripcion TEXT NOT NULL,
                tbservicioestado INTEGER NOT NULL DEFAULT 1
            )");

            $con->exec("CREATE TABLE IF NOT EXISTS tbsesion (
                tbsesionid INTEGER PRIMARY KEY,
                tbsesionrol TEXT NOT NULL CHECK(tbsesionrol IN ('ADMIN', 'PRODUCTOR')),
                tbsesionproductorid INTEGER,
                tbsesionadministradorid INTEGER,
                tbsesionusuarionombre TEXT NOT NULL UNIQUE,
                tbsesionusuariocontrasenia TEXT NOT NULL,
                tbsesionusuarioestado INTEGER NOT NULL DEFAULT 1
            )");

            $this->insertarDatosIniciales($con);

            $this->isActive = true;
            return $con;
        } catch(PDOException $e) {
            echo "Error de conexión: " . $e->getMessage();
            return null;
        }
    }

    private function insertarDatosIniciales($con) {
        $stmt = $con->query("SELECT COUNT(*) FROM tbadministrador");
        if ($stmt->fetchColumn() == 0) {
            $con->exec("INSERT INTO tbadministrador (tbadministradorid, tbadministradoremail, tbadministradornombre, tbadministradorestadocuenta) VALUES 
                (1, 'admin@gmail.com', 'Admin', 1)");
        }

        $stmt = $con->query("SELECT COUNT(*) FROM tbsesion");
        if ($stmt->fetchColumn() == 0) {
            $con->exec("INSERT INTO tbsesion (tbsesionid, tbsesionrol, tbsesionproductorid, tbsesionadministradorid, tbsesionusuarionombre, tbsesionusuariocontrasenia, tbsesionusuarioestado) VALUES 
                (1, 'ADMIN', NULL, 1, 'admin@gmail.com', '\$2y\$10\$I1Vs3gYfln9XP0JDtaMZB.OV5qU1FX9Cx/T4Syw2LsJuOBeQB42/2', 1)");
        }

        $stmt = $con->query("SELECT COUNT(*) FROM tbservicio");
        if ($stmt->fetchColumn() == 0) {
            $con->exec("INSERT INTO tbservicio (tbservicioid, tbserviciocodigo, tbservicionombre, tbserviciodescripcion, tbservicioestado) VALUES 
                (1, 'ADM-3030', 'Transporte', 'Uber', 1)");
        }
    }
}
?>