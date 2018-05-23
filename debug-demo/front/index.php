<?php
$res = (Object)['answer' => 'ok'];

header('Content-Type: application/json');
echo json_encode($res);

exit;
