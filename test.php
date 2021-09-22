<?php
ini_set('max_execution_time', 3);

try {
    sleep(4);
    echo 'hi from php';
} catch (Exception $e){
    var_dump($e);
}
