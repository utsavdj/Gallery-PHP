<?php
    include("includes/init.php");
    if(!$session->is_signed_in()){
        redirect("login.php");
    }

    if(empty($_GET['id'])){
        redirect("comments.php");
    }else{
        $comment = Comment::find_by_id($_GET['id']);
        if($comment){
            $session->message("The {$comment->id} comment has been deleted");
            $comment->delete();
            redirect("comment_photo.php?id={$comment->photo_id}");
        }else{
            redirect("comment_photo.php?id={$comment->photo_id}");
        }
    }



