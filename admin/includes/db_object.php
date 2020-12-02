<?php

class Db_object{
    public $errors = array();
    public $upload_errors_array = array(
        UPLOAD_ERR_OK=>"There is no error, the file uploaded with success.",
        UPLOAD_ERR_INI_SIZE=>"The uploaded file exceeds the upload_max_filesize directive in php.ini.",
        UPLOAD_ERR_FORM_SIZE=>"The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form.",
        UPLOAD_ERR_PARTIAL=>"The uploaded file was only partially uploaded.",
        UPLOAD_ERR_NO_FILE=>"No file was uploaded.",
        UPLOAD_ERR_NO_TMP_DIR=>"Missing a temporary folder.",
        UPLOAD_ERR_CANT_WRITE=>"Failed to write file to disk.",
        UPLOAD_ERR_EXTENSION=>"A PHP extension stopped the file upload."
    );

    public static function find_all(){
        return static::find_by_query("SELECT * FROM " . static::$db_table );
    }

    public static function find_by_id($id){
        $result_set_array = static::find_by_query("SELECT * FROM ". static::$db_table ." WHERE id=".$id." LIMIT 1");
//        if(!empty($result_set_array)){
//            $first_item = array_shift($result_set_array);
//            return $first_item;
//        }else{
//            return false;
//        }
        return !empty($result_set_array) ? array_shift($result_set_array) : false;
    }

    public static function find_by_query($sql){
        global $database;
        $result_set = $database->query($sql);
        $the_object_array = array();
        while ($row = mysqli_fetch_array($result_set)){
            $the_object_array[] = static::instantiation($row);
        }
        return $the_object_array;
    }

    public static function instantiation($the_record){
        $calling_class = get_called_class();
        $the_object = new $calling_class();
//        $the_object->id = $found_user['id'];
//        $the_object->username = $found_user['username'];
//        $the_object->password = $found_user['password'];
//        $the_object->first_name = $found_user['first_name'];
//        $the_object->last_name = $found_user['last_name'];
        foreach ($the_record as $the_attribute => $value){
            if($the_object->has_the_attribute($the_attribute)){
                $the_object->$the_attribute = $value;
            }

        }

        return $the_object;
    }

    private function has_the_attribute($the_attribute){
        $object_properties = get_object_vars($this);
        return array_key_exists($the_attribute, $object_properties);
    }

    protected function properties(){
        $properties = array();
        foreach (static::$db_table_fields as $db_table_field){
            if(property_exists($this, $db_table_field)){
                $properties[$db_table_field] = $this->$db_table_field;
            }
        }
        return $properties;
    }

    protected function clean_properties(){
        global $database;
        $clean_properties = array();

        foreach ($this->properties() as $key => $value){
            $clean_properties[$key] = $database->escape_string($value);
        }

        return $clean_properties;
    }


    public function save(){
        return isset($this->id) ? $this->update() : $this->create();
    }

    public function create(){
        global $database;

        $properties = $this->clean_properties();

        $sql = "INSERT INTO ". static::$db_table ."(" . implode(",", array_keys($properties)) . ")";
        $sql .= "VALUES ('" . implode("', '", array_values($properties)) . "')";

        if($database->query($sql)){
            $this->id = $database->the_insert_id();
            return true;
        }else{
            return false;
        };
    }


    public function update(){
        global $database;

        $properties = $this->clean_properties();
        $properties_pairs = array();
        foreach ($properties as $key => $value){
            $properties_pairs[] = "{$key}='{$value}'";
        }

        $sql = "UPDATE ". static::$db_table ." SET ";
        $sql .= implode(", ", $properties_pairs);
        $sql .= "WHERE id = " . $database->escape_string($this->id);

        $database->query($sql);
        return ($database->row_affected() == 1) ? true : false;
    }

    public function delete(){
        global $database;
        $sql = "DELETE FROM ". static::$db_table ." WHERE id = " . $database->escape_string($this->id);
        $sql .= " LIMIT 1";
        $database->query($sql);
        return ($database->row_affected() == 1) ? true : false;
    }

    public static function count_all(){
        global $database;
        $sql = "SELECT COUNT(*) FROM " . static::$db_table;
        $result_set = $database->query($sql);
        $row = mysqli_fetch_array($result_set);

        return array_shift($row);
    }
}