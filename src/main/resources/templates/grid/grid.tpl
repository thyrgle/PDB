layout 'layout.tpl', true, title: 'Grid',
        content: contents {
            h1('Grid system')
            div (class:"row") {
                div(class:"centered") {
                    //form {
                      table (class:"table-bordered float inline") {
                         mapPointsForGrid.each { mapPoints ->
                            tr {
                                mapPoints.each { mapPoint ->
                                    td(bgcolor:mapPoint.terrain.colour) {
                                        input (id:mapPoint.id, value:mapPoint.id, name:"grid", class:"grid_point", type:"radio")
                                    }
                                }
                            }
                         }
                      }
                    //}
                }
            }
            div(class:"float inline square border") {
                div(class:"row centered") {
                    if(neighbors.get(banane.io.pdb.model.Direction.NORTH) != null) {
                        mapPoint = neighbors.get(banane.io.pdb.model.Direction.NORTH)
                        a(href:"/grid/movePlayer?mapPoint=${mapPoint.id}", class:"btn glyphicon glyphicon-arrow-up centered")
                    }
                }
                div(class:"row") {
                    if(neighbors.get(banane.io.pdb.model.Direction.WEST) != null) {
                        mapPoint = neighbors.get(banane.io.pdb.model.Direction.WEST)
                        a(href:"/grid/movePlayer?mapPoint=${mapPoint.id}", class:"btn glyphicon glyphicon-arrow-left")
                    }
                    if(neighbors.get(banane.io.pdb.model.Direction.EAST) != null) {
                        mapPoint = neighbors.get(banane.io.pdb.model.Direction.EAST)
                        a(href:"/grid/movePlayer?mapPoint=${mapPoint.id}", class:"btn glyphicon glyphicon-arrow-right")
                    }
                }

                div(class:"row centered") {
                    if(neighbors.get(banane.io.pdb.model.Direction.SOUTH) != null) {
                        mapPoint = neighbors.get(banane.io.pdb.model.Direction.SOUTH)
                        a(href:"/grid/movePlayer?mapPoint=${mapPoint.id}", class:"btn glyphicon glyphicon-arrow-down centered")
                    }
                }

            }
        }
