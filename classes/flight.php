<?php

class Flight extends DB
{
    public function insert_flight($flying_from, $flying_to, $departing_date, $returning_date, $seats)
    { 
        $sql2="INSERT INTO flights_list (flyingFrom,flyingTo,departingDate,returningDate,seats) VALUES('$flying_from','$flying_to','$departing_date','$returning_date','$seats')";

        $result = $this->connect()->query($sql2);
        return $result;
    }

    public function flightvalidation($flying_from,$flying_to,$departing_date,$returning_date,$seats)
    {
    if(empty($flying_from)){
        $error['flying_from']="flying from required";
    }
    if(empty($flying_to)){
        $error['flying_to']="flying to required";
    }
    if(empty($departing_date)){
        $error['departing_date']="departing date required";
    }
    if(empty($returning_date)){
        $error['returning_date']="returning date required";
    }
    if(empty($seats)){
        $error['seats']="seats number required";
    }
    return $error;
    }

}





?>