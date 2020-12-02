<?php
    include("includes/header.php");
    if(!$session->is_signed_in()){
        redirect("login.php");
    }

    $user = new User();
    if(isset($_POST['create'])){
        if($user){
            $user->username = $_POST['username'];
            $user->first_name = $_POST['first_name'];
            $user->last_name = $_POST['last_name'];
            $user->password = $_POST['password'];
            $user->set_file($_FILES['user_image']);

            $user->upload_photo();
            $session->message("The user {$user->username} has been added");
            $user->save();
            redirect("users.php");
        }else{
            redirect("users.php");
        }
    }

?>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <!-- Brand and toggle get grouped for better mobile display -->
        <?php include("includes/top_nav.php"); ?>


        <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
        <?php include("includes/side_nav.php"); ?>
        <!-- /.navbar-collapse -->
    </nav>


    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Users
                        <small>Subheading</small>
                    </h1>

                    <form action="" method="post" enctype="multipart/form-data">
                        <div class="col-md-6 col-md-offset-3">
                            <div class="form-group">
                                <input type="file" name="user_image">
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input class="form-control" type="text" name="username">
                            </div>
                            <div class="form-group">
                                <label for="first_name">First Name</label>
                                <input class="form-control" type="text" name="first_name">
                            </div>
                            <div class="form-group">
                                <label for="last_name">Last Name</label>
                                <input class="form-control" type="text" name="last_name">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input class="form-control" type="password" name="password">
                            </div>
                            <input type="submit" class="btn btn-success pull-right" name="create">
                        </div>
                    </form>

                </div>
            </div>
            <!-- /.row -->

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

<?php include("includes/footer.php"); ?>