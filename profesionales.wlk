import provincias.*
import servicios.*



object vinculado {
    
    method pciasHabilitadas(unProf) = #{unProf.universidad().localizacionPcia()}
    method honorario(unProf) = unProf.universidad().honorariosRecomendados()
}

object delLitoral {
  
    method pciasHabilitadas(unProf) = #{entreRios, santaFe, corrientes}
    method honorario(unProf) = 3000
}

object libres {
    var property pciasConHabilitacion = #{}
    var honorario = 0

    method honorario(unProf) = honorario
    method nuevoHonorario(unHono) {honorario = unHono}

    method pciasHabilitadas(unProf) = pciasConHabilitacion

    method adherirProvincia(unaPcia) = pciasConHabilitacion.add(unaPcia)
    method removerProvincia(unaPcia) = pciasConHabilitacion.remove(unaPcia)
}