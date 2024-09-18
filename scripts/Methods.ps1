class Circle {
    static $Pi=3.1415927
    [double]$Diameter
    [string]$Color
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