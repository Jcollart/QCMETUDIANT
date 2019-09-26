<?php

    include_once '../controller/Connexion.php';

    class Qcm{
        private $titre;
        
        public function getAll(){
            $bdd = new Connexion();
            $co = $bdd->openConnexion();

            $sql = "SELECT * FROM qcm";

            $req = $co->prepare($sql);
            $req->execute();
        }

        public function getId(){

        }
        

        
    }
?>