<?php

class Reservation extends DB
{
    public function reserve_now($id_reservation, $fullName, $phone, $email, $num_passport,$departing,$returning,$adults,$children,$travel_class,$price,$idAir)
    {
        $request="INSERT INTO reservation VALUES($id_reservation,'$fullName','$phone','$email','$num_passport','$departing','$returning',$adults,$children,'$travel_class','$price','$idAir')";

        $result = $this->connect()->query($request);
        return $result;
    }

    

}
