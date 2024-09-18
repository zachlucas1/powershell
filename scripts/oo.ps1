enum colors {
    red = 0;
    blue = 1;
    green = 2;
}

class Circle {
    static $Pi=3.1415927
    [double]$Diameter
    [colors]$Color
    Circle(){} #constructor that doesn't accept any arguments
    Circle([double]$Diameter, [string]$Color){ #$<variable>=[circle]::new(<diameter>, '<color>')
        $this.Diameter=$Diameter
        $this.Color=$Color
    }
    static[double]Area([double]$Diameter){ #calculates area
        return [Circle]::Pi * [math]::pow($Diameter/2,2)
    }
    [double]Area(){ #instance method of area
        return [Circle]::Area($this.Diameter)
    }
    static[double]Circumference([double]$Diameter){ #caluclates circumference
        return [Circle]::Pi * $Diameter
    }
    [double]Circumference(){ #instance method of circumference
        return [Circle]::Circumference($this.Diameter)
    }
}

class Column:Circle{
    [double]$Height
    Column([double]$Diameter,[double]$Height):base($Diameter){
        $this.Height=$Height
    }
    static [double] Volume([double]$Diameter,[double]$Height){
        return [Circle]::Area($Diameter) * $Height
    }
    Column(){}
    [double]Volume(){ #instance method of volume
        return $this.Area() * $this.Height
    }
}