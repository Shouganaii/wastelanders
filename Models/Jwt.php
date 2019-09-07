<?php
namespace Models;

use \Core\Model;

class Jwt extends Model
{

    public function create($data)
    {
        $header = json_encode(array("typ" => "JWT", "alg" => "HS256"));

        $payload = json_encode($data);

        $hbase = $this->base64_urlencode($header);
        $pbase = $this->base64_urlencode($payload);

        $signature = hash_hmac("sha256", $hbase . "." . $pbase, "abC123!", true);
        $bsig = $this->base64_urlencode($signature);

        $jwt = $hbase . "." . $pbase . "." . $bsig;
        return $jwt;
    }
    public function validate($jwt)
    {
        $array = array();
        $jwt_splits = explode('.', $jwt);
        if (count($jwt_splits) == 3) {
            $signature = hash_hmac("sha256", $jwt_splits[0] . "." . $jwt_splits[1], "abC123!", true);
            $bsig = $this->base64_urlencode($signature);
            if ($bsig == $jwt_splits[2]) {
                $array = json_decode($this->base64_urldecode($jwt_splits[1]));
            }
        }
        return $array;
    }
    private function base64_urlencode($data)
    {
        return rtrim(strtr(base64_encode($data), '+/', '-_'), '=');
    }
    private function base64_urldecode($data)
    {
        return base64_decode(strtr($data, '-_', '+/') . str_repeat('=', 3 - (3 + strlen($data)) % 4));
    }
}
