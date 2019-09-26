
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>création de qcm</title>
        <link rel="stylesheet" href="../public/css/index.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
        crossorigin="anonymous">
    </head>
    <body>

        <div class="d-flex">
            <H1>Créer une question</H1>
        </div>

        <form action="../modele/addQuestion.php?id=<?php echo $_GET['id']; ?>" method="post">
            <div class="form-group">
                <strong><label for="label_question">
                <input type="text" name="label_question" class="form-control" placeholder="label_question">
                </label></strong>
                <br>
                <label for="question">
                <input type="text" name="question" class="form-control" placeholder="question">
                </label>
                <br>
                <label for="code">
                <input type="text" name="code" class="form-control" placeholder="code">
                </label>
                <br>
            </div>
            <button type="submit" name="add" class="btn btn-primary">Créer question</button>
        </form>
        

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
        crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
        crossorigin="anonymous"></script>
    </body>
</html>