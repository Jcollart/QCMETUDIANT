<?php
  include_once '../controller/QuestController.php';
  $questcontroller = new QuestController;
//   $result = $questcontroller->affiche_quizz(93);
?>
<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $result[0]['titre'],$_GET['id']; ?></title>
    <link rel="stylesheet" href="../public/css/index.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   // debut boucle 
    <div class="affiche d-flex text-center justify-content-center column">
        
        <div class="main_question">
            <label for="inputName">Ecrivez votre code :</label><br>
            <input type="name" class="form-control" id="code" placeholder="Entrez votre code"><br>
            <br><br>
            <p class="error text-danger" style="font size=+3">Mauvais code, Essayez de nouveau</p>
            <button class="btn btn-secondary"  value="fonctions.php" data-id="44" onclick="test(this)"> Envoi du code </button>
        </div>
 
    </div>

    // fin boucle
           <?php
        // <div>
        //    <h1><?php //echo $result[0]['titre']</h1>

         //   for($j = 0; $j < sizeof($result) ; $j++){
         //       if($j == 0) {
          //          $tmp = $result[0]['id'];
         //           echo '<form class="affiche p-2" action="../modele/endqcm.php" method="POST">';
         //           echo '<div class="affiche p-2" data-id="'.$result[$j]['id'].'" onclick="test(this)"';
         //           echo '<h2>';
         //           echo $result[$j]['label_question'].'</h2><br>';
         //           echo '<h3>';
         //           echo $result[$j]['question'].'</h3><br>' ;}
         //       
        
          //          if($result[$j]['id'] != $tmp){
          //          $tmp = $result[$j]['id'];
         //           echo '</div><br><div class="affiche" data-id="'.$result[$j]['id'].'"  onclick="test(this)"><h2>';
         //           echo $result[$j]['label_question'].'</h2><br>';
          //          echo $result[$j]['question'].'</h2><br>';
         //           ?>

     <!--        <div class="form-check">
                <input type="checkbox" class="form-check-input" name="answer<?php echo $j ?>"
            //        value="<?= $result[$j]['valid'] ?>">
            //    <label class="form-check-label" for="answer<?php echo $j ?>"><?= $result[$j]['reponse'] ?></label>
            </div>
            
            <?php
              //  } else { ?>
            <div class="form-check">
                <input type="checkbox" class="form-check-input" name="answer<?php// echo $j ?>"
                    value="<?= $result[$j]['valid'] ?>">
                <label class="form-check-label" for="answer<?php echo $j ?>"><?= $result[$j]['reponse'] ?></label><br>
                
                </div>
                </div>-->
                <?php // }}?>
                
            <!--    <button type="submit" name="endqcm">Valider mes réponses</button>
                </div>
                </form>
                </div>-->
               
            

            
               
            
         


                <?php //  }} 
  
 ?>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" 
integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
    </script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
    </script>
<script>
    function test(e){
        var code= $("#code").val();
        var id= $(e).data('id');
        $.ajax({
            url: "./fonctions.php", 
            method:"post",
            data: {
                code: code,
                id: id
            },
            dataType: 'json',
            success: function(res){
                console.log('on est allé dans la fonction');
                var html = '';
                for (i = 0; i < res.length; i++) {
                    if(i == 0){
                        var tmp = res[0]['id'];
                        html += '<form class=" p-2" action="../modele/endqcm.php" method="POST">';
                        html += '<div class=" t p-2" data-id="'+res[0]['id']+'" onclick="test(this)"'; // 1
                        html += '<h2>';
                        html += res[0]['label_question']+'</h2><br>';
                        html += '<h3>';
                        html += res[0]['question']+'</h3><br></div>';
                    }

                    if(res[i]['id'] != tmp){
                        tmp = res[i]['id'];
                        html += '<br><div class="" data-id="'+res[i]['id']+'"  onclick="test(this)"><h2>'; // 1* 1
                        html += res[i]['label_question']+'</h2><br>';
                        html += res[i]['question']+'</h2><br>';
                        html += '<div class="form-check">'; // 2
                        html += '<input type="checkbox" class="form-check-input" name="answer"'+i+'"';
                        html += 'value="'+res[i]['valid']+'">';
                        html += '<label class="form-check-label" for="answer'+i+'">'+res[i]['reponse']+'></label></div>'; // 2*
                    } else {
                        html += '<div class="form-check">'; // 2
                html += '<input type="checkbox" class="form-check-input" name="answer'+i+'"';
                    html += 'value="'+res[i]['valid']+'">';
                html += '<label class="form-check-label" for="answer'+i+'">'+res[i]['reponse']+'</label><br></div></div>'; // 2* 1*
                    }
                }
                
                html += '<button type="submit" name="endqcm">Valider mes réponses</button></div></form>';

                    $(e).parent().html(html);
                    // console.log(res[i]['question']);
		        

            },
            error: function(res){
                console.log('on est pas rentré dans la fonction');
            },
        })
    }
</script>


 </body>
 </html>





































