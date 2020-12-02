<?php
    include("includes/init.php");
    if(!$session->is_signed_in()){
        redirect("login.php");
    }

    if(empty($_GET['id'])){
        redirect("users.php");
    }else{
        $user = User::find_by_id($_GET['id']);
        if($user){
            $session->message("The user {$user->username} has been deleted");
            $user->delete_user();
            redirect("users.php");
        }else{
            redirect("users.php");
        }
    }



