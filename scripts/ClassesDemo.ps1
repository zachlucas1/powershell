#IN CLASS NOVEMBER 9, 2021
#REMEMBER TO RUN THE CODE TO APPLY THE SAVE AND THEN YOU CAN TYPE IN THE TERMINAL

#get devices on the network
class device { #to add things to this class type <$<variable_name>.(computername or ipaddress)> and fill in data
    [string]$computername
    [net.ipaddress]$ipaddress
}
class Metal { #change the working directory to psfiles/data and access the metals.csv file
    static $maxmeltingpoint=5000
    [string]$Symbol
    [string]$Name
    [Int]$MeltingPoint
    [Int]$SpecificGravity
}
class circle{ #to add things to this class type <$<variable_name>.radius> and you can get an area
    static hidden $pi=3.1415926 #hidden static object
    $radius=0
    circle(){} #default constructor
    circle($radius){
        $this.radius=$radius
    }
    static [double]Area($radius){ #to get area type [circle]::area(<radius>) in the terminal
        return [circle]::Pi * [math]::pow($radius,2) #radius to the power of 2
    }
    [double]Area(){
        return [circle]::Pi * [math]::pow($this.radius,2)
    }
}
class BetterCircle:circle { #this just adds onto the circle class
    $color='green'
    [double]Circumference(){
        return 2 * [math]::Pi * $this.radius
    }
}