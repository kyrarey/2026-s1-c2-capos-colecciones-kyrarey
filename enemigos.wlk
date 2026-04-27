import capos.*

object erethia {
    const enemigos = [caterina, archibaldo, astra]

    method enemigos() = enemigos
}

//2.3
object caterina {
    var morada = fortalezaDeAcero
    const poderBase = 28

    method morada() =  morada

    method morada(lugar) {
        morada = lugar
    }
}

object fortalezaDeAcero {
    var dueño = caterina

    method dueño() = dueño
}

object archibaldo {
    var morada = palacioDeMarmol
    const poderBase = 16

    method morada() = morada

    method morada(lugar) {
        morada = lugar
    }

}

object palacioDeMarmol {
    var dueño = archibaldo

    method dueño() = dueño
}

object astra {
    var morada = torreDeMarfil
    const poderBase = 14

    method morada() = morada

    method morada(lugar) {
        morada = lugar
    }
}

object torreDeMarfil {
    var dueño = astra

    method dueño() = dueño

    // method conquistarMorada(nuevoDueño) {
    //     dueño.morada(null) //se queda sin morada --> no es necesario
    //     dueño = nuevoDueño
    // }
}